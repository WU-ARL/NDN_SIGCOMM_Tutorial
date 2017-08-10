slice_image.py: splits image into tiles and places the files in the directory containing the image file 
     command line arguments: -f <image_file> -n <number of tiles>

join_slices.py: joins tiles in the specified directory together, provided they follow the naming convention produced by slice_image. 
		The joined image is written to file named "joined" in the same directory containing the tiles
     command line arguments: -d <directory of tiles> -f <joined image format PNG, JPG, etc.>

join_show_image.sh: watches a directory waiting for a set of files to appear. Once all of the tiles are there, the script joins 
		    joins the tiles and launches the image viewer.
     command line arguments: -d <directory of tiles>
     set of files is defined in an array FILES in the script
