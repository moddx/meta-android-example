#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import os
import json
import logging
import tempfile

import pika
import shutil

import pyhelpers.config as configuration
import pyhelpers.logger as logger 
import pyhelpers.inject_cu_classname as inject
from pyhelpers.amqpadapter import AmqpAdapter

template_dir = os.path.expanduser("~/.Meta/template")
deployment_base_dir = os.path.expanduser("~/.Meta/deploy")

config = {}

def write_to_file(filename="default.ll", file_content="NULL"):
    output_path = os.path.join(os.getcwd(), filename)
    try:
        with open(output_path, 'w+') as f:
            f.write(file_content) 
    except IOError:
        print("ERROR: Could not write to file: '" + output_path + "'!")


def compile_file(id, ir_content):
    logging.info("### Entering Object file Compilation Phase ###")
#    logging.debug(":::: ir_content -> " + ir_content)

    # create temporary working directory
    tempFolder = tempfile.gettempdir()
    os.chdir(tempFolder)
    logging.debug("changed cwd to: " + os.getcwd())

    write_to_file(id + ".ll", ir_content)


    # assembling IR code to bitcode
    logging.info("-> assembling LLVM-IR to LLVM-Bitcode...")
    bc_file = id + ".bc"
    exitcode = os.system('llvm-as ' + id + '.ll')
    if exitcode != 0:
        logging.error("Could not assemble IR file to LLVM-Bitcode! ({})".format(id))
        os.remove(id + '.ll')
        return None

    # compile object file from bitcode via llc (low level compiler)
    object_file = id + ".o"
    logging.info("-> compiling to linkable object file...")
    exitcode = os.system('llc -relocation-model=pic -filetype=obj ' + bc_file + ' -o ' + object_file)
    if exitcode != 0:
        logging.error("Could not compile LLVM-Bitcode to linkable object file! ({})".format(id))
        os.remove(id + '.ll')
        return None

    logging.info("-> finished compilation chain!")


    # Removing temp files
    logging.info("-> removing IR file")
    os.remove(id + '.ll')

    logging.info("-> removing bitcode file")
    os.remove(bc_file)

    output_path = tempFolder + "/" + object_file
    logging.debug("-> object file was stored at: " + output_path)
    return output_path

def compile_service(id, classname, objectfile):
    logging.info("### Entering Project Compilation Phase ###")

    deployment_dir = deployment_base_dir + "/" + id
    build_dir = deployment_dir + "/build"

    # copy files to deployment_dir
    if os.path.exists(deployment_dir):
        logging.debug("-> Cleaning existing deployment_dir..")
        shutil.rmtree(deployment_dir)
    shutil.copytree(template_dir, deployment_dir)

    logging.info("-> copied template from: " + template_dir + " to " + deployment_dir)
    shutil.move(objectfile, deployment_dir + "/computeunit.o")
    logging.info("-> moved object file from: " + objectfile + " to " + deployment_dir + "/computeunit.o")

    # build the service
    os.chdir(build_dir)
    logging.debug("changed cwd to: " + os.getcwd())

    # inject cu class name
    logging.info("-> injecting ComputeUnit classname into main.cpp..")
    inject.inject_class_name("StubComputeUnit", classname, "..")

    # execute build command
    logging.info("-> building the service..")
    exitcode = os.system("cmake ..")
    if exitcode != 0:
        logging.error("Error running CMake! Could not prepare the build directory. ({})".format(id))
        return None
    exitcode = os.system("cmake --build .")
    if exitcode != 0:
        logging.error("Error running CMake! Could not build the service. ({})".format(id))
        return None

    executable = build_dir + "/meta-backend"
    if not os.path.isfile(executable):
        logging.error("Build failed!")
        return None

    logging.debug("-> Build succeded!")
    logging.info("-> Executable is located at: " + executable)
    return executable


def createIR(unit_base_path, id):
    logging.info("Compiling ComputeUnit to LLVM IR..")
    base = unit_base_path
    unit = base + id + ".cpp"
    includes = os.path.expanduser("~/dev/androidcpp/app/libs/meta/core/")

    logging.info("Creating IR file..")
    os.chdir(base)
    os.system("clang++ -stdlib=libc++ -std=c++11 -I" + includes + " -O3 -S -emit-llvm -fPIC " + unit)
    return base + "/" + id + ".ll"

def test(llfile="", id="MyComputeUnit"):
    global template_dir
    global deployment_base_dir

    template_dir = os.path.expanduser("~/dev/androidcpp/app/libs/meta/template")
    deployment_base_dir = os.path.expanduser("~/dev/androidcpp/app/libs/meta/deploy")

    # CREATE IR ########################
    if llfile == "":
        llfile = createIR(os.path.expanduser("~/dev/androidcpp/app/src/main/cpp/cunits/"), id)

    # LOAD IR INTO MEMORY ##########
    logging.info("Loading IR file into memory..")
    try:
        with open(llfile, "r") as f:
            ir_content = f.read()

        # COMPILE ######################
        logging.info("Compiling stuff..")
        # Compile Stuff
        objectfile = compile_file(id, ir_content)
        executable = compile_service(id, id, objectfile)
    except IOError as e:
        print("IOError in test(): {0}".format(e))

    print("Done.")

def onMessage(json_msg):
    logging.info("received ir with id {}".format(json_msg['Id']))

    objectfile = compile_file(json_msg["Id"], json_msg["Content"])
    if objectfile is None:
        logging.error('Could not generate linkable object file for {}! Aborting.'.format(json_msg['Id']))
        return None

    executable = compile_service(json_msg["Id"], json_msg["Classname"], objectfile)
    if executable is None:
        logging.error('Could not compile the service for {}! Aborting.'.format(json_msg['Id']))
        return None

    del json_msg['Classname']
    json_msg["Content"] = executable
    return json_msg


def main():
    logger.configure('compilation')
    if len(sys.argv) > 1:
        if sys.argv[1] == "-cpp":
            unitfolder = sys.argv[2]
            unitname = sys.argv[3]
            ir = createIR(unitfolder, unitname)
            test(ir, unitname)
        elif sys.argv[1] == "--usage":
            print(  "Usage: \n" +
                    "\tCreate standalone service via an LLVM IR file and the id (name) of the ComputeUnit:\n"
                    f"\t\t{sys.argv[0]} irfile id\n\n" +
                    "\tCreate standalone service via an ComputeUnit's source code and the id (name) of the ComputeUnit:\n"
                    f"\t\t{sys.argv[0]} -cpp cufolder id\n\n" +
                    "\tRun the compilation service as a daemon. Input is consumed via rabbitmq:\n"
                    f"\t\t{sys.argv[0]} -daemon\n"
                    )
            return
        else:
            irfile = sys.argv[1]
            unitname = sys.argv[2]
            test(irfile, unitname)
    else:
        config = configuration.load()
        if config is None:
            logging.error('Could not load config! Aborting.')
            sys.exit(1)

        amqp = AmqpAdapter(config, onMessage)
        amqp.subscribe()

# starting main method
if __name__ == '__main__':
    main()
