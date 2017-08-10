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

NUM_CATCHUNKS_RUNNING=`ps auxwww | grep ndncatchunks | grep consumer1 | grep -v grep | wc -l`

until [ $NUM_CATCHUNKS_RUNNING -eq 0 ]
do
    NUM_CATCHUNKS_RUNNING=`ps auxwww | grep ndncatchunks | grep consumer1 | grep -v grep | wc -l`
    sleep 2
done

echo "joining"
./join_slices.py -d $DIR -f png

#eog $DIR/joined.png #this is the UBUNTU command for the image viewer change for your OS
mv $DIR/joined.png $DIR/consumer1.png
open $DIR/consumer1.png #this is the UBUNTU command for the image viewer change for your OS
 
