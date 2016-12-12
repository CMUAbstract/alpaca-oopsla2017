#!gnuplot

set term postscript color
set output 'error.ps'

set title 'Error Atomically Updating 512 Words at 10 Inches' 
set xlabel 'Atomicity Distance'
set ylabel '% Error'
set key inside right top 
set xrange [0:512]
set yrange [0:100]
set xtics nomirror
set ytics nomirror

plot 'baseline/2048_10in.data' u 0:(((256-$1)/256)*100) smooth bezier lw 6 t 'baseline' w lines, 'ckpt/2048_10in.data' u 0:(((256-$1)/256)*100) smooth bezier lw 6 t 'checkpoints' w lines, 'recovery/2048_10in.data' u 0:(((256-$1)/256)*100) smooth bezier lw 6 t 'recovery' w lines
