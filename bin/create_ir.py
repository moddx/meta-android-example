#!/usr/bin/env python3

import argparse
import os
from os.path import expanduser

def createIr(core, cunit, irfile, target, verbose):
    verboseflag = "-v" if verbose else ""
    os.system(f"""clang++ {verboseflag} -stdlib=libc++ -std=c++11 \
	-O3 -S -emit-llvm \
	 -target {target} \
 	-I {core} \
        {cunit} -o {irfile}
    """)

def main(defaultcore, defaultcunit, defaultoutput, defaulttarget):
    parser = argparse.ArgumentParser(description='Compiles a ComputeUnit to LLVM IR')
    parser.add_argument('--core', metavar='path/to/meta-core/', default=defaultcore,
            help='the path to the META::Core library')
    parser.add_argument('--cu', metavar='mycomputeunit.cpp', default=defaultcunit, 
            help='the path to the ComputeUnit implementation file')
    parser.add_argument('--out', metavar='ir-output.ll', default=defaultoutput,
            help='the path to use for the LLVM output file')
    parser.add_argument('--target', metavar='target-triple', default=defaulttarget,
            help='the target to generate ir for')
    parser.add_argument('--verbose', action='store_true', default=False,
            help='be verbose')

    args = parser.parse_args()
    print(args)

    createIr(args.core, args.cu, args.out, args.target, args.verbose)

    
if __name__ == '__main__':
    base = os.path.dirname(__file__)
    defaultcore = os.path.join(base, '..', 'app', 'libs', 'meta', 'core')
    defaultcunit = os.path.join(base, 'testfiles', 'MyComputeUnit.cpp') 
    defaultoutput = os.path.join(base, 'MyComputeUnit.ll') 
    defaulttarget = 'x86_64-pc-linux-gnu'
    main(defaultcore, defaultcunit, defaultoutput, defaulttarget)
