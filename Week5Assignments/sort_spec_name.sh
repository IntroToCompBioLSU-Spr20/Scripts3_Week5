#!/bin/bash

#user will input the name of the directory they would like to sort,
#and the name of the species that is being sorted
directory=$1
species_name=$2

#list out all the the files in the directory
files=`ls $directory`

#directory that the files will be sorted into
mkdir Contains_${species_name}

echo "Sorting files..."
for file in $files
do	
	#read the file and search for the species name
	cat ./$directory/$file | grep -q $species_name
	#If the species name is found in the file:
	if(( $? == 0 ))
	then
		#make a copy of the file in the new directory
		cp ./$directory/$file ./Contains_${species_name}
	fi
done
echo "Done"
