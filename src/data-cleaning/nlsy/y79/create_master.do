version 14.1
clear all
set more off
capture log close

log using "create_master.log", replace

set maxvar 32000

global afq "../../../../data/nlsy/raw/AFQT_MATCHING/"
global raw "../../../../data/nlsy/raw/y79/"
global imd "../../../../data/nlsy/intermediate/y79/"
global cln "../../../../data/nlsy/cleaned/y79/"

**************************************************
* Create all permanent variables and save all data
**************************************************

//! unzip -o ${imd}raw.dta.zip
use ${imd}raw.dta, clear
//! zip -u ${imd}raw.dta

generat wave = year
recode wave (1970 = 1) (1971 = 2) (1972 = 3) (1973 = 4) (1974 = 5) (1975 = 6) (1976 = 7) (1977 = 8) (1978 = 9) (1979 = 10) (1980 = 11) (1981 = 12) (1982 = 13) (1983 = 14) (1984 = 15) (1985 = 16) (1986 = 17) (1987 = 18) (1988 = 19) (1989 = 20) (1990 = 21) (1991 = 22) (1992 = 23) (1993 = 24) (1994 = 25) (1996 = 26) (1998 = 27) (2000 = 28) (2002 = 29) (2004 = 30) (2006 = 31) (2008 = 32) (2010 = 33) (2012 = 34) (2014 = 35) (2016 = 36) (2018 = 37) 

xtset id wave

* Bring in data on CPI and minimum wage
run cpi_min_wage.do

* Create various demographic variables
do create_obesity.do

* Variables to keep:
keep ${keeperdemog} 

xtsum id if year>=1979
drop if missInt
xtsum id if year>=1979 & !missInt
* drop the two oversamples that other papers typically ignore
drop if oversamplePoor | oversampleMilitary

xtsum id if year>=1979
xtsum id if year>=1979 & female
xtsum id if year>=1979 & !female

drop if mi(hgc)

xtsum id if year>=1979 & !mi(hgc) 
xtsum id if year>=1979 & !mi(hgc) & female
xtsum id if year>=1979 & !mi(hgc) & !female

xtsum id if year>=1979 & !mi(hgc) & age==25
xtsum id if year>=1979 & !mi(hgc) & age==25 & female
xtsum id if year>=1979 & !mi(hgc) & age==25 & !female

compress
save ${cln}master, replace
//! zip -u ${cln}master.dta.zip master.dta
log close

