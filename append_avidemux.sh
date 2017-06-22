DEOCODEC="Xvid"
AUDIOCODEC="MP3"
dd=`ls *.AVI`
avidemux --video-codec $VIDEOCODEC --audio-codec $AUDIOCODEC --force-alt-h264 --load "$dd" --save ${FIL%.*}.avi --quit
#for FIL in `ls *.AVI | sort` ; do
#	  echo $FIL
#	  avidemux --video-codec $VIDEOCODEC --audio-codec $AUDIOCODEC --force-alt-h264 --load "$FIL" --save ${FIL%.*}.avi --quit
#done
