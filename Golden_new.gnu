# Parameters to play with to change plot look,  etc
#  usage: gnuplot -e "FIPS=<value>" -e "XOFFSET=<value>" us-counties.gnu
if (!exists("FIPS")) FIPS=8059  # FIPS of county(here Jefferson county Colorado) to plot.  Remember, take off all leading zeros!  
if (!exists("XOFFSET")) XOFFSET=7  #or change day offset of cases -> deaths, and "mortality rate" cases/deaths
if (!exists("YSCALE")) YSCALE=9.5  # A scale factor to line up deaths and cases, roughly the mortality rate of deaths/confirmed cases.  
PS=1.25  # Point (symbol) size on chart.  1 is standard size
LW=1.5   # Line Width on chart, 1 is standard line width

# Title for legend
#COUNTY="`awk -f county_FIPS2Name.awk us-counties.csv`"
#KEY=sprintf("%f Delay, Mort. Rate: %f: FIPS=%d(%s)",XOFFSET,1./YSCALE,FIPS,COUNTY)
COMMAND=sprintf("awk -f county_FIPS2Name.awk FIPS=%d  us-counties.csv",FIPS);
#print COMMAND
COUNTY=system(COMMAND)
KEY=sprintf("%f Delay, Mort. Rate: %f: FIPS=%d(%s)",XOFFSET,1./YSCALE,FIPS,COUNTY)

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
set yrange [:] 
#set log y
set ytics nomirror  tc lt 1
set mytics 5 
set link y2 via y/YSCALE  inverse y*YSCALE
set y2tics nomirror tc lt 2
set y2label "Deaths"

# Actually Plot the data
plot "< awk -f us-counties.awk FIPS=".FIPS." us-counties.csv" every 1:1:0 u 1:4 ls 1 with points t "Cases" axes x1y1\
   , "< awk -f us-counties.awk FIPS=".FIPS." us-counties.csv" every 1:1:0 u ($1-XOFFSET):($5*YSCALE) ls 2 with lines t "Deaths/Mort" 

# wait for the user to hit 'q' before leaving plot
pause -1
