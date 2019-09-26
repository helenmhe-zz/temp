
set term svg size 1000,500 font "Computer Modern, 15pt"
set output './qsort-1000000.svg'
set size 0.5,1.0
set datafile separator ","
set tmargin 0
#set multiplot layout 1, 2 ;
set multiplot layout 1,2
set margins 0.1,0.9,0.1,0.9
set spacing 0.08,0.08

#set multiplot layout 1,2               margins 0.15,0.85,0.15,0.85               spacing 0.08,0.08


set title "Execution Time: ./qsort 1000000"
set size 0.5,0.5

set grid x2tics
set grid x2tics lw 4
set x2tics format ""
set x2tics (0,8)
set x2tics rotate by 90
set x2tics scale 0
set x2tics offset 0
set x2range [0:8]
set xrange [0:8]


set label "NUMA0: [1-8]" at 4.0, graph 0 center offset 0, char -2



plot "cilkscale-.qsort-1000000.csv" using 1:2 title "Observed Runtime" with linespoints lw 3,"cilkscale-.qsort-1000000.csv" using 1:5 title "Perfect Linear Speedup" with lines lw 3,"cilkscale-.qsort-1000000.csv" using 1:6 title "Greedy Scheduling Bound" with lines lw 3, "cilkscale-.qsort-1000000.csv" using 1:10 with lines lw 3 title "Span Bound"

set title "Speedup: ./qsort 1000000" ;
set size 0.5,0.5


set ylabel "Speedup"
set yrange[0:8]
plot "cilkscale-.qsort-1000000.csv" using 1:3 title "Observed Speedup" with linespoints lw 3,"cilkscale-.qsort-1000000.csv" using 1:4 title "Perfect Linear Speedup" with lines lw 3,"cilkscale-.qsort-1000000.csv" using 1:7 title "Span Bound" with lines lw 3,"cilkscale-.qsort-1000000.csv" using 1:9 title "Greedy Scheduling Bound" with lines lw 3

unset multiplot
