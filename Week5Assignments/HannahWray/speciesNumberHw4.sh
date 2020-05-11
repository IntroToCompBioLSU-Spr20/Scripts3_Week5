#! /bin/bash
# loop through the data files in alignments folder
for data in ./alignments/*; do
# pull out the "ntax = digits" across all files in alignments folder, then pull out just the digits
speciesNum=`grep -o -P "ntax = \d+" $data | grep -o -P "\d+"`
# if the directory with ntax number doesn't exist, make the directory, put the file in that directory
# if directory exists, move the file to that directory
        if [ ! -d "$speciesNum" ]
        then
                mkdir "$speciesNum"; mv $data ./$speciesNum
        else
                mv $data ./$speciesNum
        fi
done
echo "Sorting complete."
