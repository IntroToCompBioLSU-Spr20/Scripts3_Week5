#! /bin/bash
# make directory for caretta files and a directory for non-caretta files
mkdir caretta
mkdir nonCaretta
# loop through the files in alignments folder
for data in ~/alignments/*; do
# select only lines with "caretta" regardless of case out of files, if file has term- move file to caretta directory
# if file does not have "caretta"- there is no output, move file to non-caretta directory
        if grep -q -w -i "caretta" $data
        then
                mv $data ./caretta
        else
                mv $data ./nonCaretta
        fi
done
echo "Sorting complete."
