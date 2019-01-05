#!/usr/bin/env python3

import argparse
import os, sys
import subprocess
from os.path import expanduser

def uploadIR(llfile, host, port):
    subprocess.run(['curl', '-T', llfile, 'http://' + host +':' + port + '/upload'])
    print('')

def main(llfile):
    parser = argparse.ArgumentParser(description='Compiles a ComputeUnit to LLVM IR')
    parser.add_argument('-f', metavar='computeunit.ll', default=llfile, 
            help='the file containing the LLVM IR of a ComputeUnit')
    parser.add_argument('-b', metavar='backend', default='localhost',
            help='the hostname of the backend to upload to')
    parser.add_argument('-p', metavar='port', default='4200',
            help='the port of the backend')

    args = parser.parse_args()
    print(args)

    uploadIR(args.f, args.b, args.p)


if __name__ == '__main__':
    base = os.path.dirname(__file__)
    llfile = os.path.join(base, 'testfiles', 'MyComputeUnit.ll')
    main(llfile)
