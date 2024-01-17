***************************************************
* Generate various demographic variables
***************************************************

* age
gener age = year-birth_year-1
label var age "AGE AS OF JAN 1"
gener birthq  = 1*inrange(birth_month,1,3)+2*inrange(birth_month,4,6)+3*inrange(birth_month,7,9)+4*inrange(birth_month,10,12)
gener birthmo = birth_month
gener birthyr = birth_year

**Recode parental education variables
recode  Bio_father_highest_educ (95 = .)
recode  Bio_mother_highest_educ (95 = .)
rename  Bio_mother_highest_educ hgcMoth
generat m_hgcMoth = mi(hgcMoth)
replace hgcMoth = 0 if mi(hgcMoth)
rename  Bio_father_highest_educ hgcFath
generat m_hgcFath = mi(hgcFath)
replace hgcFath = 0 if mi(hgcFath)

**Parent height/weight
gen parent_height = parent_height_feet*12 + parent_height_inches
gen bio_parent1_height = bio_parent1_height_feet*12 + bio_parent1_height_inches
gen bio_parent2_height = bio_parent2_height_feet*12 + bio_parent2_height_inches
replace parent_weight = bio_parent1_weight if mi(parent_weight)
replace parent_weight = bio_parent2_weight if mi(parent_weight)
replace parent_height = bio_parent1_height if mi(parent_height)
replace parent_height = bio_parent2_height if mi(parent_height)
generat m_parent_weight = mi(parent_weight)
replace parent_weight = 0 if mi(parent_weight)
generat m_parent_height = mi(parent_height)
replace parent_height = 0 if mi(parent_height)

**Fix Born_abroad variable, etc.
bys id: egen born_here = mean(bornUS)
replace born_here=1 if born_here>0 & born_here<1
generat foreignBorn = 1-born_here
drop    born_here

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
replace heightSmoother = . if year<1997

* Fix weights so BMI is a valid measure
replace weight = . if inrange(weight,500.01,.)

* Interpolate missing heights:
bys id (year): ipolate weight year, gen(weightSmooth)
bys id (year): ipolate weight year, gen(weightSmoother) epolate
replace weightSmoother = . if year<1997

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

* Generate race dummies
renam race_ethnicity race
gener white    = race==4
gener black    = race==1
gener hispanic = race==2
gener mixed    = race==3
label val race vl_race

* female
gen female = sex==2
label var female "FEMALE"

* birth cohorts
gen     born1980 = birth_year==1980
gen     born1981 = birth_year==1981
gen     born1982 = birth_year==1982
gen     born1983 = birth_year==1983
gen     born1984 = birth_year==1984
lab var born1980 "BIRTH COHORT DUMMY 1980"
lab var born1981 "BIRTH COHORT DUMMY 1981"
lab var born1982 "BIRTH COHORT DUMMY 1982"
lab var born1983 "BIRTH COHORT DUMMY 1983"
lab var born1984 "BIRTH COHORT DUMMY 1984"

* Fix relationship to Head of Household
generat      true_rel_HH_headA = Relationship_HH_head if year==1997
replace      true_rel_HH_headA = min(Relationship_to_Par_age12_, Relationship_HH_head) if (mi(Relationship_HH_head) | mi(Relationship_to_Par_age12_)) & year==1997 & Relationship_HH_head~=Relationship_to_Par_age12_
bys id: egen true_rel_HH_head  = mean(true_rel_HH_headA)
drop         true_rel_HH_headA
label   val  true_rel_HH_head vl_relPar

* Get whether or not person lives with mom in 1997
gen liveWithMom14 = inlist(true_rel_HH_head,1,2,4)

* Get whether or not person lives in female-headed household in 1997
gen femaleHeadHH14 = true_rel_HH_head==4

* deflate family income
sort id year
by id: replace grossFamilyIncome = grossFamilyIncome/cpi
replace grossFamilyIncome = 1 if grossFamilyIncome<=0
generat lnGrossFamInc     = ln(grossFamilyIncome)
replace grossFamilyIncome = grossFamilyIncome/1000

generat m_grossFamilyIncome=(grossFamilyIncome>=. | grossFamilyIncome==1)
replace grossFamilyIncome = 0 if m_grossFamilyIncome==1
replace lnGrossFamInc     = 0 if m_grossFamilyIncome==1
lab var grossFamilyIncome   "GROSS FAMILY INCOME, 1000's of 1982-4 $"
lab var lnGrossFamInc       "LOG GROSS FAMILY INCOME, 1982-4 $"
lab var m_grossFamilyIncome "MISSING GROSS FAMILY INCOME"

