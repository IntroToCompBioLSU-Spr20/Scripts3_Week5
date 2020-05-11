#This reads the alignments/ file and sorts through all of the readable files inside of it.
#And creates a new directory and sorts the files based on the ntax number


#! /bin/bash

n=1
mkdir alignmentNtax

echo 'alignmentNtax/ created'


#for loop: Reads through every file in the alignments/ directory

for file in alignments/*
do

        #grep and awk: 'ntax' variable by grep-ing the line with the ntax number and sorting by columns

        ntax=`grep -w "ntax =" $file | awk '{print $4}'`


        #if statement: Checks if there folder inside of the new directory for the specified ntax.
        #              If not, it creates a new folder for the ntax

        if [ ! -d alignmentNtax/$ntax ]
        then
                mkdir alignmentNtax/$ntax
                echo $ntax' folder made in alignmentNtax/'
        fi


        #cp: Copies files from alignment/ to the new directories

        cp $file alignmentNtax/$ntax
        ((n++))

done

echo 'Files copied to respective folders in new directory'
echo 'Total File Number is '$n
