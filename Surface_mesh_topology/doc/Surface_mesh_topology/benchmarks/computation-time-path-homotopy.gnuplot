# set terminal postscript eps color 20 lw 3
# set output '| epstopdf -f -o=computation-time-path-homotopy.pdf'

set terminal svg fname 'Verdana' lw 2 # size 640 480 fname 'Verdana' lw 3
set output 'computation-time-path-homotopy.svg'

set key autotitle columnheader

set ylabel "Time (sec)"
set xlabel "Path lengths"
set key left

# set xtics (0, '' 1, 2, 4, 8, 16, 32, 64)
# set ytics (4, 16, 64, 256, 1024, 4096, "16,384" 16384)

# set logscale x 10
# set logscale y 10

set xrange [23000:28000000]
set yrange [0:34]

set xtics ('5,000,000' 5000000, '10,000,000' 10000000, '15,000,000' 15000000, '20,000,000' 20000000, '25,000,000' 25000000)

# set auto x
 
FIT_LIMIT=1.e-14
f(x) = m*x + b
fit f(x) 'computation-time-path-homotopy.dat' using 3:5 via m,b

plot 'computation-time-path-homotopy.dat' using 3:5 with points title "Homotopy test", f(x) title 'Model Fit'

