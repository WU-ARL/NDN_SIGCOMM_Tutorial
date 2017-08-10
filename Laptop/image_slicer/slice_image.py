#! /usr/bin/python

import image_slicer
import argparse


parser = argparse.ArgumentParser(description='split image into tiles.')
parser.add_argument('-f', '--file', help='image file to split')
parser.add_argument('-n', '--num',
		    help='number of slices')
args = parser.parse_args()
image_slicer.slice(args.file, float(args.num))
