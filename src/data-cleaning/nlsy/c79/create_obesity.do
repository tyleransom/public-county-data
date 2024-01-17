***************************************************
* Generate various demographic variables
***************************************************

* age
gener age = year-dob_yr-1
label var age "AGE AS OF JAN 1"
gener birthyr = dob_yr

* Fix heights so BMI is a valid measure
replace height = . if inrange(height,86.01,.)
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

replace height = .  if numHeightObs<2
replace height = 18 if height<18
replace height = 84 if height>84 & !mi(height)

* Interpolate missing heights:
bys id (year): ipolate height year, gen(heightSmooth)
bys id (year): ipolate height year, gen(heightSmoother) epolate

* Fix weights so BMI is a valid measure
replace weight = . if inrange(weight,500.01,.)

* Interpolate missing heights:
bys id (year): ipolate weight year, gen(weightSmooth)
bys id (year): ipolate weight year, gen(weightSmoother) epolate

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

* race
gen black    = race==2
gen hispanic = race==1
* gen white    = race==3 & inlist(1,ethPortuguese,ethEnglish,ethFrench,ethGerman,ethGreek,ethIrish,ethItalian,ethPolish,ethRussian,ethScottish,ethWelsh,ethAmerican)
* gen asian    = race==3 & inlist(1,ethFilipino,ethChinese,ethAsianIndian,ethJapanese,ethKorean,ethVietnamese)
* gen other    = race==3 & inlist(1,ethHawaiian,ethNativeAmerican,ethNone,ethOther)
* tab race if year==1994
* ren race race_screen
* gen race     = 1 if white
* replace race = 2 if black
* replace race = 3 if hispanic
* replace race = 4 if asian
* replace race = 5 if other | (~white & ~black & ~hispanic & ~asian)
* assert race != 0
* tab race if year==1994
* tab race race_screen if year==1994
* lab var white "WHITE"
* lab var black "BLACK"
* lab var hispanic "HISPANIC"
* lab var asian "ASIAN"
* lab var other "OTHER"
* lab var race "RACE"
* lab def vlrace 1 "White" 2 "Black" 3 "Hispanic" 4 "Asian" 5 "Other"

* female
gen female = sex==2
label var female "FEMALE"

* deflate family income
sort id year
by id: replace familyIncome = familyIncome/cpi
replace familyIncome = 1 if familyIncome<=0
generat lnFamInc     = ln(familyIncome)
replace familyIncome = familyIncome/1000

generat m_FamilyIncome=(familyIncome>=. | familyIncome==1)
replace familyIncome = 0 if m_FamilyIncome==1
replace lnFamInc     = 0 if m_FamilyIncome==1
lab var familyIncome   "FAMILY INCOME, 1000's of 1982-4 $"
lab var lnFamInc       "LOG FAMILY INCOME, 1982-4 $"
lab var m_FamilyIncome "MISSING FAMILY INCOME"

lab var birthyr "Year of birth"

* Highest grade completed
gen hgcRaw = highestGradeCompleted
bys id (year): ipolate hgcRaw year, gen(hgc) epolate

gen grad4yr = (hgc>=16 & ~mi(hgc)) | (inrange(highestDegreeReceived,4,9))
gen ged     = highestDegreeReceived==1
gen gradHS  = (hgc>=12 & ~mi(hgc)) | (inrange(highestDegreeReceived,1,9))

replace gradHS  = . if weight==.m
replace grad4yr = . if weight==.m

lab var hgc     "Highest Grade Completed (years)"
lab var ged     "Holds a GED"
lab var gradHS  "Absorbing indicator for HS graduation (or GED)"
lab var grad4yr "Absorbing indicator for 4-year college graduation"




* Labor market variables: wages, occup., industry
egen wagemax = rowmax(Hrly_pay_job1_ Hrly_pay_job2_ Hrly_pay_job3_ Hrly_pay_job4_ Hrly_pay_job5_)
gen  Main_job   = .
forvalues X=5(-1)1 {
    replace Main_job = `X' if Hrly_pay_job`X'_==wagemax
}
ren wagemax wage

gen occJobMain = occupation_job1_
gen indJobMain = industry_job1_
forvalues X = 2/5 {
    replace occJobMain = occupation_job`X'_ if Main_job == `X'
    replace indJobMain = industry_job`X'_   if Main_job == `X'
}

gen occ90_3dig = occJobMain if inrange(year,1994,2001)
gen occ00_3dig = occJobMain if inrange(year,2002,2002)
gen occ00_4dig = occJobMain if inrange(year,2004,.)
gen ind70_3dig = indJobMain if year==1994
gen ind90_3dig = indJobMain if inrange(year,1996,2001)
gen ind00_3dig = indJobMain if inrange(year,2002,2002)
gen ind00_4dig = indJobMain if inrange(year,2004,.)

lab var occ90_3dig "Occupation (3-digit), 1990 Census code"
lab var occ00_3dig "Occupation (3-digit), 2000 Census code"
lab var occ00_4dig "Occupation (4-digit), 2000 Census code"
lab var ind70_3dig "Occupation (3-digit), 1970 Census code"
lab var ind90_3dig "Occupation (3-digit), 1990 Census code"
lab var ind00_3dig "Occupation (3-digit), 2000 Census code"
lab var ind00_4dig "Occupation (4-digit), 2000 Census code"

replace wage = wage/cpi
replace wage = wage/100
winsor2 wage, cuts(1 99) by(year)
ren wage wageraw
ren wage_w wage
sum wage





*--------------------------------------------------------------------------------
* Health variables
*--------------------------------------------------------------------------------
* get extensive margin for fast food and sugary drink consumption
generat fastFoodEater = inrange(timesWeekEatFastFood,2,.)
generat sugaryDrinker = inrange(timesWeekDrinkSugary,2,.)

* ever smoke/drink/marijuana
bys id (year): egen ever_marijuana       = max(everUsedMarijuana)
bys id (year): egen ever_cigarette       = max(everSmokedCigarette)
bys id (year): egen ever_alcohol         = max(everDrunkAlcohol)


gen missInt = weight==.m

** Variables to keep:
global keeperdemog id year id_moth age birthyr height* weight* bmi overweight obese ovrwgtObese everDrunkAlcohol everSmokedCigarette everUsedMarijuana timesWeekEatFastFood timesWeekDrinkSugary timesWeekEatFruit timesWeekEatVegetables timesWeekVigorousExercise timesWeekModerateExercise timesWeekMildExercise timesWeekStrengthExercise fastFoodEater sugaryDrinker ever_marijuana ever_cigarette ever_alcohol missInt familyIncome lnFamInc m_FamilyIncome black hispanic race female hgc ged gradHS grad4yr ind??_?dig occ??_?dig wage
