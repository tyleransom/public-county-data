version 14.1
clear all
set more off
capture log close

log using "import_all.log", replace

global afq "../../../../data/nlsy/raw/AFQT_MATCHING/"
global raw "../../../../data/nlsy/raw/y97/"
global imd "../../../../data/nlsy/intermediate/y97/"
global cln "../../../../data/nlsy/cleaned/y97/"

**********************************************************
* Import and save the data
**********************************************************
do import_obesity.do
sort id year
compress

***********************************
* Merge the IQ test score data
***********************************
preserve
    tempfile afqtdata
    use ${afq}afqt_adjusted_final97, clear
    ren ID id
    keep id afqt_std
    zscore afqt_std
    ren z_afqt_std afqt
    keep id afqt
    save `afqtdata'
restore
merge     m:1 id using `afqtdata', keepusing(id afqt)
assert    _merge!=2
drop      _merge

compress
save ${imd}raw.dta, replace
//! zip -u ${imd}raw.dta.zip raw.dta

log close
