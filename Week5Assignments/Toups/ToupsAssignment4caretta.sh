#! /bin/bash

##############################
#    Author: Ben Toups
#       2/18/2020
##############################

# Downloads and uncompresses the alignments file
wget https://github.com/IntroToCompBioLSU-Spr20/Scripts3_Week5/raw/master/alignments.tgz
tar -xzf alignments.tgz

# Creates directories for files containing the taxa caretta not containing caretta
mkdir alignments/caretta alignments/noCaretta

# For loop that iterates over all files ending in .nex in the alignments folder
for file in alignments/*.nex
do
	# Checks to see whether or not each file contains the string "caretta"
	if grep -q "caretta" $file
	then
	
		# If the file does contain caretta, it is moved to the caretta directory
		mv $file alignments/caretta/
	
	else
		# If it does not, it is moved to the noCaretta directory
		mv $file alignments/noCaretta/
	
	fi
done
