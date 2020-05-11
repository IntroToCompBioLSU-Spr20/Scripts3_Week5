#! /bin/bash
#Creating differnt folders for taxa 9-16
for ((n=9 ; n<=16; n++))
do 
mkdir $n"taxa"
done
#for loop to test each file individually
for file in ./alignments/*.nex
do 
   #using if then statments to sort files in taxa folders
   if ['grep "ntax = 9" file']
     then
    mv $file  /alignments/9
 else
   if ['grep "ntax = 10" file']
     then
    mv $file  /alignments/10
 else
   if ['grep "ntax = 11" file']
     then
    mv $file  /alignments/11
 else
   if ['grep "ntax = 12" file']
     then
    mv $file  /alignments/12
 else
   if ['grep "ntax = 13" file']
     then
    mv $file  /alignments/13
 else
   if ['grep "ntax = 14" file']
     then
    mv $file  /alignments/14
 else
   if ['grep "ntax = 15" file']
     then
    mv $file  /alignments/15
 else
   if ['grep "ntax = 16" file']
     then
    mv $file  /alignments/16      #used if then statments for every taxa 9-16
 fi
done
