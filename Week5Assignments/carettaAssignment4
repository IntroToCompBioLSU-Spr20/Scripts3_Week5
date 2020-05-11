#This script creates a new directory and sorts the files from alignments/
#And copies files containing 'caretta' into the new directory.


#! /bin/bash

n=1
mkdir alignmentCaretta

echo 'alignmentCaretta/ created'


#for loop: Reads through every file in the alignments/ directory

for file in alignments/*
do


        #if: Checks if a file has 'caretta' in it and if so, copies it to the new directory

        if grep -q 'caretta' $file
        then
                cp $file alignmentCaretta/
                ((n++))
        fi

done

echo 'All files containing Caretta have been copied to alignmentCaretta/'
echo 'Total Files copied '$n
