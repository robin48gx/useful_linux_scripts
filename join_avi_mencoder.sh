


ff=`ls *.AVI`


mencoder -oac copy -ovc copy -idx -o output.avi $ff
