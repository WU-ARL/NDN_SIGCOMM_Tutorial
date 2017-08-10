#! /usr/bin/python

import argparse
import sys 
import os
import image_slicer
from PIL import Image
from math import ceil, floor

def get_tile_from_file(fname, number):
   image = Image.open(fname)
   tile_size = image.size
   position = os.path.splitext(fname)[0][-5:].split('_') 
   right = int(int(position[1]) * int(tile_size[0]))
   left = int(int(right) - int(tile_size[0]))
   lower = int(int(position[0]) * int(tile_size[1]))
   upper = int(int(lower) - int(tile_size[1]))
   coords = ( left, upper, right, lower )
   print 'coords:(' + repr(coords[0]) + ',' + repr(coords[1]) + ',' + repr(coords[2]) + ',' + repr(coords[3]) + ')'
   print 'position:(' + repr(position[0]) + ',' + repr(position[1]) + ')'
   tile = image_slicer.Tile(image, number, (int(position[0]), int(position[1])), coords, fname)
   return tile

   
def get_tiles(dir):
   tiles = []
   fails = []
   number = 1
   for file in os.listdir(dir):
      fn = dir + '/' + file
      print file + ':' + fn
      try:
         tile = get_tile_from_file(fn, number)
         tiles.append(tile)
         number += 1
      except:
         print 'Error for file(' + fn + ')'
         fails.append(fn)
   
   tile_size=(1,1)
   if len(tiles) > 1:
      tile_size=tiles[0].image.size

   for fn in fails: #creates blank tile for empty files
      position = os.path.splitext(fn)[0][-5:].split('_')
      if len(position) > 1:
         print 'process fail ' + fn
         right = int(int(position[1]) * int(tile_size[0]))
         left = int(int(right) - int(tile_size[0]))
         lower = int(int(position[0]) * int(tile_size[1]))
         upper = int(int(lower) - int(tile_size[1]))
         coords = ( left, upper, right, lower )
         print 'coords:(' + repr(coords[0]) + ',' + repr(coords[1]) + ',' + repr(coords[2]) + ',' + repr(coords[3]) + ')'
         print 'position:(' + repr(position[0]) + ',' + repr(position[1]) + ')'
         tile = image_slicer.Tile(Image.new('RGB', tile_size, None), number, (int(position[0]), int(position[1])), coords)
         tiles.append(tile)
         number += 1

   return tiles
   

parser = argparse.ArgumentParser(description='Join tiles together.')
parser.add_argument('-d', '--dir', help='directory containing tiles')
parser.add_argument('-f', '--format',
		    help='output image format (e.g JPG, PNG, GIF)')
parser.add_argument('-v', '--version', action='version',
		    version='%(prog)s 0.1')
args = parser.parse_args()

tiles = get_tiles(args.dir)
#image = image_slicer.join(image_slicer.open_images(args.dir))
image = image_slicer.join(tiles)
#image = image.transpose(Image.ROTATE_270)
new_fn = args.dir + '/joined.' + args.format
print 'saving joined file to ' + new_fn
image.save(new_fn) #'joined.%s'.format(args.format))
