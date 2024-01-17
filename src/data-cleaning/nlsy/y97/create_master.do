version 14.1
clear all
set more off
capture log close

log using "create_master.log", replace

global afq "../../../../data/nlsy/raw/AFQT_MATCHING/"
global raw "../../../../data/nlsy/raw/y97/"
global imd "../../../../data/nlsy/intermediate/y97/"
global cln "../../../../data/nlsy/cleaned/y97/"

**************************************************
* Create all permanent variables and save all data
**************************************************

//! unzip -o raw.dta.zip
use ${imd}raw.dta, clear
//! zip -u ${imd}raw.dta

generat wave = year
recode wave (1990 = 1) (1991 = 2) (1992 = 3) (1993 = 4) (1994 = 5) (1995 = 6) (1996 = 7) (1997 = 8) (1998 = 9) (1999 = 10) (2000 = 11) (2001 = 12) (2002 = 13) (2003 = 14) (2004 = 15) (2005 = 16) (2006 = 17) (2007 = 18) (2008 = 19) (2009 = 20) (2010 = 21) (2011 = 22) (2013 = 23) (2015 = 24) (2017 = 25) (2019 = 26)

xtset id wave

* Bring in data on CPI and minimum wage
run cpi_min_wage.do

* Create various demographic variables
do create_obesity.do

* Variables to keep:
keep ${keeperdemog} 

xtsum id if year>=1997
drop if missInt
xtsum id if year>=1997 & !missInt

xtsum id if year>=1997
xtsum id if year>=1997 & female
xtsum id if year>=1997 & !female

drop if mi(hgc)

xtsum id if year>=1997 & !mi(hgc) 
xtsum id if year>=1997 & !mi(hgc) & female
xtsum id if year>=1997 & !mi(hgc) & !female

xtsum id if year>=1997 & !mi(hgc) & age==25
xtsum id if year>=1997 & !mi(hgc) & age==25 & female
xtsum id if year>=1997 & !mi(hgc) & age==25 & !female

compress
save ${cln}master, replace
//! zip -u ${cln}master.dta.zip master.dta
log close

