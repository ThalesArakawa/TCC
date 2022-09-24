set title "Média e Desvio"
set ylabel "Valor Medido"
set xlabel "Referência"
set terminal png size 1080,1080;
set output 'grafCal.png';
plot "stat.txt" with errorbars