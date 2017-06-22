


fred=`ls *.[jJ][Pp][Gg]`

for l in $fred
do
  convert $l -resize 50% -quality 60 AA_$l
done
