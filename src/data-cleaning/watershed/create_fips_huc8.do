version 14.1
clear all
set more off
capture log close

log using "create_fips_huc8.log", replace

global raw "../../../data/watershed/raw/"
global cln "../../../data/watershed/cleaned/"

* read in data
use ${raw}huc8_county, clear

* variable labels
lab var REG "Major Water Resource Region (MWRR)"

* clean FIPS codes
destring fips, replace force
ren fips FIPS
bys FIPS: gen huc_number = _n

* get modal region, subregion, and access
bys FIPS (huc_number): egen modal_reg = mode(REG), maxmode
bys FIPS (huc_number): egen modal_sub = mode(SUB), maxmode
bys FIPS (huc_number): egen modal_acc = mode(ACC), maxmode
lab val modal_reg REG
lab val modal_sub SUB
lab val modal_acc ACC
drop REG SUB ACC

* create string variables and then convert those to numeric
decode modal_sub, gen(SUB)
decode modal_reg, gen(REG)
decode modal_acc, gen(ACC)

destring SUB, replace force
destring REG, replace force
destring ACC, replace force

* reshape wide to get unique FIPS
reshape wide HUC_CODE HUC_NAME CAT, i(FIPS REG SUB ACC) j(huc_number)
order FIPS REG SUB ACC

isid FIPS

foreach var of varlist * {
    rename `var' `=strlower("`var'")'
}

save ${cln}fips_huc8_unique, replace
outsheet using ${cln}fips_watershed.csv, comma replace

log close