* weights
rename      svywgt svywgt_cross
gen         svywgt_temp = svywgt_cross if year==1997
by id: egen svywgt = max(svywgt_temp)
drop        svywgt_temp
lab var     svywgt "WEIGHT FROM FIRST YEAR OF SURVEY"

* missed interviews
* variables that flag if the year is missing, how long the missing has 
*  gone on, how long the missing lasts, if it's the last missing spell
*  and if it's the first long missing spell (long = 3+ missed interviews)
generat Interview_date                      = interview_mo+239 // add 239 to convert from NLSY base month (Dec 1979) to Stata base month (Jan 1960)
format  Interview_date %tm
replace Interview_date                      = .n if interview_mo==.n

foreach x of numlist 1/19 {
    local temp=`x'+7
    bys id: gen R`x'interviewDate  = Interview_date[`temp']
    bys id: gen R`x'interviewDay   = mdy(interviewM[`temp'],1,interviewY[`temp'])
    bys id: gen R`x'interviewWeek  = wofd(mdy(interviewM[`temp'],1,interviewY[`temp']))
    format R`x'interviewDate %tm
    format R`x'interviewDay  %td
    format R`x'interviewWeek %tw
}
gen flag1 = yofd(dofm(R1interviewDate)) ==1998 // create flag for imputing schooling before first interview
gen flag2 = yofd(dofm(R19interviewDate))==2020 // create flag for dropping observations after last interview

gen Interview_day                           = mdy(interviewM,1,interviewY)
gen Interview_month                         = month(dofm(Interview_date))
replace Interview_month                     = .n if Interview_date==.n
replace Interview_month                     = .  if Interview_date==.

gen miss_interview                          = (Interview_date==.n)
bys id: egen miss_interview_dumB            = mean(miss_interview)
gen ever_miss_interview                     = (miss_interview_dumB > 0)
drop miss_interview_dumB

gen age_at_miss_int                         = age*miss_interview
gen year_miss_int                           = year*miss_interview

gen miss_interview_cum                      = 0
by id: replace miss_interview_cum           = miss_interview_cum[_n-1] + 1 if miss_interview[_n]==1

gsort +id -year
gen miss_interview_length                   = miss_interview_cum
by id: replace miss_interview_length        = miss_interview_length[_n-1] if miss_interview_cum[_n]!=0 & miss_interview_cum[_n-1]!=0 & year~=2020

sort id year
* create flag for long missed interview spell
generate year_first_long_spellA             = year*(miss_interview_length>2)
replace  year_first_long_spellA             = . if year_first_long_spellA==0
bys id (year): egen year_first_long_spell   = min(year_first_long_spellA)
drop year_first_long_spellA
gen long_miss_flag                          = year>=year_first_long_spell

* create flag for any missed interview spell
generate year_first_short_spellA             = year*(miss_interview_length>0)
replace  year_first_short_spellA             = . if year_first_short_spellA==0
bys id (year): egen year_first_short_spell   = min(year_first_short_spellA)
drop year_first_short_spellA
gen short_miss_flag                          = year>=year_first_short_spell

gsort +id -year
gen miss_interview_last_spell               = 0
by id: replace miss_interview_last_spell    = 1 if miss_interview_cum[_n]!=0 & ( (year==2019 & ~flag2) | miss_interview_last_spell[_n-1]==1)
sort id year
label var miss_interview            "Missed Interview In Current Year"
label var miss_interview_cum        "Running Tally Of Current Missed Interview Spell"
label var miss_interview_length     "Length Of Current Missed Interview Spell"
label var miss_interview_last_spell "Element Of Last Missed Interview Spell"

* identify right-censored interview spells
generat not_missing_interview               = 1-miss_interview if year<2020
replace not_missing_interview               = 1 if year==2020 & flag2
generat nonmissing_int_year                 = year*not_missing_interview
bys id (year): egen max_nonmissing_int_year = max(nonmissing_int_year)
generat missIntLastSpell                    = (year>max_nonmissing_int_year)

* interview month of last survey year (either the last year before a 3+ missed spell, the last year before a right-censored spell, or 2019)
generat last_survey_yearA                   = year_first_long_spell-1 if year==year_first_long_spell
replace last_survey_yearA                   = max_nonmissing_int_year if year==2019

generat last_survey_year_hastyA             = year_first_short_spell-1 if year==year_first_short_spell
replace last_survey_year_hastyA             = max_nonmissing_int_year if year==2019

bys id (year): egen last_survey_year        = min(last_survey_yearA)
bys id (year): egen last_survey_year_hasty  = min(last_survey_year_hastyA)

gen last_int_dayA                           = Interview_day if year==last_survey_year
bys id (year): egen last_int_day            = mean(last_int_dayA)
format last_int_day %td


*--------------------------------------------------------------------------------
* Health variables
*--------------------------------------------------------------------------------
* fix variables with different time units
recode daysSmokedCigPastMonth daysDrinkAlcoholPastMonth (.v = 0)
generat timesWeekEatFastFood = freqEatFastFood*(freqEatFastFoodTimeU==2) + (freqEatFastFood*7)*(freqEatFastFoodTimeU==1)
replace timesWeekEatFastFood = 21 if inrange(timesWeekEatFastFood,21,.)
generat timesWeekDrinkSugary = freqDrinkSugary*(freqDrinkSugaryTimeU==2) + (freqDrinkSugary*7)*(freqDrinkSugaryTimeU==1)
replace timesWeekDrinkSugary = 49 if inrange(timesWeekDrinkSugary,49,.)
generat timesWeekSnack       = freqSnack*(freqSnackTimeU==2) + (freqSnack*7)*(freqSnackTimeU==1)
replace timesWeekSnack       = 35 if inrange(timesWeekSnack,35,.)

* get rid of "don't buy food" category of nutrition awareness variable
recode nutritionAwareness (0 = .)

* get extensive margin for fast food and sugary drink consumption
generat fastFoodEater = inrange(timesWeekEatFastFood,1,.)
generat sugaryDrinker = inrange(timesWeekDrinkSugary,1,.)
generat snacker       = inrange(timesWeekSnack,1,.)

* ever smoke/drink/marijuana
bys id (year): egen ever_marijuana       = max(marijuana)
bys id (year): egen ever_cigarette       = max(daysSmokedCigPastMonth)
bys id (year): egen ever_alcohol         = max(daysDrinkAlcoholPastMonth)
bys id (year): egen ever_eating_disorder = max(eatingDisorder)
recode ever_eating_disorder (. = 0)

/*
!!! TO DO: 
- perhaps use a factor model to measure health-consciousness since various measurements (smoking/drugs/alcohol/diet/exercise) are spottily observed?
*/


*--------------------------------------------------------------------------------
* Some summary stats on people's missing interview behavior throughout the survey
*--------------------------------------------------------------------------------
* get proportion of people who ever missed any number of consecutive interviews
foreach x of numlist 1/17 {
    by id: gen miss_`x'_intA  = (miss_interview_length==`x')
}
foreach x of numlist 1/17 {
    by id: egen miss_`x'_intB  = mean(miss_`x'_intA )
}
foreach x of numlist 1/17 {
    by id: gen ever_miss_`x'_int  = (miss_`x'_intB >0)
}
drop miss_*intA miss_*intB

