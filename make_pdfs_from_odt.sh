#!/bin/bash

#fred=`ls *.odt`
#
#for l in $fred
#do
#echo $l
#p=`echo $l | sed 's/.odt//'`
#ooconvert --force $p.odt $p.pdf 
#done

libreoffice --headless --convert-to pdf:writer_pdf_Export *.odt

