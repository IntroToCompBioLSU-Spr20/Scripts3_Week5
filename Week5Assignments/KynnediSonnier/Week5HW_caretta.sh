#! /bin/bash
shoo='grep -i "Caretta" alignments/*.nex'
#new directories
#since im looking for 2 outputs do search based on on ntax value
for ((num=9;num<=12;$num++))
do
         echo "$shoo" alignments/*.nex >/alignments/caretta/
done
# split the possible input values 50/50 num-- prevents it from exceeding defined string of numbers
for ((num=13;num<=16;num--))
do
        echo "no Caretta" | grep "noCaretta" alignments/*.nex >/alignments/noCaretta/
done
