#!/usr/bin/python
# -*- coding: utf-8 -*-
import os
import sys
import time
import json
import logging
import argparse

import pika

class AmqpAdapter:
    """Handles subscription and publish actions of the meta.deployment services."""

    publish_ch = None
    create_queue_ch = None

    def __init__(self, config, onMessage):
        self.config = config
        if not config['exchange'] in self.config['read_queue']:
            self.config['read_queue'] = config['exchange'] + '.' + config['read_queue']
        if not config['exchange'] in self.config['write_queue']:
            self.config['write_queue'] = config['exchange'] + '.' + config['write_queue']
        self.onMessage = onMessage

        self.connection = pika.BlockingConnection(pika.ConnectionParameters(self.config['host']))
        logging.info('connection to server {} established...'.format(self.config['host']))

    def subscribe(self):
        channel = self.connection.channel()
        channel.confirm_delivery()
        logging.info('channel successfully created...')

        channel.exchange_declare(exchange=self.config['exchange'], exchange_type='topic')
        logging.info('exchange "{}" successfully declared...'.format(self.config['exchange']))

        channel.queue_declare(queue=self.config['read_queue'])
        logging.info('queue "{}" successfully declared...'.format(self.config['read_queue']))
        channel.queue_bind(exchange=self.config['exchange'],
                           queue=self.config['read_queue'],
                           routing_key=self.config['read_routing_key'])
        logging.info('bound queue {} to exchange {}, with key: {}'.format(
            self.config['read_queue'], self.config['exchange'], self.config['read_routing_key']))

        channel.basic_qos(prefetch_count=1) # only send one message to this worker at at a time
        channel.basic_consume(self._consume,
                              queue=self.config['read_queue'])

        logging.info('start consuming from queue {} ...'.format(self.config['read_queue']))
        channel.start_consuming()


    def _consume(self, ch, method, properties, body):
        logging.info('amqpadapter received a message...')

        # 1 Read body as json.
        logging.debug('decoding json from message...')
        json_data = json.loads(body)

        # 2 Do custom action
        json_result = self.onMessage(json_data)
        if json_result is None:
            ch.basic_ack(delivery_tag=method.delivery_tag)
            return

        # 3 Use the result of the action and send it off
        logging.debug('dumping json to string...')
        string_result = json.dumps(json_result)

        # 4 Send the result off again
        logging.info('starting to publish the result...')
        logging.info('result: {}'.format(string_result[:64]))
        self.publish(string_result)
        ch.basic_ack(delivery_tag=method.delivery_tag)


    def publish(self, message):
        try:
            if self.publish_ch is None:
                self.publish_ch = self.connection.channel()
                logging.info("channel successfully created for publishing...")
            
                self.publish_ch.queue_declare(queue=self.config['write_queue'])
                logging.info("queue {} successfully declared for publishing...".format(self.config['write_queue']))

            self.publish_ch.basic_publish(exchange=self.config['exchange'],
                                  routing_key=self.config['write_routing_key'],
                                  body=message)

            logging.info("message successfully published...")
        except:
            logging.error('Could not publish message due to unexpected error!')


    def createQueue(self, queue_name, exchange, routing_key):
        if self.create_queue_ch is None:
            self.create_queue_ch = self.connection.channel()
            logging.info("channel successfully created for queue creation...")
        
        self.create_queue_ch.queue_declare(queue=queue_name)
        logging.info("queue successfully declared with name {}...".format(queue_name))

        if exchange is not None:
            self.create_queue_ch.queue_bind(
                    exchange=exchange,
                    queue=queue_name,
                    routing_key=routing_key)
            logging.debug("bound queue {} to exchange {},  with key {}".format(queue_name, exchange, routing_key))
    
    def createExchange(self, exchange, type='topic'):
        channel = self.connection.channel()
        
        channel.exchange_declare(exchange=exchange, exchange_type=type)
        logging.info('exchange "{}" successfully declared with type {}...'.format(exchange, type))

        channel.close()