gen ever_miss_3plus_int = ((ever_miss_3_int)|(ever_miss_4_int)|(ever_miss_5_int)|(ever_miss_6_int)|(ever_miss_7_int)|(ever_miss_8_int)|(ever_miss_9_int)|(ever_miss_10_int)|(ever_miss_11_int)|(ever_miss_12_int)|(ever_miss_13_int)|(ever_miss_14_int)|(ever_miss_15_int)|(ever_miss_16_int)|(ever_miss_17_int))

* get proportion of people who return after missing any number of consecutive interviews
foreach x of numlist 1/17 {
    by id: gen return_after_`x'_miss_intA  = (miss_interview_length[_n-1]==`x'  & miss_interview_length[_n]==0)
}
foreach x of numlist 1/17 {
    by id: egen return_after_`x'_miss_intB  = mean(return_after_`x'_miss_intA )
}
foreach x of numlist 1/17 {
    by id: gen ever_return_after_`x'_miss_int  = (return_after_`x'_miss_intB >0)
}
drop return_after*A return_after*B

gen ever_return_after_3plus_miss_int = ((ever_return_after_3_miss_int)|(ever_return_after_4_miss_int)|(ever_return_after_5_miss_int)|(ever_return_after_6_miss_int)|(ever_return_after_7_miss_int)|(ever_return_after_8_miss_int)|(ever_return_after_9_miss_int)|(ever_return_after_10_miss_int)|(ever_return_after_11_miss_int)|(ever_return_after_12_miss_int)|(ever_return_after_13_miss_int)|(ever_return_after_14_miss_int)|(ever_return_after_15_miss_int)|(ever_return_after_16_miss_int)|(ever_return_after_17_miss_int))

