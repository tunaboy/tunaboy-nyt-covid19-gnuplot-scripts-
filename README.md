# tunaboy-nyt-covid19-gnuplot-scripts-



gnuplot (and associated awk) scripts to plot the New York Times covid19 database

copy (or make a link) the us-counties.csv and us-states.csv files into the same directory, then plot the data with the commands:
    
       gnuplot us-counties.gnu
    or
       gnuplot -e "FIPS=6059" us-counties.gnu
    
 This will make a plot of the cases per day with the associated deaths with a delay (XOFFSET) and a scale factor (YSCALE) to do a simple model of the form:
    
      DEATHS = CASES(D-XOFFSET)/YSCALE
    
 XOFFSET and YSCALE are similarly changeable from the command line, vis:
    
       gnuplot -e "FIPS=6059" -e "XOFFSET=9" -e "YSCALE=7" us-counties.gnu
    
 This is a quick and dirty version, but I've been playing with it for a bit, and I'm really glad I live in Santa Clara CA (the default county) and California (the default state).
    
 I'll be getting better versions of these at some point, but wanted to get these up for others to use and possibly make improvements on.

 NOTE: A different way to look at these is with logarithmic y axes.  You can easily switch between these by placing our mouse close to the left axis and hitting the lowercase 'l' key.  This should switch the y axes to logaritmic.  An uppercase 'L' will switch both x and y axes to log.  

Additional notes:

The *_new.gnu files plot the new cases and deaths in the same manner (where as the *.gnu is the cumulative totals).  No checks on sanity are done, and apparently some cases that were attributed to COVID19 were removed, possibly?  

These are quick and dirty plots to check on areas I care about deeply.  I also need to remove the delay/mortality rate bits of this, (or at least make the delay be zero, so the deaths have the correct date (or make an x2 delayed axis on top, so the date can be read off that directly).

Also, maybe change from days from start to actual dates (or have a new set of plots with the dates).  This is all nice things that I have to get back to my other tasks and my or may not get done.
