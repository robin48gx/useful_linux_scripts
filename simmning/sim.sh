


cat simmning_siffror.txt | sed 's/,/:/' > dd.txt
cat dd.txt | awk -f sim.awk > sim.dat
gnuplot < sim.gpt
