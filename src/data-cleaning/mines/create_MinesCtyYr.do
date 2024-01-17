version 14.1
clear all
set more off
capture log close

log using "create_MinesCtyYr.log", replace

set maxvar 32000


*--------------------------------------------------
* import data from Dept of Homeland Security
* accessed from https://hifld-geoplatform.opendata.arcgis.com/datasets/mines-and-mineral-resources/explore?location=43.220190%2C-115.670562%2C4.20&showTable=true on 30 Nov 2021
* If you open this in Excel before importing, it will mess up the dates
*--------------------------------------------------
insheet using "Mines_and_Mineral_Resources.csv", comma clear


*--------------------------------------------------
* Data cleaning
*--------------------------------------------------

* format date of mine date (most obs have identical contdate and geodate)
gen contdateprime1 = subinstr(contdate,"+00","",.)
gen contdateprime  = Clock(contdateprime1,"YMDhms")
format contdateprime %tC
drop contdateprime1

* format state and county FIPS
rename  state  stateabb
rename  county countyname
generat state  = round(fips/1000)
generat county = fips - state*1000

log close
