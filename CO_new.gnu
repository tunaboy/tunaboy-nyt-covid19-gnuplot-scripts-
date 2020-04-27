# Parameters to play with to change plot look,  etc
#  usage: gnuplot -e "FIPS=<value>" -e "XOFFSET=<value>" us-counties.gnu
if (!exists("FIPS")) FIPS=8  # FIPS of state to plot(Here CO).  Remember, take off all leading zeros!  
if (!exists("XOFFSET")) XOFFSET=9  #or change day offset of cases -> deaths, and "mortality rate" cases/deaths
if (!exists("YSCALE")) YSCALE=8.5  # A scale factor to line up deaths and cases, roughly the mortality rate of deaths/confirmed cases.  
PS=1.25  # Point (symbol) size on chart.  1 is standard size
LW=1.5   # Line Width on chart, 1 is standard line width

# Title for legend
COMMAND=sprintf("awk -f state_FIPS2Name.awk FIPS=%d  us-states.csv",FIPS);
#print COMMAND
STATE=system(COMMAND)
KEY=sprintf("%f Delay, Mort. Rate: %f: FIPS=%d(%s)",XOFFSET,1./YSCALE,FIPS,STATE)

# this sets the default label format to be in latex math mode...
set format '%g'

# Set up line styles
# Symbols are circle, filled circle, square, filled square triangle diamond plus times
set style line  1 lt  1 dashtype 0 pt 7   lc rgb "#4A0000"    lw LW ps PS
set style line  2 lt  2 dashtype 1 pt 6   lc rgb "#4A0000"    lw LW ps PS

## Portrait monitor (commented out)
#set terminal qt size 900,1600
#set size ratio 1.6              # (10:16)

# Landscape monitor
#set terminal qt size 1600,900
#set size ratio 0.6250           # (16:10)

#Where to put the legend for the graph
set key left top box Left reverse  title KEY # width 3
set label "Days from 1/1/2020"  at graph 0.875,0.010
set label 'Cases'               at graph 0.010,0.875

# X axis (automatic range, 5 subtics between major ticks on axis)
set xrange [:]
set mxtics 5
set mytics 5
set yrange [:] 
set link y2 via y/YSCALE  inverse y*YSCALE
set y2tics nomirror tc lt 2
set ytics nomirror tc lt 1
set y2label "Deaths"
#set logscale y

# Actually Plot the data
plot "< awk -f us-states.awk FIPS=".FIPS." us-states.csv" every 1:1:0 u 1:4 ls 1 with points t "Cases"\
   , "< awk -f us-states.awk FIPS=".FIPS." us-states.csv" every 1:1:0 u ($1-XOFFSET):($5*YSCALE) ls 2 with lines t "Deaths/Mort"

# wait for the user to hit 'q' before leaving plot
pause -1
