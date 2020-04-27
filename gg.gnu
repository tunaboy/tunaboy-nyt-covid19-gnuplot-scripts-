# awk file for massaging data
#AWKFILE=us-states.awk
# Useful function  definitions
max(a,b)= (a>b)? a : b # Uses ternary ? : operator
min(a,b)= (a<b)? a : b # Uses ternary ? : operator
binom(n,k) = n!/(k!*(n-k)!)  # n \choose  k
#set terminal mp color latex
#set output 'gg.mp'


# this sets the default label format to be in latex math mode...
set format '$%g$'
set format '%g'

load 'x11_linestyles.gnu'

########################################################################
# this sets the size, from the default 5x3 format 
#set size 6/5.,5/3.
#set size ratio 0.8
#set size ratio 0.56250          # (16:9)
#set size ratio 1.77777777       # (9:16)

set size ratio 0.8
set size ratio 1.77777777       # (9:16)
set size ratio 0.56250          # (16:9)
 
# Portrait monitor
set terminal qt size 900,1600
set size ratio 1.6              # (10:16)

# Landscape monitor
set terminal qt size 1600,900
set size ratio 0.6250           # (16:10)

set xrange [:]
set key right top box Left reverse  # width 3
#set xlabel \"x/d\"   offset 15,1
#set label "x/d"  at graph .75, -.05
set ylabel
#set label '$c_p$' at graph -0.05,.75
#set yrange reverse
#set logscale y
set mytics 5
#set logscale x
set mxtics 5
set yrange [:] 
plot '< awk -f us-states.awk us-states.csv' every 1:1:0 u 1:4 ls 1 with lines t 'us-states.csv 0'

pause -1
#set terminal mp color latex
set terminal lua tikz linewidth 1 standalone 
load 'mp_linestyles.gnu'
#set output 'gg.mp'
set output 'gg.tex'
replot
