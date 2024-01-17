***************************************************
* Generate various demographic variables
***************************************************

* age
drop  age
gener age = year-dob_yr1979-1
label var age "AGE AS OF JAN 1"
gener birthq  = 1*inrange(dob_mo1979,1,3)+2*inrange(dob_mo1979,4,6)+3*inrange(dob_mo1979,7,9)+4*inrange(dob_mo1979,10,12)
gener birthmo = dob_mo1979
gener birthyr = dob_yr1979

* missing parent's education
generat m_hgcMoth = (hgcMoth>=.)
replace hgcMoth = 0 if m_hgcMoth==1
generat m_hgcFath = (hgcFath>=.)
replace hgcFath = 0 if m_hgcFath==1
label var m_hgcMoth "MISSING MOTHER'S HGC"
label var m_hgcFath "MISSING FATHER'S HGC"

** Fix AFQT variables
generat m_afqt = mi(afqt)
replace afqt   = 0 if mi(afqt)

* Check all missings accounted for
foreach V in hgcMoth hgcFath afqt {
    assert !missing( `V')
    count if m_`V'
    assert r(N)~=0
}

* Fix heights so BMI is a valid measure
replace height = . if inrange(height,84.01,.)
bys id (year): egen numHeightObs = count(height)

gen firstHeightYrA = year if !mi(height)
bys id (year): egen firstHeightYr = min(firstHeightYrA)
gen firstHeightA = height if year==firstHeightYr
bys id (year): egen firstHeight = mean(firstHeightA)
drop firstHeightA firstHeightYrA

gen lastHeightYrA = year if !mi(height)
bys id (year): egen lastHeightYr = max(lastHeightYrA)
gen lastHeightA = height if year==lastHeightYr
bys id (year): egen lastHeight = mean(lastHeightA)
drop lastHeightA lastHeightYrA

bys id (year): egen maxHeight = max(height)
bys id (year): egen minHeight = min(height)
gen heightFlag = (maxHeight - minHeight>6) & !mi(maxHeight) & !mi(minHeight)

gen heightTrend = (lastHeight - firstHeight)/(lastHeightYr - firstHeightYr)

replace height = . if heightTrend<-.05 | numHeightObs<2
replace height = 58 if height<58
replace height = 84 if height>84 & !mi(height)

* Interpolate missing heights:
bys id (year): ipolate height year, gen(heightSmooth)
bys id (year): ipolate height year, gen(heightSmoother) epolate
replace heightSmoother = . if year<1981

* Fix weights so BMI is a valid measure
replace weight = . if inrange(weight,500.01,.)

* Interpolate missing heights:
bys id (year): ipolate weight year, gen(weightSmooth)
bys id (year): ipolate weight year, gen(weightSmoother) epolate
replace weightSmoother = . if year<1981

* create BMI measure (bmi =  weight (lb) / [height (in)]^2 x 703)
gen bmiA = weightSmooth/(heightSmooth^2)*703
gen bmiB = weightSmoother/(heightSmoother^2)*703

* bottom- and top-code BMIs at 18 and 40, respectively
replace bmiA = 40 if bmiA>40 & !mi(bmiA)
replace bmiA = 18 if bmiA<18 & !mi(bmiA)
replace bmiB = 40 if bmiB>40 & !mi(bmiB)
replace bmiB = 18 if bmiB<18 & !mi(bmiB)

gen overweight = inrange(bmiB,25.01,30) if !mi(bmiB)
gen obese = inrange(bmiB,30.01,.)       if !mi(bmiB)
gen ovrwgtObese = inrange(bmiB,25.01,.) if !mi(bmiB)
ren bmiB bmi

* foreignBorn
gen foreignBorn = country_born==2
label var foreignBorn "FOREIGN BORN DUMMY"

* year entered us if foreign born
replace yearEnteredUS = yearEnteredUS+1900 if yearEnteredUS<.

* race
gen black    = race_screen==2
gen hispanic = race_screen==1
gen white    = race_screen==3 & inlist(ethnicity1,3,5,6,7,11,12,22,24,25,27,29)
gen asian    = race_screen==3 & inlist(ethnicity1,2,4,8,10,13,14,26)
gen other    = race_screen==3 & inlist(ethnicity1,0,1,9,15,16,17,18,19,20,21,23,28)
gen race     = 1 if white
replace race = 2 if black
replace race = 3 if hispanic
replace race = 4 if asian
replace race = 5 if other | (~white & ~black & ~hispanic & ~asian)
assert race != 0
lab var white "WHITE"
lab var black "BLACK"
lab var hispanic "HISPANIC"
lab var asian "ASIAN"
lab var other "OTHER"
lab var race "RACE"
lab def vlrace 1 "White" 2 "Black" 3 "Hispanic" 4 "Asian" 5 "Other"

* female
gen female = sex==2
label var female "FEMALE"

* birth cohorts
gen     born1957 = dob_yr==1957
gen     born1958 = dob_yr==1958
gen     born1959 = dob_yr==1959
gen     born1960 = dob_yr==1960
gen     born1961 = dob_yr==1961
gen     born1962 = dob_yr==1962
gen     born1963 = dob_yr==1963
gen     born1964 = dob_yr==1964
lab var born1957 "BIRTH COHORT DUMMY 1957"
lab var born1958 "BIRTH COHORT DUMMY 1958"
lab var born1959 "BIRTH COHORT DUMMY 1959"
lab var born1960 "BIRTH COHORT DUMMY 1960"
lab var born1961 "BIRTH COHORT DUMMY 1961"
lab var born1962 "BIRTH COHORT DUMMY 1962"
lab var born1963 "BIRTH COHORT DUMMY 1963"
lab var born1964 "BIRTH COHORT DUMMY 1964"

* live with mom at 14
gen       liveWithMom14  = (live_with_14==11) | (live_with_14==21) | (live_with_14==31) | (live_with_14==41) | (live_with_14==51) | (live_with_14==91)
label var liveWithMom14  "LIVE WITH MOTHER AT AGE 14"
gen       femaleHeadHH14 = (live_with_14==51) | (live_with_14==52) | (live_with_14==53) | (live_with_14==54) | (live_with_14==91) | (live_with_14==93)
label var femaleHeadHH14 "FEMALE HEADED HOUSEHOLD AT AGE 14"

* oversample dummies
gen     oversampleRace     = (sample_id==10 | sample_id==11 | sample_id==13 | sample_id==14)
gen     oversamplePoor     = (sample_id==9  | sample_id==12)
gen     oversampleMilitary = (sample_id>=15 & sample_id<= 20)
lab var oversampleRace     "OVERSAMPLE - BLACKS AND HISPANICS"
lab var oversamplePoor     "OVERSAMPLE - POOR WHITES"
lab var oversampleMilitary "OVERSAMPLE - MILITARY"

* deflate family income
sort id year
by id: replace netFamilyIncome = netFamilyIncome/cpi
replace netFamilyIncome = 1 if netFamilyIncome<=0
generat lnNetFamInc     = ln(netFamilyIncome)
replace netFamilyIncome = netFamilyIncome/1000

generat m_netFamilyIncome=(netFamilyIncome>=. | netFamilyIncome==1)
replace netFamilyIncome = 0 if m_netFamilyIncome==1
replace lnNetFamInc     = 0 if m_netFamilyIncome==1
lab var netFamilyIncome   "NET FAMILY INCOME, 1000's of 1982-4 $"
lab var lnNetFamInc       "LOG NET FAMILY INCOME, 1982-4 $"
lab var m_netFamilyIncome "MISSING NET FAMILY INCOME"

* weights
rename      svywgt svywgt_cross
gen         svywgt_temp = svywgt_cross if year==1979
by id: egen svywgt = max(svywgt_temp)
drop        svywgt_temp
lab var     svywgt "WEIGHT FROM FIRST YEAR OF SURVEY"

*--------------------------------------------------------------------------------
* Health variables
*--------------------------------------------------------------------------------
* fix variables with different time units
recode daysDrinkAlcoholPastMonth drinkAlcoholPastMonth ever100cigs marijuana (.v = 0)
generat timesWeekEatFastFood = freqEatFastFood*(freqEatFastFoodTimeU==2) + (freqEatFastFood*7)*(freqEatFastFoodTimeU==1)
replace timesWeekEatFastFood = 21 if inrange(timesWeekEatFastFood,21,.)
generat timesWeekDrinkSugary = freqSugary*(freqSugaryTimeU==2) + (freqSugary*7)*(freqSugaryTimeU==1)
replace timesWeekDrinkSugary = 49 if inrange(timesWeekDrinkSugary,49,.)
generat timesWeekSnack       = freqSnack*(freqSnackTimeU==2) + (freqSnack*7)*(freqSnackTimeU==1)
replace timesWeekSnack       = 35 if inrange(timesWeekSnack,35,.)
generat timesWeekSkipMeal    = freqSkipMeal*(freqSkipMealTimeU==2) + (freqSkipMeal*7)*(freqSkipMealTimeU==1)
replace timesWeekSkipMeal    = 21 if inrange(timesWeekSkipMeal,21,.)

* get rid of "don't buy food" category of nutrition awareness variables
recode readNutritionLabels readIngredients (0 = .)

* get extensive margin for fast food and sugary drink consumption
generat fastFoodEater = inrange(timesWeekEatFastFood,1,.)
generat sugaryDrinker = inrange(timesWeekDrinkSugary,1,.)
generat snacker       = inrange(timesWeekSnack,1,.)
generat mealSkipper   = inrange(timesWeekSkipMeal,1,.)

* ever smoke/drink/marijuana
bys id (year): egen ever_marijuana       = max(marijuana)
bys id (year): egen ever_100_cigarettes  = max(ever100cigs)
bys id (year): egen ever_alcohol         = max(daysDrinkAlcoholPastMonth)


*============================================================================
* missed interviews
* variables that flag if the year is missing, how long the missing has 
*  gone on, how long the missing lasts, and if it's the last missing spell
*  Also, variables that list whether the element is the first after a spell
*  and the last year of data before the spell.
*============================================================================
sort id year
gen         missInt = ~mi(reason_noninterview)
by id: egen everMissInt = max(missInt)
gen         ageAtMissInt = age*missInt
gen         yearMissInt = year*missInt

gen            missIntCum = 0
by id: replace missIntCum = missIntCum[_n-1] + 1 if missInt[_n]==1

gsort +id -year
gen            missIntLength = missIntCum
by id: replace missIntLength = missIntLength[_n-1] if missIntCum[_n]!=0 & missIntCum[_n-1]!=0 & year<1994

gen            missIntLastSpell = 0
by id: replace missIntLastSpell = 1 if missIntCum[_n]!=0 & (year==1994 | missIntLastSpell[_n-1]==1)
sort id year

by id: gen     missIntEnd = (missInt[_n-1]==1) & (missInt[_n]==0) & (year<=1994)

by id: gen     missIntEndLength = missIntEnd[_n]*missIntLength[_n-1]
replace        missIntEndLength = 0 if year==1970

gen            missIntFirstYear = 0
by id: replace missIntFirstYear = year[_n]               if missIntCum[_n]==1
by id: replace missIntFirstYear = missIntFirstYear[_n-1] if missIntCum[_n]>1

gen            missIntLongestSpellYet = missIntLength
by id: replace missIntLongestSpellYet = missIntLongestSpellYet[_n-1] if missIntLongestSpellYet<missIntLongestSpellYet[_n-1] & _n>1

by id: gen     missIntInvalidPeriod   = missIntLongestSpellYet[_n]>=3 | missIntLastSpell[_n]==1

by id: gen     lastValidInt           = missIntInvalidPeriod[_n]==0 & missIntInvalidPeriod[_n+1]==1

gen            temp_date              = mdy(interview_mo,1,year) if lastValidInt
by id: egen    lastValidIntDate       = max(temp_date)
format         lastValidIntDate %td
drop           temp_date

gen            temp_date              = mdy(interview_mo,1,year) if missIntLastSpell==0 & missIntLastSpell[_n+1]==1
by id: egen    beforeLastSpellIntDate = max(temp_date)
format         beforeLastSpellIntDate %td
drop           temp_date

label var missInt                "MISSED INTERVIEW IN CURRENT YEAR"
label var missIntCum             "RUNNING TALLY OF CURRENT MISSED INTERVIEW SPELL"
label var missIntLength          "LENGTH OF CURRENT MISSED INTERVIEW SPELL"
label var missIntLastSpell       "ELEMENT OF LAST MISSED INTERVIEW SPELL"
label var missIntEnd             "FIRST OBS AFTER MISSED INTERVIEW SPELL"
label var missIntEndLength       "LENGTH OF MISSED INTERVIEW SPELL THAT ENDED THE PREVIOUS YEAR"
label var missIntFirstYear       "YEAR OF FIRST OBS OF MISSED INTERVIEW SPELL" 
label var missIntLongestSpellYet "LENGTH OF LONGEST SPELL INDIV HAS EXPERIENCE BY T"
label var missIntInvalidPeriod   "ELEMENT OF INVALID INTERVIEW PERIOD"
label var lastValidInt           "LAST VALID INTERVIEW"
label var lastValidIntDate       "DATE OF LAST VALID INTERVIEW"

foreach x of numlist 1/18 {
    local temp=`x'+9
    bys id: gen R`x'interviewDate  = ym(interview_yr[`temp'],interview_mo[`temp'])
    format R`x'interviewDate %tm
}

* get proportion of people who ever missed any number of consecutive interviews
foreach x of numlist 1/11 {
    by id: gen miss_`x'_intA  = (missIntLength==`x')
}
foreach x of numlist 1/11 {
    by id: egen miss_`x'_intB  = mean(miss_`x'_intA )
}
foreach x of numlist 1/11 {
    by id: gen ever_miss_`x'_int  = (miss_`x'_intB >0)
}
drop miss_*intA miss_*intB

gen everMiss3plusInt = ((ever_miss_3_int)|(ever_miss_4_int)|(ever_miss_5_int)|(ever_miss_6_int)|(ever_miss_7_int)|(ever_miss_8_int)|(ever_miss_9_int)|(ever_miss_10_int)|(ever_miss_11_int))

* get proportion of people who return after missing any number of consecutive interviews
foreach x of numlist 1/11 {
    by id: gen return_after_`x'_miss_intA  = (missIntLength[_n-1]==`x'  & missIntLength[_n]==0 & year<=1994)
}
foreach x of numlist 1/11 {
    by id: egen return_after_`x'_miss_intB  = mean(return_after_`x'_miss_intA  & year<=1994)
}
foreach x of numlist 1/11 {
    by id: gen ever_return_after_`x'_miss_int  = (return_after_`x'_miss_intB >0  & year<=1994)
}
drop return_after*A return_after*B

gen everReturnAfter3plusMissInt = ((ever_return_after_3_miss_int)|(ever_return_after_4_miss_int)|(ever_return_after_5_miss_int)|(ever_return_after_6_miss_int)|(ever_return_after_7_miss_int)|(ever_return_after_8_miss_int)|(ever_return_after_9_miss_int)|(ever_return_after_10_miss_int)|(ever_return_after_11_miss_int))

* Count number of people who have multiple missing interview spells lasting different lengths
foreach x of numlist 1/11 {
    count if ever_return_after_1_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 2/11 {
    count if ever_return_after_2_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 3/11 {
    count if ever_return_after_3_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 4/11 {
    count if ever_return_after_4_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 5/11 {
    count if ever_return_after_5_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 6/11 {
    count if ever_return_after_6_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 7/11 {
    count if ever_return_after_7_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 8/11 {
    count if ever_return_after_8_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 9/11 {
    count if ever_return_after_9_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 10/11 {
    count if ever_return_after_10_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}
foreach x of numlist 11/11 {
    count if ever_return_after_11_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1979
}

foreach x of numlist 1/11 {
    sum ever_return_after_`x'_miss_int if ever_miss_`x'_int==1 & year==1979
}

sum everReturnAfter3plusMissInt if everMiss3plusInt==1 & year==1979

tab ageAtMissInt if ageAtMissInt>0, mi
tab ageAtMissInt dob_yr if ageAtMissInt>0, mi col nofreq
tab yearMissInt if yearMissInt>0, mi


lab var birthq  "Quarter of birth"
lab var birthmo "Month of birth"
lab var birthyr "Year of birth"

* Highest grade completed
gen hgcRaw = high_grade_comp_May
bys id (year): ipolate hgcRaw year, gen(hgc) epolate
replace hgc = . if year<1979

gen grad4yr = hgc>=16 & ~mi(hgc)

bys id (wave): egen maxged = max(diploma_or_ged)
gen ged = inlist(maxged,2,3)

gen gradHS  = (hgc>=12 & ~mi(hgc)) | ged

replace gradHS  = . if !mi(reason_noninterview)
replace grad4yr = . if !mi(reason_noninterview)

lab var hgc            "Highest Grade Completed (years)"
lab var ged            "Holds a GED"
lab var gradHS         "Absorbing indicator for HS graduation (or GED)"
lab var grad4yr        "Absorbing indicator for 4-year college graduation"

ren netFamilyIncome   familyIncome 
ren lnNetFamInc       lnFamInc 
ren m_netFamilyIncome m_FamilyIncome


* Labor market variables: wages, occup., industry (based on main job as defined by CV_MAINJOB_FLG)
egen wagemax = rowmax(wage_job1 wage_job2 wage_job3 wage_job4 wage_job5)
gen  Main_job   = .
forvalues X=5(-1)1 {
    replace Main_job = `X' if wage_job`X'==wagemax
}
ren wagemax wage

gen occJobMain = occupation_job1
gen indJobMain = industry_job1
forvalues X = 2/5 {
    replace occJobMain = occupation_job`X' if Main_job == `X'
    replace indJobMain = industry_job`X'   if Main_job == `X'
}

gen occ70 = occJobMain if year<2000
gen occ00 = occJobMain if year>=2000
gen ind70 = indJobMain if year<2000
gen ind00 = indJobMain if year>=2000

lab var occ70 "Occupation (4-digit), 1970 Census code"
lab var ind70 "Industry (4-digit), 1970 Census code"
lab var occ00 "Occupation (4-digit), 2000 Census code"
lab var ind00 "Industry (4-digit), 2000 Census code"

replace wage = wage/cpi
replace wage = wage/100
winsor2 wage, cuts(1 99) by(year)
ren wage wageraw
ren wage_w wage
sum wage




** Variables to keep:
global keeperdemog id year wave age birthq birthmo birthyr height* weight* bmi overweight obese ovrwgtObese hgcMoth m_hgcMoth m_hgcFath hgcFath afqt m_afqt rotter_score familyIncome lnFamInc m_FamilyIncome svywgt daysDrinkAlcoholPastMonth drinkAlcoholPastMonth ever_alcohol ever100cigs ever_100_cigarettes marijuana ever_marijuana healthProblemKindWork healthProblemAmntWork timesWeekSnack snacker timesWeekEatFastFood fastFoodEater timesWeekDrinkSugary sugaryDrinker timesWeekSkipMeal mealSkipper tryingLoseGainWeight readNutritionLabels readIngredients freqVigorousExercise lengthVigorousExercise freqModerateExercise lengthModerateExercise freqStrengthExercise *iss* lastValid* foreignBorn yearEnteredUS black hispanic white asian race female born* liveWithMom14 femaleHeadHH14 oversample* hgc ged gradHS grad4yr wage ind70 occ70 ind00 occ00
