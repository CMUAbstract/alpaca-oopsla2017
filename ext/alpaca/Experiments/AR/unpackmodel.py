#!/usr/bin/env python
#
# Parse the outputs of the gdb command
#   dump binary memory model.out start_addr end_addr
# or...
#   dump binary memory model
# where 'model' is a defined symbol in ar.elf.
#

from __future__ import print_function
import struct
import argparse

parser = argparse.ArgumentParser('AR model unpacker')
parser.add_argument('infile', type=argparse.FileType('rb'))
args = parser.parse_args()

numreadings = 0
while True:
    data = args.infile.read(4) # signed long
    if not data:
        break

    numreadings += 1
    if numreadings <= 8: # skip first 4 pairs
        continue

    (x,) = struct.unpack('<i', data)
    print(' {},'.format(x))
