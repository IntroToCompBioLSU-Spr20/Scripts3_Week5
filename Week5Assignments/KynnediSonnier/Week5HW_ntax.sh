#! /bin/bash
num=$1
# goal is to group files based on number of DNA sequences contained
# download alignments
curl -L https://github.com/IntroToCompBioLSU-Spr20/Scripts3_Week5/raw/master/alignments.tgz $
# uncompress the alignment folder
tar -xzf alignments.tgz
#new directories
mkdir alignments/caretta alignments/noCaretta
# extracts line number 4 & filename for the purpose of deciding ntax range
awk 'FNR==4 {print FILENAME, $0}' *.nex >>./pure.txt
#for loop for sorting
for ((num=9;num<=16;num++))
do
        echo "This file has $num species."
done
# sorting files 9-11
if [ $1 -le 9 ]
then
        echo "Put this in nine.txt."
elif [ $1 -le 14 ]
then
        echo "Put this in fourteen.txt."
elif  [ $1 -gt 16 ]
then
        echo "out of your ntax range"
else
        echo "between 12-15."
fi
# individual sorting
