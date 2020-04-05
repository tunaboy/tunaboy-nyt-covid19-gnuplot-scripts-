# tunaboy-nyt-covid19-gnuplot-scripts-
gnuplot (and associated awk) scripts to plot the New York Times covid19 database

copy (or make a link) the us-counties.csv and us-states.csv files into
    the same directory, then plot the data with the commands:
    
       gnuplot us-counties.gnu
    or
       gnuplot -e "FIPS=6059" us-counties.gnu
    
    This will make a plot of the cases per day with the associated
    deaths with a delay (XOFFSET) and a scale factor (YSCALE) to do
    a simple model of the form:
    
      DEATHS = CASES(D-XOFFSET)/YSCALE
    
    XOFFSET and YSCALE are similarly changeable from the command line, vis:
    
       gnuplot -e "FIPS=6059" -e "XOFFSET=9" -e "YSCALE=7" us-counties.gnu
    
    This is a quick and dirty version, but I've been playing with it for a
    bit, and I'm really glad I live in Santa Clara CA (the default county)
    and California (the default state).
    
    I'll be getting better versions of these at some point, but wanted to
    get these up for others to use and possibly make improvements on.