* Count number of people who have multiple missing interview spells lasting different lengths
foreach x of numlist 1/17 {
    count if ever_return_after_1_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 2/17 {
    count if ever_return_after_2_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 3/17 {
    count if ever_return_after_3_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 4/17 {
    count if ever_return_after_4_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 5/17 {
    count if ever_return_after_5_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 6/17 {
    count if ever_return_after_6_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 7/17 {
    count if ever_return_after_7_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 8/17 {
    count if ever_return_after_8_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 9/17 {
    count if ever_return_after_9_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 10/17 {
    count if ever_return_after_10_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 11/17 {
    count if ever_return_after_11_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 12/17 {
    count if ever_return_after_12_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 13/17 {
    count if ever_return_after_13_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 14/17 {
    count if ever_return_after_13_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 15/17 {
    count if ever_return_after_13_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 16/17 {
    count if ever_return_after_13_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}
foreach x of numlist 17/17 {
    count if ever_return_after_13_miss_int ==1 & ever_return_after_`x'_miss_int==1 & year==1997
}

foreach x of numlist 1/17 {
    sum ever_return_after_`x'_miss_int if ever_miss_`x'_int==1 & year==1997
}

sum ever_return_after_3plus_miss_int if ever_miss_3plus_int==1 & year==1997

tab age_at_miss_int            if age_at_miss_int>0, mi
tab age_at_miss_int birth_year if age_at_miss_int>0, mi col nofreq
tab year_miss_int              if year_miss_int>0, mi // show momentary interview missers
tab last_survey_year           if  year==2019 // show cumulative attrition in our sample (either because of permanent attrition from NLSY or having missed 3+ interviews)
tab last_survey_year_hasty     if  year==2019 // show cumulative attrition in our sample if we never made use of backfilled observations
tab max_nonmissing_int_year    if year==2019 // show cumulative attrition in our sample if we always used backfilled obs (i.e. if we kept super-long missed spells)

lab var birthq  "Quarter of birth"
lab var birthmo "Month of birth"
lab var birthyr "Year of birth"



* Highest grade completed
gen hgcRaw = Highest_Grade_Completed
bys id (year): ipolate hgcRaw year, gen(hgc) // epolate
replace hgc = . if year<1998

gen grad4yr = inrange(hgc,16,25) | (inrange(Highest_degree_ever,4,7))

gen diploma_or_ged = inlist(Highest_degree_ever,1,2)
bys id (wave): egen maxged = max(diploma_or_ged)
ren maxged ged

gen gradHS  = (hgc>=12 & ~mi(hgc)) | (inrange(Highest_degree_ever,2,7)) | ged
sum gradHS

lab var hgc            "Highest Grade Completed (years)"
lab var ged            "Holds a GED"
lab var gradHS         "Absorbing indicator for HS graduation (or GED)"
lab var grad4yr        "Absorbing indicator for 4-year college graduation"

ren grossFamilyIncome   familyIncome 
ren lnGrossFamInc       lnFamInc 
ren m_grossFamilyIncome m_FamilyIncome


* Labor market variables: wages, occup., industry (based on main job as defined by CV_MAINJOB_FLG)
gen wage = .
gen ind = .
gen occ = .
foreach x of numlist 1/14 {
    replace wage = Hrly_comp_job`x'_  if Main_job==`x'
    replace ind  = industry_job`x'_   if Main_job==`x'
    replace occ  = occupation_job`x'_ if Main_job==`x'
}

lab var ind "Industry (4-digit), 2002 Census code"
lab var occ "Occupation (4-digit), 2002 Census code"

replace wage = wage/cpi
replace wage = wage/100
winsor2 wage, cuts(1 99) by(year)
ren wage wageraw
ren wage_w wage
sum wage



** Variables to keep:
global keeperdemog id year wave age birthq birthmo birthyr height* weight* bmi overweight obese ovrwgtObese parent_height m_parent_height parent_weight m_parent_weight hgcMoth m_hgcMoth m_hgcFath hgcFath afqt m_afqt familyIncome lnFamInc m_FamilyIncome svywgt generalHealth daysSmokedCigPastMonth daysDrinkAlcoholPastMonth marijuana alcoholicDrinksPerDayPastMo ever_marijuana ever_cigarette ever_alcohol nutritionAwareness eatingDisorder ever_eating_disorder timesWeekEatFruit timesWeekEatVeg timesWeekEatFastFood fastFoodEater timesWeekDrinkSugary sugaryDrinker timesWeekSnack snacker freqModerateExercise freqModerateExerciseTimeU freqStrengthExercise freqStrengthExerciseTimeU freqVigorousExercise freqVigorousExerciseTimeU lengthModerateExercise lengthModerateExerciseTimeU lengthStrengthExercise lengthStrengthExerciseTimeU lengthVigorousExericse lengthVigorousExerciseTimeU timesWeekExercise30mins *iss* foreignBorn black hispanic white race female born* liveWithMom14 femaleHeadHH14 hgc ged gradHS grad4yr wage ind occ
