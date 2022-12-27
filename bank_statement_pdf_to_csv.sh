#!/bin/bash
# script to convert pdf bank statements to
# csv files

# these files may have been produced by idiots who
# put white space in files names
while IFS='' read -r -d '' fname ; do
   nname="${fname##*/}"
   mv -v -n "${fname}"  "${fname%/*}/${nname//[[:space:]]/_}"
done < <(find "$(pwd)"  -name "* *" -type f  -print0)

rm -rf dd.txt
a=`ls *.pdf`

for l in $a; 
do   
	echo "processing" $l
	ps2ascii $l >> dd.txt; 
done

cat dd.txt | sed -n  '/.*[0-9][0-9] * [A-Z][a-z][a-z] [A-Z][A-Z]/p' | sed 's/,//g'  > ddd.txt
cat ddd.txt | sed 's/     */,/g' | sed 's/^,//'  > spreadsheet.csv

view spreadsheet.csv
