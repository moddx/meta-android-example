#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import sys
import time
import json
import errno
import logging
import subprocess

import pika
import shutil

import pyhelpers.config as configuration
import pyhelpers.logger as logger
from pyhelpers.amqpadapter import AmqpAdapter

config = {}


def create_dirs_if_needed(path):
    if not os.path.exists(path):
        try:
            os.makedirs(path)
        except OSError as e:
            if e.errno != errno.EEXISTS:
                logging.error("could not create folder: " + path + " due to error" + e)
                raise


def get_service_config(ident):
    service_config = {}
    service_config["host"] = "127.0.0.1"
    service_config["port"] = 5672

    exchange = "meta.production"
    read_queue = ident + "-work"
    write_queue = ident + "-result"

    service_config["exchange"] = exchange
    service_config["read_queue"] = exchange + "." + read_queue
    service_config["read_routing_key"] = read_queue + ".*"

    service_config["write_queue"] = exchange + "." + write_queue
    service_config["write_routing_key"] = write_queue

    return service_config


def deploy_service(ident, file_path, service_config):
    basic_service_path = os.path.expanduser("~") + "/.Meta/services/"

    # create deployment folder
    destination_path = basic_service_path + ident + "/"
    create_dirs_if_needed(destination_path)
    os.chdir(destination_path)
    create_dirs_if_needed("./deployment")

    os.chdir("./deployment")

    config_name = "rabbitMQ_conf.json"
    with open(config_name, 'w') as f:
        f.write(json.dumps(service_config))

    # copying service for stability and starting service
    shutil.copy2(file_path, os.getcwd())
    service_path = os.getcwd() + "/meta-backend"
    proc = subprocess.Popen([service_path], shell=True)

    result_dict = {}
    result_dict["Service_location"] = service_path
    result_dict["Service_pid"] = proc.pid

    return result_dict


def onMessage(json_msg):
    logging.info("Received {} for deployment.".format(json_msg["Id"]))
    logging.info("Input path is: {}".format(json_msg["Content"]))

    service_config = get_service_config(json_msg["Id"])
    result_dict = deploy_service(json_msg["Id"], json_msg["Content"], service_config)

    return result_dict

def main(argv):
    logger.configure('deployment')
    config = configuration.load()
    if config is None:
        logging.error('Could not load config! Aborting.')
        sys.exit(1)

    amqp = AmqpAdapter(config, onMessage)
    amqp.subscribe()


# starting main method
if __name__ == '__main__':
    main(sys.argv)
