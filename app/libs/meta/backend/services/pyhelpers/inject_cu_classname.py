#!/usr/bin/python3
# -*- coding: utf-8 -*-

# inject_cu_classname.py <class name> <path to backend>
#
# Injects the desired ComputeUnit implementation class name into the 
# main.cpp of the backend, replacing the default StubComputeUnit.


import argparse
import os

def inject_class_name(stub, classname, path):
    mainfile = path + "/main.cpp"

    # check class name is not empty
    if classname == "":
        print("The classname must not be empty!\nAborting.")
        return False
    # check for main.cpp's existence
    if not os.path.isfile(mainfile):
        print("Could not find main.cpp in '" + path + "'.\nAborting.")
        return False
    
    # do it
    try:
        # read main.cpp into memory
        with open(mainfile, "r") as f:
            filedata = f.read()
        # inject
        filedata = filedata.replace(stub, classname)
        # write the result out again
        with open(mainfile, "w") as f:
            f.write(filedata)
    except IOError:
        print("Could not modify file!")
        return False

    print("Success!")
    return True

def main():
    parser = argparse.ArgumentParser(description="Injects the desired ComputeUnits class name into the backend.")
    parser.add_argument("classname", metavar="classname",
            help="class name of the ComputeUnit to inject")
    parser.add_argument("backendpath", metavar="path",
            help="path to the backend source files. this folder should contain the main.cpp.")
    parser.add_argument("--stub", metavar="classname", 
            default="StubComputeUnit", help="class name of the stub to replace")
    args = parser.parse_args()

    print("stub: " + args.stub)
    print("classname: " + args.classname)
    print("backendpath: " + os.path.abspath(args.backendpath))
    inject_class_name(args.stub, args.classname, os.path.abspath(args.backendpath))

if __name__ == '__main__':
    main()
