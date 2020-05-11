#! /bin/bash
#make the directory for caretta and for no coretta
mkdir Caretta
mkdir NoCaretta
#create loop then if else statements to look into each file
for file in *.nex
do
 #here is the ifthen statment with grep to find all files with "caretta" and move them to the Caretta folder
 if ['grep -o "caretta" file']
  then
   mv $file /alignments/Caretta
  else                                    #other files are being moved to the NoCaretta folder
   mv $file /alignments/NoCaretta
 fi
done
#Close with fi and close for loop with done
