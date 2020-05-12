#! /bin/bash

#using the for loop to generate separate directories stated ranks 4-14.
#sort these alignment files into a series of folders
for ((n=4 ; n<14 ; n++))
do

        echo "In for loop."

If (( $4 < 6 ))
then
        echo "less than six"
elif (( $4 < 8 ))
then
        echo "between five and seven"
