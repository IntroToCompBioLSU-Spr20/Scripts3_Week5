#! /bin/bash

for alignments in !@
do
  if
#if "caretta" is found in the file
    grep -q "caretta" *.nex
  then
#those sequences are written into a text file
    grep "caretta" *.nex >> caretta_present.txt
  else
#or echo absence
    echo "caretta absent from file"
  fi
done

#print the file name (first column of the text file with the sequences) of those files that contain caretta and copy that file into the final destination
mkdir caretta_present_files
mv `awk -F ':' '{print $1}' caretta_present.txt` ./caretta_present_files

#all remaining nexus files lack caretta, move into their own directory
mkdir caretta_absent_files
mv *.nex ./caretta_absent_files
