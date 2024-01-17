version 14.1
clear all
set more off
capture log close

log using "append_all.log", replace

global cln_c79 "../../../data/nlsy/cleaned/c79/"
global cln_y79 "../../../data/nlsy/cleaned/y79/"
global cln_y97 "../../../data/nlsy/cleaned/y97/"
global cln_ovr "../../../data/nlsy/cleaned/"

**************************************************
* Append all three cohorts together
**************************************************

use          ${cln_y79}master.dta, clear
append using ${cln_y97}master.dta, generate(cohortFlag)
recode  cohortFlag (0 = 1979) (1 = 1997)
lab var cohortFlag "Cohort Flag (1979 or 1997)"
append using ${cln_c79}master.dta
tab cohortFlag, mi

generat cohort = ""
replace cohort = "NLSY79" if cohortFlag==1979
replace cohort = "NLSY97" if cohortFlag==1997
replace cohort = "NLSY79 Children" if cohortFlag==.
drop cohortFlag
tab cohort

order cohort id year id_moth age weight* height* hgc

tab age cohort, sum(bmi) mean

save ${cln_ovr}combined.dta, replace
log close
