#! /bin/bash

#sorting the alignment files into those that contain sequences from caretta and those tha$
for num in $@ caretta
do
        echo $num
done

if ['grep caretta <file> |wc -l']
