#! /bin/bash


if [ $# -lt 1 ]
then
    echo "Usage: $0 <directory>"
    exit 0
else
    DIR=$1
fi

FILES=( file_01_01.png file_01_02.png file_02_01.png file_02_02.png )
NUM_FILES=0

# ndncatchunks -r 20 -c /Users/jdd/SIGCOMM_2017/CONSUMER1/consumer1.cfg /ndn/edu/wustl/jdd/file_01_02.128

until [ $NUM_FILES -eq 4 ]
do
    NUM_FILES=0
    for FILE in "${FILES[@]}"
    do
	FULL_FN=$DIR/${FILE}
	echo "looking for $FULL_FN"
	if [ -s $FULL_FN ]
	then
	    echo "found $FILE"
	    NUM_FILES=$(($NUM_FILES+1))
	fi
    done
    sleep 2
done

echo "joining"
./join_slices.py -d $DIR -f png

#eog $DIR/joined.png #this is the UBUNTU command for the image viewer change for your OS
open $DIR/joined.png #this is the UBUNTU command for the image viewer change for your OS
 
