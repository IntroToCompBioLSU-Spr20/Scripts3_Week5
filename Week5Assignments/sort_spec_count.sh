#!/bin/bash

#user will input the name of the directory they would like to sort
directory=$1

#list out all the the files in the directory
files=`ls $directory`

#This string is used to store the list of all the sorted files that have been created
listOfSpeciesCounts=""

mkdir SortedBySpeciesCount

echo "Sorting files..."
for file in $files
do	
	#searches for the species count using grep and awk
	speciesCount=`cat $directory/$file | grep "dimensions ntax = ." | awk '{print $4}'`
	
	#grep searches the memory of created directories to see if it has encountered a new species count
	echo $listOfSpeciesCounts | grep -q $speciesCount 
	#stores the exit code for grep (0=found, 1=not found)
	isInList=`echo $?`
	
	#if the species count is not found in the memory
	if (($isInList != 0))
	then	
		#create a new file for the species count
		mkdir SortedBySpeciesCount/species_$speciesCount
		
		#add species count to the memory
		listOfSpeciesCounts="${listOfSpeciesCounts}${speciesCount} "
	fi
	
	#make a copy of the file inside the new directory
	cp $directory/$file SortedBySpeciesCount/species_$speciesCount
done
echo "Done"
