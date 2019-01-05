#!/usr/bin/python3
# -*- coding: utf-8 -*-

import logging
import os

def configure(service, level=logging.INFO, logdir='../../logs'):
    if not os.path.isdir(logdir):
        os.mkdir(logdir)
    logging.basicConfig(filename=logdir + '/{}-service.log'.format(service), level=level, 
            format='%(asctime)s %(name)s|%(levelname)s| %(message)s',
            datefmt='%b %d %H:%M:%S')
