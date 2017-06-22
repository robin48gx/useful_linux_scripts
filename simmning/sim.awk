


BEGIN { FS = ":"; old_tid = 0.0; }

{
	#print "min",$1,"sec",$2,"msec",$3
	tid =  60*($1);
	tid += $2;
	tid *= 1000.0;
	tid += $3;
	#print tid;
	print NR, tid - old_tid, (tid - old_tid) / 1000.0;
	old_tid = tid;
}
