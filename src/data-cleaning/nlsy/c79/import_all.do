version 14.1
clear all
set more off
capture log close

log using "import_all.log", replace

set maxvar 32000

global afq "../../../../data/nlsy/raw/AFQT_MATCHING/"
global raw "../../../../data/nlsy/raw/c79/"
global imd "../../../../data/nlsy/intermediate/c79/"
global cln "../../../../data/nlsy/cleaned/c79/"

**********************************************************
* Import and save the data
**********************************************************
do import_obesity.do
sort id year
compress

save ${imd}raw.dta, replace
//! zip -u ${imd}raw.dta.zip raw.dta

log close
