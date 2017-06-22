#!/bin/bash


# converts ALAC M4A Apple nonsense files to mp3 and converts spaces and tabs
# to underscores in the file names.

# people who put spaces in files names should be put in poorly supplied
# penal colonies along with pedos and terrorists.

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in *.flac
do
  echo "  f  " $f
  u=`echo $f | sed 's/[ 	]/_/g'`
  echo  u is $u remove all those stupid spaces in filenames
  cp $f $u
  t=`echo $u | sed 's/flac$/mp3/'`
  ls -l \'$u\'
  echo  dollar u: $u becomes dollar t: $t
  echo "PROCESSING: " avconv -i \'$f\' -f mp3 $t  
  avconv -analyzeduration 20000000 -i $u -qscale:a 0 -f mp3 output.mp3
  echo -------------------------- CONVERTED $f
  ls -l output.mp3
  mv output.mp3 $t 
  rm -rf $u
done
IFS=$SAVEIFS
