END {
   print state
}
BEGIN { 
   FIPS=6
   FS = ","; 
   OFS ="\t" ; 
   MonthDays[ 1]=31
   MonthDays[ 2]=29 #Leap Year this year
   MonthDays[ 3]=31
   MonthDays[ 4]=30
   MonthDays[ 5]=31
   MonthDays[ 6]=30
   MonthDays[ 7]=31
   MonthDays[ 8]=31
   MonthDays[ 9]=30
   MonthDays[10]=31
   MonthDays[11]=30
   MonthDays[12]=31
   CumDays[0]=0;
   for ( i=i; i<12; ++i){
      CumDays[i]=CumDays[i-1]+MonthDays[i];
      }
   }
NR==1{

}

$3==FIPS && NR==2{
    y = substr($1, 1, 4);
    m = substr($1, 6, 2);
    d = substr($1, 9, 2);
    date=$1;
    state=$2;
    fips=$3;
    cases=$4;
    death=$5;
#    val = mktime(y " " m " " d " 00 00 00");
#    print  CumDays[m-1]+d, cases, death
#    print $1, y, m, d
}
$3==FIPS && NR>2{
    y = substr($1, 1, 4);
    m = substr($1, 6, 2);
    d = substr($1, 9, 2);
    date=$1;
    state=$2;
    fips=$3;
    delta_cases=$4-cases
    cases=$4;
    delta_death=$5-death
    death=$5;
#    val = mktime(y " " m " " d " 00 00 00");
#    print  CumDays[m-1]+d, cases, death,delta_cases, delta_death
    exit 0
#    print $1, y, m, d
}
