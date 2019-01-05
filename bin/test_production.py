#!/usr/bin/env python3

import argparse
import os, sys
import http.client
import json
from os.path import expanduser

def sendTestData(apikey, host, port):
    conn = http.client.HTTPConnection(host, port)

    payload = '''
{    
"Id": "<apikey>",
"data": [
	{"id": 0, "value": "0" },
	{"id": 1, "value": "1" },
	{"id": 2, "value": "2" },
	{"id": 3, "value": "3" },
	{"id": 4, "value": "4" },
	{"id": 5, "value": "5" },
	{"id": 6, "value": "6" },
	{"id": 7, "value": "7" },
	{"id": 8, "value": "8" },
	{"id": 9, "value": "9" },
	{"id": 10, "value": "10" },
	{"id": 11, "value": "11" },
	{"id": 12, "value": "12" },
	{"id": 13, "value": "13" },
	{"id": 14, "value": "14" }
	]
}
'''
    payload = payload.replace('<apikey>', apikey, 1)

    headers = {
        'Content-Type': "application/json",
        'Accept': "application/json",
        }

    conn.request("POST", "/", payload, headers)

    res = conn.getresponse()
    jresult = json.loads(res.read().decode("utf-8"))

    print(json.dumps(jresult, indent=4, sort_keys=True))

def main():
    parser = argparse.ArgumentParser(description='Compiles a ComputeUnit to LLVM IR')
    parser.add_argument(metavar='apikey', dest='apikey',
            help='the apikey of the deployed computeunit that should receive the data')
    parser.add_argument('-b', metavar='backend', default='localhost',
            help='the hostname of the backend to send data to')
    parser.add_argument('-p', metavar='port', default='4300',
            help='the port of the backend')

    args = parser.parse_args()
    print(args)

    sendTestData(args.apikey, args.b, args.p)

if __name__ == '__main__':
    main()
