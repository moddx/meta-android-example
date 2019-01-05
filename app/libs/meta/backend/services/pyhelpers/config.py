#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import logging
import json


def load():
    exists = os.path.isfile('./rabbitMQ_conf.json')
    if exists:
        logging.debug("-> loading \'rabbitMQ_conf.json\': file exists")
        with open('./rabbitMQ_conf.json', 'r') as f:
            content = f.read()
        json_data = json.loads(content)

        return json_data
    else:
        logging.error("could not load \'rabbitMQ_conf.json\'")
        return None
