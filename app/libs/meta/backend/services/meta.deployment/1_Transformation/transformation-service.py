#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import sys
import time
import json
import logging
import argparse
import re

import functools

import pika

import pyhelpers.config as configuration
import pyhelpers.logger as logger
from pyhelpers.amqpadapter import AmqpAdapter

config = {}

def compose2(f, g):
    return lambda x: f(g(x))

def compose(*functions):
    return functools.reduce(compose2, functions, lambda x: x)

multi_compose = functools.partial(functools.reduce, compose2)

####
# Transformation code
####

def extractClassname(lines):
    for entry in lines:
        if '= type { %"class.META::Core::ComputeUnit" }' in entry:
            m = re.search('%class\.(.+?) = type { %"class\.META::Core::ComputeUnit" }', entry)
            if m:
                logging.info("Extracted {} as the ComputeUnit's classname.".format(m.group(1)))
                return m.group(1)
    return ""

# searches for target datalayout entry and replaces this one
def replace_datalayout_entry(entry):
    if "target datalayout =" in entry:
        logging.info("   > target datalayout found and replaced.")
        return 'target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"'
    else:
        return entry


# searches for target triple entry and replaces this one
def replace_triple_entry(entry):
    if "target triple =" in entry:
        logging.info("   > target triple found and replaced.")
        return 'target triple = "x86_64-pc-linux-gnu"'
    else:
        return entry


# searches for atributes #0 entry and replaces this one
def replace_attribute0_entry(entry):
    if "attributes #0 =" in entry:
        logging.info("   > attributes #0 found and replaced.")
        return 'attributes #0 = { "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+fxsr,+mmx,+sse,+sse2,+sse3" }'
    else:
        return entry


# searches for atributes #2 entry and replaces this one
def replace_attribute2_entry(entry):
    if "attributes #2 =" in entry:
        logging.info("   > attributes #2 found and replaced.")
        return 'attributes #2 = { noinline "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+fxsr,+mmx,+sse,+sse2,+sse3" }'
    else:
        return entry

# searches for atributes #3 entry and replaces this one
def replace_attribute3_entry(entry):
    if "attributes #3 =" in entry:
        logging.info("   > attributes #3 found and replaced.")
        return 'attributes #3 = { nounwind readnone "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+fxsr,+mmx,+sse,+sse2,+sse3" }'
    else:
        return entry

# searches for atributes #6 entry and replaces this one
def replace_attribute6_entry(entry):
    if "attributes #6 =" in entry:
        logging.info("   > attributes #6 found and replaced.")
        return 'attributes #6 = { readonly "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+fxsr,+mmx,+sse,+sse2,+sse3" }'
    else:
        return entry


def onMessage(json_msg):
    logging.info('### Entering IR-Transformation')
    start_time = time.time()

    content = json_msg['Content']

    logging.debug('splitting content to lines...')
    lines = content.split('\n')

    # define transformations to IR
    logging.debug('preparing transformations...')
    original_lines = lines
#    transformations = [replace_datalayout_entry, replace_triple_entry,
#                       replace_attribute0_entry, replace_attribute2_entry,
#                       replace_attribute3_entry, replace_attribute6_entry]

    transformations = [replace_datalayout_entry, replace_triple_entry]
    
    # apply transformations to IR
    logging.debug('applying transformations...')
    trans = multi_compose(transformations)
    lines = list (map(lambda x: trans(x), lines))

    logging.warning("File has {} lines.".format(len(lines)))
    # extract compute units classname
    classname = extractClassname(lines)

    logging.info("Extracted ComputeUnit's Classname: '{}'".format(classname))
    logging.warning("File has {} lines.".format(len(lines)))


    # joining List to new file content
    logging.debug('joining lines to string...')
    new_content = '\n'.join(lines)

    logging.debug('alternating json to new content version...')
    json_msg['Content'] = new_content
    json_msg['Classname'] = classname

    logging.info('-> finished IR-transformation in: %s seconds' % (time.time() - start_time) )
    logging.info('### Leaving IR-transformation')

    return json_msg


####
# Main Method
####
def main(argv):
    logger.configure('transformation')
    config = configuration.load()
    if config is None:
        logging.error('Could not load config! Aborting.')
        sys.exit(1)

    amqp = AmqpAdapter(config, onMessage)
    amqp.subscribe()


# starting main method
if __name__ == '__main__':
    main(sys.argv)
