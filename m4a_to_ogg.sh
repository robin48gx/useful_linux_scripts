#!/bin/bash


# converts ALAC M4A Apple nonsense files to mp3 and converts spaces and tabs
# to underscores in the file names.

# people who put spaces in files names should be put in poorly supplied
# penal colonies along with pedos and terrorists.

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in *.m4a
do
  echo " dollar f is " $f
  u=`echo $f | sed 's/[ 	]/_/g'`
  echo u is $u remove all those stupid spaces in filenames
  cp $f $u
  t=`echo $u | sed 's/m4a$/ogg/'`
  ls -l \'$u\'
  echo  dollar u: $u becomes dollar t: $t
  echo "PROCESSING: " avconv -i \'$f\' -f mp3 $t  
  #avconv -i $u -qscale:a 0 -f mp3 output.mp3
  avconv -i $u  -f ogg output.ogg
  echo -------------------------- CONVERTED $f
  mv output.ogg $t 
  rm -rf $u
done
IFS=$SAVEIFS
