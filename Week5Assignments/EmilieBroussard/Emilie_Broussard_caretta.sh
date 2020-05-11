Script 1

#! /bin/bash

#set up big loop
for alignment in !@
do
#loop 1-20 by increments of one for num (ntax=num)
 for ((num=1;num<=20;num++))
  do
#search through all nexus files to find if that number is the number of taxa
      if grep "ntax = $num" *.nex
#then make a directory named after that number. List those files in a text file, and write to a text file
      then
        mkdir $num
        grep "ntax = $num" *.nex >> list_$num
      else
#if no file with that ntax is found, report error message
        echo "incorrect ntax"
      fi
  done
done

for filenames in !@
do
#for ntax between 1 and 20, increasing by increments of 1
  for ((num=1;num<=20;num++))
  do
#print the names of the files with that taxa number (1st column of list_$num file) and copy file of that name into the appropriately numbered folder
    cp `awk -F ':' '{print $1}' list_$num` ./$num
  done
done












Script 2:

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
