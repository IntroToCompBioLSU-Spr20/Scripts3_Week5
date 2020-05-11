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
