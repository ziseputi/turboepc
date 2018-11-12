#!/bin/bash
set autoscale #scales axes automatically
unset log #remove any log-scaling
unset label #remove any prev labels
set terminal postscript eps enhanced color font 'Arial,15'
set output 'DataVsServiceRequest.eps'
#set xtic 3
set ytic nomirror
set y2tic nomirror
#set title "LTE-EPC: Application End-to-end Delay(ms)"
set xlabel "Input Data Rate(bps)"
set ylabel "Average Service Request Throughput(req/sec)"

set style fill pattern 4
set style data histogram
set style histogram gap 2

#set size 1,0.5
#set key at 2,44
#set xrange [0:]
set yrange[0:]
set y2range[0:110]
#set xtics border in scale 0,0 nomirror rotate by 45  offset character -1, -4, 0
plot newhistogram fs pattern 1, 'DataVsServiceRequest.dat' using 7:xtic(1) axes x1y1 title 'Service Request Throughput' lc rgb 'red' lw 2  ,\
         'DataVsServiceRequest.dat' using 5 axes x1y2 title '%CPU usage for Data traffic' lc rgb 'black' lw 2 with linespoint


  #'scale1miss.dat' using 3 title 'Switch Table MISS' lc rgb 'black' lw 2  , \
 #'scale1miss.dat' using 4 title 'Centralized' lc rgb 'blue' lw 2
    # 'cuttlefish.dat' using 3 title 'Cuttlefish' lc rgb 'medium-blue' lw 2

unset style data
unset style histogram