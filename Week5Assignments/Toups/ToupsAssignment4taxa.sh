#! /bin/bash

###############################
#      Author: Ben Toups
#        2/18/2020
###############################

# Downloads and uncompresses the alignments file
wget https://github.com/IntroToCompBioLSU-Spr20/Scripts3_Week5/raw/master/alignments.tgz
tar -xzf alignments.tgz

#Creates a taxa directory in the alignments directory
mkdir alignments/taxa

# For loops that iterate over all files that end in .nex in the alignments directory
for file in alignments/*.nex
do
	# Counts the number of lines in each file and subtracts the resulting number
	## by 10 to account for the header and end lines, leaving us with the number
	### of taxa for each file
	tx=`wc -l < $file`
	tx=$((tx-10))

	# Checks whether or not a directory by the name of the number of taxa
	## in the file exists
	if [ -d "alignments/taxa/$tx" ]
	then
		# If the directory exists, moves the file to the appropriate directory
		mv $file alignments/taxa/$tx/

	else
		# If the directory does not exist, creates it and moves the file
		mkdir alignments/taxa/$tx
		mv $file alignments/taxa/$tx/

	fi
done
