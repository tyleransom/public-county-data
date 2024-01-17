version 14.1
clear all
set more off
capture log close

log using "create_master.log", replace

set maxvar 32000

global afq "../../../../data/nlsy/raw/AFQT_MATCHING/"
global raw "../../../../data/nlsy/raw/c79/"
global imd "../../../../data/nlsy/intermediate/c79/"
global cln "../../../../data/nlsy/cleaned/c79/"

**************************************************
* Create all permanent variables and save all data
**************************************************

//! unzip -o ${imd}raw.dta.zip
use ${imd}raw.dta, clear
//! zip -u ${imd}raw.dta

xtset id year

* Bring in data on CPI and minimum wage
run cpi_min_wage.do

* Create various demographic variables
do create_obesity.do

* Variables to keep:
keep ${keeperdemog} 

xtsum id if year>=1994
drop if missInt
xtsum id if year>=1994 & !missInt

xtsum id if year>=1994
xtsum id if year>=1994 & female
xtsum id if year>=1994 & !female

drop if mi(hgc)

xtsum id if year>=1994 & !mi(hgc) 
xtsum id if year>=1994 & !mi(hgc) & female
xtsum id if year>=1994 & !mi(hgc) & !female

xtsum id if year>=1994 & !mi(hgc) & age==25
xtsum id if year>=1994 & !mi(hgc) & age==25 & female
xtsum id if year>=1994 & !mi(hgc) & age==25 & !female

compress
save ${cln}master, replace
//! zip -u ${cln}master.dta.zip master.dta
log close
