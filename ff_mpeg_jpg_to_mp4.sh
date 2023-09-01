cat 2023*.jpg | ffmpeg -framerate 25 -i - -c:v libx264 -crf 0 output.mp4
