BEGIN { 
   FIPS=6085
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

$4==FIPS && NR>1{
    y = substr($1, 1, 4);
    m = substr($1, 6, 2);
    d = substr($1, 9, 2);
    date=$1;
    county=$2
    state=$3;
    fips=$4;
    cases=$5;
    death=$6;
#    val = mktime(y " " m " " d " 00 00 00");
    print  CumDays[m-1]+d, cases, death
#    print $1, y, m, d
}
