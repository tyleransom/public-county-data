* Import, rename, reshape, recode and label the variables

infile using ${raw}obesity.dct, clear

****************
* Rename
****************

rename C0000100 id
rename C0000200 id_moth
rename Y2267000 version
rename C0005400 sex
rename C0005700 dob_yr

rename C0005300 race
rename Y0686700 ethAfricanAmerican1998
rename Y0686701 ethChinese1998
rename Y0686702 ethEnglish1998
rename Y0686703 ethFilipino1998
rename Y0686704 ethFrench1998
rename Y0686705 ethGerman1998
rename Y0686706 ethGreek1998
rename Y0686707 ethHawaiian1998
rename Y0686708 ethNativeAmerican1998
rename Y0686709 ethAsianIndian1998
rename Y0686710 ethIrish1998
rename Y0686711 ethItalian1998
rename Y0686712 ethJapanese1998
rename Y0686713 ethKorean1998
rename Y0686714 ethCuban1998
rename Y0686715 ethChicano1998
rename Y0686716 ethMexican1998
rename Y0686717 ethMexicanAmerican1998
rename Y0686718 ethPuertoRican1998
rename Y0686719 ethOtherLatino1998
rename Y0686720 ethOtherSpanishDescent1998
rename Y0686721 ethPolish1998
rename Y0686722 ethPortuguese1998
rename Y0686723 ethRussian1998
rename Y0686724 ethScottish1998
rename Y0686725 ethVietnamese1998
rename Y0686726 ethWelsh1998
rename Y0686727 ethOther1998
rename Y0686728 ethAmerican1998
rename Y0686729 ethNone1998
rename Y0992400 ethAfricanAmerican2000
rename Y0992401 ethChinese2000
rename Y0992402 ethEnglish2000
rename Y0992403 ethFilipino2000
rename Y0992404 ethFrench2000
rename Y0992405 ethGerman2000
rename Y0992406 ethGreek2000
rename Y0992407 ethHawaiian2000
rename Y0992408 ethNativeAmerican2000
rename Y0992409 ethAsianIndian2000
rename Y0992410 ethIrish2000
rename Y0992411 ethItalian2000
rename Y0992412 ethJapanese2000
rename Y0992413 ethKorean2000
rename Y0992414 ethCuban2000
rename Y0992415 ethChicano2000
rename Y0992416 ethMexican2000
rename Y0992417 ethMexicanAmerican2000
rename Y0992418 ethPuertoRican2000
rename Y0992419 ethOtherLatino2000
rename Y0992420 ethOtherSpanishDescent2000
rename Y0992421 ethPolish2000
rename Y0992422 ethPortuguese2000
rename Y0992423 ethRussian2000
rename Y0992424 ethScottish2000
rename Y0992425 ethVietnamese2000
rename Y0992426 ethWelsh2000
rename Y0992427 ethOther2000
rename Y0992428 ethAmerican2000
rename Y0992429 ethNone2000
rename Y1233000 ethAfricanAmerican2002
rename Y1233001 ethChinese2002
rename Y1233002 ethEnglish2002
rename Y1233003 ethFilipino2002
rename Y1233004 ethFrench2002
rename Y1233005 ethGerman2002
rename Y1233006 ethGreek2002
rename Y1233007 ethHawaiian2002
rename Y1233008 ethNativeAmerican2002
rename Y1233009 ethAsianIndian2002
rename Y1233010 ethIrish2002
rename Y1233011 ethItalian2002
rename Y1233012 ethJapanese2002
rename Y1233013 ethKorean2002
rename Y1233014 ethCuban2002
rename Y1233015 ethChicano2002
rename Y1233016 ethMexican2002
rename Y1233017 ethMexicanAmerican2002
rename Y1233018 ethPuertoRican2002
rename Y1233019 ethOtherLatino2002
rename Y1233020 ethOtherSpanishDescent2002
rename Y1233021 ethPolish2002
rename Y1233022 ethPortuguese2002
rename Y1233023 ethRussian2002
rename Y1233024 ethScottish2002
rename Y1233025 ethVietnamese2002
rename Y1233026 ethWelsh2002
rename Y1233027 ethOther2002
rename Y1233028 ethAmerican2002
rename Y1233029 ethNone2002
rename Y1462800 ethAfricanAmerican2004
rename Y1462801 ethChinese2004
rename Y1462802 ethEnglish2004
rename Y1462803 ethFilipino2004
rename Y1462804 ethFrench2004
rename Y1462805 ethGerman2004
rename Y1462806 ethGreek2004
rename Y1462807 ethHawaiian2004
rename Y1462808 ethNativeAmerican2004
rename Y1462809 ethAsianIndian2004
rename Y1462810 ethIrish2004
rename Y1462811 ethItalian2004
rename Y1462812 ethJapanese2004
rename Y1462813 ethKorean2004
rename Y1462814 ethCuban2004
rename Y1462815 ethChicano2004
rename Y1462816 ethMexican2004
rename Y1462817 ethMexicanAmerican2004
rename Y1462818 ethPuertoRican2004
rename Y1462819 ethOtherLatino2004
rename Y1462820 ethOtherSpanishDescent2004
rename Y1462821 ethPolish2004
rename Y1462822 ethPortuguese2004
rename Y1462823 ethRussian2004
rename Y1462824 ethScottish2004
rename Y1462825 ethVietnamese2004
rename Y1462826 ethWelsh2004
rename Y1462827 ethOther2004
rename Y1462828 ethAmerican2004
rename Y1462829 ethNone2004
rename Y1710000 ethAfricanAmerican2006
rename Y1710001 ethChinese2006
rename Y1710002 ethEnglish2006
rename Y1710003 ethFilipino2006
rename Y1710004 ethFrench2006
rename Y1710005 ethGerman2006
rename Y1710006 ethGreek2006
rename Y1710007 ethHawaiian2006
rename Y1710008 ethNativeAmerican2006
rename Y1710009 ethAsianIndian2006
rename Y1710010 ethIrish2006
rename Y1710011 ethItalian2006
rename Y1710012 ethJapanese2006
rename Y1710013 ethKorean2006
rename Y1710014 ethCuban2006
rename Y1710015 ethChicano2006
rename Y1710016 ethMexican2006
rename Y1710017 ethMexicanAmerican2006
rename Y1710018 ethPuertoRican2006
rename Y1710019 ethOtherLatino2006
rename Y1710020 ethOtherSpanishDescent2006
rename Y1710021 ethPolish2006
rename Y1710022 ethPortuguese2006
rename Y1710023 ethRussian2006
rename Y1710024 ethScottish2006
rename Y1710025 ethVietnamese2006
rename Y1710026 ethWelsh2006
rename Y1710027 ethOther2006
rename Y1710028 ethAmerican2006
rename Y1710029 ethNone2006
rename Y1995600 ethAfricanAmerican2008
rename Y1995601 ethChinese2008
rename Y1995602 ethEnglish2008
rename Y1995603 ethFilipino2008
rename Y1995604 ethFrench2008
rename Y1995605 ethGerman2008
rename Y1995606 ethGreek2008
rename Y1995607 ethHawaiian2008
rename Y1995608 ethNativeAmerican2008
rename Y1995609 ethAsianIndian2008
rename Y1995610 ethIrish2008
rename Y1995611 ethItalian2008
rename Y1995612 ethJapanese2008
rename Y1995613 ethKorean2008
rename Y1995614 ethCuban2008
rename Y1995615 ethChicano2008
rename Y1995616 ethMexican2008
rename Y1995617 ethMexicanAmerican2008
rename Y1995618 ethPuertoRican2008
rename Y1995619 ethOtherLatino2008
rename Y1995620 ethOtherSpanishDescent2008
rename Y1995621 ethPolish2008
rename Y1995622 ethPortuguese2008
rename Y1995623 ethRussian2008
rename Y1995624 ethScottish2008
rename Y1995625 ethVietnamese2008
rename Y1995626 ethWelsh2008
rename Y1995627 ethOther2008
rename Y1995628 ethAmerican2008
rename Y1995629 ethNone2008
rename Y2314400 ethAfricanAmerican2010
rename Y2314401 ethChinese2010
rename Y2314402 ethEnglish2010
rename Y2314403 ethFilipino2010
rename Y2314404 ethFrench2010
rename Y2314405 ethGerman2010
rename Y2314406 ethGreek2010
rename Y2314407 ethHawaiian2010
rename Y2314408 ethNativeAmerican2010
rename Y2314409 ethAsianIndian2010
rename Y2314410 ethIrish2010
rename Y2314411 ethItalian2010
rename Y2314412 ethJapanese2010
rename Y2314413 ethKorean2010
rename Y2314414 ethCuban2010
rename Y2314415 ethChicano2010
rename Y2314416 ethMexican2010
rename Y2314417 ethMexicanAmerican2010
rename Y2314418 ethPuertoRican2010
rename Y2314419 ethOtherLatino2010
rename Y2314420 ethOtherSpanishDescent2010
rename Y2314421 ethPolish2010
rename Y2314422 ethPortuguese2010
rename Y2314423 ethRussian2010
rename Y2314424 ethScottish2010
rename Y2314425 ethVietnamese2010
rename Y2314426 ethWelsh2010
rename Y2314427 ethOther2010
rename Y2314428 ethAmerican2010
rename Y2314429 ethNone2010
rename Y2647100 ethAfricanAmerican2012
rename Y2647101 ethChinese2012
rename Y2647102 ethEnglish2012
rename Y2647103 ethFilipino2012
rename Y2647104 ethFrench2012
rename Y2647105 ethGerman2012
rename Y2647106 ethGreek2012
rename Y2647107 ethHawaiian2012
rename Y2647108 ethNativeAmerican2012
rename Y2647109 ethAsianIndian2012
rename Y2647110 ethIrish2012
rename Y2647111 ethItalian2012
rename Y2647112 ethJapanese2012
rename Y2647113 ethKorean2012
rename Y2647114 ethCuban2012
rename Y2647115 ethChicano2012
rename Y2647116 ethMexican2012
rename Y2647117 ethMexicanAmerican2012
rename Y2647118 ethPuertoRican2012
rename Y2647119 ethOtherLatino2012
rename Y2647120 ethOtherSpanishDescent2012
rename Y2647121 ethPolish2012
rename Y2647122 ethPortuguese2012
rename Y2647123 ethRussian2012
rename Y2647124 ethScottish2012
rename Y2647125 ethVietnamese2012
rename Y2647126 ethWelsh2012
rename Y2647127 ethOther2012
rename Y2647128 ethAmerican2012
rename Y2647129 ethNone2012
rename Y3004300 ethAfricanAmerican2014
rename Y3004301 ethChinese2014
rename Y3004302 ethEnglish2014
rename Y3004303 ethFilipino2014
rename Y3004304 ethFrench2014
rename Y3004305 ethGerman2014
rename Y3004306 ethGreek2014
rename Y3004307 ethHawaiian2014
rename Y3004308 ethNativeAmerican2014
rename Y3004309 ethAsianIndian2014
rename Y3004310 ethIrish2014
rename Y3004311 ethItalian2014
rename Y3004312 ethJapanese2014
rename Y3004313 ethKorean2014
rename Y3004314 ethCuban2014
rename Y3004315 ethChicano2014
rename Y3004316 ethMexican2014
rename Y3004317 ethMexicanAmerican2014
rename Y3004318 ethPuertoRican2014
rename Y3004319 ethOtherLatino2014
rename Y3004320 ethOtherSpanishDescent2014
rename Y3004321 ethPolish2014
rename Y3004322 ethPortuguese2014
rename Y3004323 ethRussian2014
rename Y3004324 ethScottish2014
rename Y3004325 ethVietnamese2014
rename Y3004326 ethWelsh2014
rename Y3004327 ethOther2014
rename Y3004328 ethAmerican2014
rename Y3004329 ethNone2014
rename Y3373100 ethAfricanAmerican2016
rename Y3373101 ethChinese2016
rename Y3373102 ethEnglish2016
rename Y3373103 ethFilipino2016
rename Y3373104 ethFrench2016
rename Y3373105 ethGerman2016
rename Y3373106 ethGreek2016
rename Y3373107 ethHawaiian2016
rename Y3373108 ethNativeAmerican2016
rename Y3373109 ethAsianIndian2016
rename Y3373110 ethIrish2016
rename Y3373111 ethItalian2016
rename Y3373112 ethJapanese2016
rename Y3373113 ethKorean2016
rename Y3373114 ethCuban2016
rename Y3373115 ethChicano2016
rename Y3373116 ethMexican2016
rename Y3373117 ethMexicanAmerican2016
rename Y3373118 ethPuertoRican2016
rename Y3373119 ethOtherLatino2016
rename Y3373120 ethOtherSpanishDescent2016
rename Y3373121 ethPolish2016
rename Y3373122 ethPortuguese2016
rename Y3373123 ethRussian2016
rename Y3373124 ethScottish2016
rename Y3373125 ethVietnamese2016
rename Y3373126 ethWelsh2016
rename Y3373127 ethOther2016
rename Y3373128 ethAmerican2016
rename Y3373129 ethNone2016
rename Y4014200 ethAfricanAmerican2018
rename Y4014201 ethChinese2018
rename Y4014202 ethEnglish2018
rename Y4014203 ethFilipino2018
rename Y4014204 ethFrench2018
rename Y4014205 ethGerman2018
rename Y4014206 ethGreek2018
rename Y4014207 ethHawaiian2018
rename Y4014208 ethNativeAmerican2018
rename Y4014209 ethAsianIndian2018
rename Y4014210 ethIrish2018
rename Y4014211 ethItalian2018
rename Y4014212 ethJapanese2018
rename Y4014213 ethKorean2018
rename Y4014214 ethCuban2018
rename Y4014215 ethChicano2018
rename Y4014216 ethMexican2018
rename Y4014217 ethMexicanAmerican2018
rename Y4014218 ethPuertoRican2018
rename Y4014219 ethOtherLatino2018
rename Y4014220 ethOtherSpanishDescent2018
rename Y4014221 ethPolish2018
rename Y4014222 ethPortuguese2018
rename Y4014223 ethRussian2018
rename Y4014224 ethScottish2018
rename Y4014225 ethVietnamese2018
rename Y4014226 ethWelsh2018
rename Y4014227 ethOther2018
rename Y4014228 ethAmerican2018
rename Y4014229 ethNone2018

rename Y0308500 weight1994
rename Y0609800 weight1996
rename Y0904100 weight1998
rename Y1151000 weight2000
rename Y1386000 weight2002
rename Y1637700 weight2004
rename Y1891300 weight2006
rename Y2207200 weight2008
rename Y2544900 weight2010
rename Y2893000 weight2012
rename Y3259100 weight2014
rename Y3599100 weight2016
rename Y4216700 weight2018

rename Y0308300 heightFeet1994
rename Y0308400 heightInches1994
rename Y0609600 heightFeet1996
rename Y0609700 heightInches1996
rename Y0903900 heightFeet1998
rename Y0904000 heightInches1998
rename Y1150800 heightFeet2000
rename Y1150900 heightInches2000
rename Y1385800 heightFeet2002
rename Y1385900 heightInches2002
rename Y1637500 heightFeet2004
rename Y1637600 heightInches2004
rename Y1891100 heightFeet2006
rename Y1891200 heightInches2006
rename Y2207000 heightFeet2008
rename Y2207100 heightInches2008
rename Y2544700 heightFeet2010
rename Y2544800 heightInches2010
rename Y2892800 heightFeet2012
rename Y2892900 heightInches2012
rename Y3258900 heightFeet2014
rename Y3259000 heightInches2014
rename Y3598900 heightFeet2016
rename Y3599000 heightInches2016
rename Y4216500 heightFeet2018
rename Y4216600 heightInches2018

rename Y0037600 highestGradeCompleted1994
rename Y0420000 highestGradeCompleted1996
rename Y0709900 highestGradeCompleted1998
rename Y1015600 highestGradeCompleted2000
rename Y1258000 highestGradeCompleted2002
rename Y1491700 highestGradeCompleted2004
rename Y1741500 highestGradeCompleted2006
rename Y2022300 highestGradeCompleted2008
rename Y2347400 highestGradeCompleted2010
rename Y2676900 highestGradeCompleted2012

rename Y1212100 highestDegreeReceivedDLI
rename Y2966700 highestDegreeReceived2012
rename Y3332200 highestDegreeReceived2014
rename Y3676000 highestDegreeReceived2016
rename Y4282000 highestDegreeReceived2018

rename Y1158600 familyIncome2000
rename Y1393700 familyIncome2002
rename Y1645300 familyIncome2004
rename Y1917000 familyIncome2006
rename Y2232300 familyIncome2008
rename Y2582100 familyIncome2010
rename Y2929800 familyIncome2012
rename Y3299800 familyIncome2014

rename C0732800 everDrunkAlcohol1988
rename C0944500 everDrunkAlcohol1990
rename C1139900 everDrunkAlcohol1992
rename C1369700 everDrunkAlcohol1994
rename C1592000 everDrunkAlcohol1996
rename C1932700 everDrunkAlcohol1998
rename C2471900 everDrunkAlcohol2000
rename C2769700 everDrunkAlcohol2002
rename C3049600 everDrunkAlcohol2004
rename C3369900 everDrunkAlcohol2006
rename C3873600 everDrunkAlcohol2008
rename C5121800 everDrunkAlcohol2010
rename C5699300 everDrunkAlcohol2012
rename C5971200 everDrunkAlcohol2014

rename C0732500 everSmokedCigarette1988
rename C0944200 everSmokedCigarette1990
rename C1139600 everSmokedCigarette1992
rename C1369200 everSmokedCigarette1994
rename C1591500 everSmokedCigarette1996
rename C1932100 everSmokedCigarette1998
rename C2471300 everSmokedCigarette2000
rename C2769100 everSmokedCigarette2002
rename C3049000 everSmokedCigarette2004
rename C3369300 everSmokedCigarette2006
rename C3873000 everSmokedCigarette2008
rename C5121200 everSmokedCigarette2010
rename C5698700 everSmokedCigarette2012
rename C5970600 everSmokedCigarette2014
replace everSmokedCigarette1996 = 1 if inrange(everSmokedCigarette1996,1,.)

rename C0733100 everUsedMarijuana1988
rename C0944800 everUsedMarijuana1990
rename C1140200 everUsedMarijuana1992
rename C1370200 everUsedMarijuana1994
rename C1592500 everUsedMarijuana1996
rename C1933200 everUsedMarijuana1998
rename C2472400 everUsedMarijuana2000
rename C2770400 everUsedMarijuana2002
rename C3050300 everUsedMarijuana2004
rename C3370600 everUsedMarijuana2006
rename C3874300 everUsedMarijuana2008
rename C5122500 everUsedMarijuana2010
rename C5700000 everUsedMarijuana2012
rename C5971900 everUsedMarijuana2014
replace everUsedMarijuana1996 = 1 if inrange(everUsedMarijuana1996,1,.)

rename Y2537100 timesWeekEatFastFood2010
rename Y2885200 timesWeekEatFastFood2012
rename Y3254500 timesWeekEatFastFood2014
rename Y3594902 timesWeekEatFastFood2016
rename Y4215002 timesWeekEatFastFood2018

rename Y2537300 timesWeekDrinkSugary2010
rename Y2885400 timesWeekDrinkSugary2012
rename Y3254700 timesWeekDrinkSugary2014
rename Y3594904 timesWeekDrinkSugary2016
rename Y4215004 timesWeekDrinkSugary2018

rename Y1632700 timesWeekEatFruit2004
rename Y1886800 timesWeekEatFruit2006
rename Y2200900 timesWeekEatFruit2008
rename Y2536000 timesWeekEatFruit2010
rename Y2884100 timesWeekEatFruit2012
rename Y3254300 timesWeekEatFruit2014
rename Y3594900 timesWeekEatFruit2016
rename Y4215000 timesWeekEatFruit2018

rename Y1632800 timesWeekEatVegetables2004
rename Y1886900 timesWeekEatVegetables2006
rename Y2201000 timesWeekEatVegetables2008
rename Y2536100 timesWeekEatVegetables2010
rename Y2884200 timesWeekEatVegetables2012
rename Y3254400 timesWeekEatVegetables2014
rename Y3594901 timesWeekEatVegetables2016
rename Y4215001 timesWeekEatVegetables2018

rename Y2201100 timesWeekVigorousExercise2008
rename Y2201200 timesWeekModerateExercise2008
rename Y2201300 timesWeekMildExercise2008
rename Y2536200 timesWeekVigorousExercise2010
rename Y2536300 timesWeekModerateExercise2010
rename Y2536400 timesWeekMildExercise2010
rename Y2536500 timesWeekStrengthExercise2010
rename Y2884300 timesWeekVigorousExercise2012
rename Y2884400 timesWeekModerateExercise2012
rename Y2884500 timesWeekMildExercise2012
rename Y2884600 timesWeekStrengthExercise2012
rename Y3255100 timesWeekVigorousExercise2014
rename Y3255200 timesWeekModerateExercise2014
rename Y3255300 timesWeekMildExercise2014
rename Y3255400 timesWeekStrengthExercise2014
rename Y3595300 timesWeekVigorousExercise2016
rename Y3595301 timesWeekModerateExercise2016
rename Y3595302 timesWeekMildExercise2016
rename Y3595303 timesWeekStrengthExercise2016
rename Y4215100 timesWeekVigorousExercise2018
rename Y4215101 timesWeekModerateExercise2018
rename Y4215102 timesWeekMildExercise2018
rename Y4215103 timesWeekStrengthExercise2018



rename Y1294500 occupation_job1_2002
rename Y1528300 occupation_job1_2004
rename Y1779000 occupation_job1_2006
rename Y2063100 occupation_job1_2008
rename Y2395200 occupation_job1_2010
rename Y2725700 occupation_job1_2012
rename Y3079400 occupation_job1_2014
rename Y3444200 occupation_job1_2016
rename Y4081900 occupation_job1_2018
rename Y1294600 occupation_job2_2002
rename Y1528400 occupation_job2_2004
rename Y1779100 occupation_job2_2006
rename Y2063200 occupation_job2_2008
rename Y2395300 occupation_job2_2010
rename Y2725800 occupation_job2_2012
rename Y3079500 occupation_job2_2014
rename Y3444300 occupation_job2_2016
rename Y4082000 occupation_job2_2018
rename Y1294700 occupation_job3_2002
rename Y1528500 occupation_job3_2004
rename Y1779200 occupation_job3_2006
rename Y2063300 occupation_job3_2008
rename Y2395400 occupation_job3_2010
rename Y2725900 occupation_job3_2012
rename Y3079600 occupation_job3_2014
rename Y3444400 occupation_job3_2016
rename Y4082100 occupation_job3_2018
rename Y1294800 occupation_job4_2002
rename Y1528600 occupation_job4_2004
rename Y1779300 occupation_job4_2006
rename Y2063400 occupation_job4_2008
rename Y2395500 occupation_job4_2010
rename Y2726000 occupation_job4_2012
rename Y3079700 occupation_job4_2014
rename Y3444500 occupation_job4_2016
rename Y4082200 occupation_job4_2018
rename Y1294900 occupation_job5_2002
rename Y1528700 occupation_job5_2004
rename Y1779400 occupation_job5_2006
rename Y2063500 occupation_job5_2008
rename Y2395600 occupation_job5_2010
rename Y2726100 occupation_job5_2012
rename Y3079800 occupation_job5_2014
rename Y3444600 occupation_job5_2016
rename Y4082300 occupation_job5_2018
rename Y0115301 occupation_job2_1994
rename Y0490601 occupation_job2_1996
rename Y0773901 occupation_job2_1998
rename Y0133101 occupation_job3_1994
rename Y0507601 occupation_job3_1996
rename Y0773902 occupation_job3_1998
rename Y0148801 occupation_job4_1994
rename Y0522401 occupation_job4_1996
rename Y0773903 occupation_job4_1998
rename Y0161001 occupation_job5_1994
rename Y0534501 occupation_job5_1996
rename Y0773904 occupation_job5_1998
rename Y1050900 occupation_job1_2000
rename Y1051000 occupation_job2_2000
rename Y1051100 occupation_job3_2000
rename Y1051200 occupation_job4_2000
rename Y1051300 occupation_job5_2000
rename Y1051400 occupation_job6_2000
rename Y1051500 occupation_job7_2000

rename Y0091300 industry_job1_1994
rename Y0115302 industry_job2_1994
rename Y0133102 industry_job3_1994
rename Y0148802 industry_job4_1994
rename Y0161002 industry_job5_1994
rename Y0467900 industry_job1_1996
rename Y0490602 industry_job2_1996
rename Y0507602 industry_job3_1996
rename Y0522402 industry_job4_1996
rename Y0534200 industry_job5_1996
rename Y0772400 industry_job1_1998
rename Y0772500 industry_job2_1998
rename Y0772600 industry_job3_1998
rename Y0772700 industry_job4_1998
rename Y0772800 industry_job5_1998
rename Y1051600 industry_job1_2000
rename Y1051700 industry_job2_2000
rename Y1051800 industry_job3_2000
rename Y1051900 industry_job4_2000
rename Y1052000 industry_job5_2000
rename Y1052100 industry_job6_2000
rename Y1052200 industry_job7_2000
rename Y1295000 industry_job1_2002
rename Y1295100 industry_job2_2002
rename Y1295200 industry_job3_2002
rename Y1295300 industry_job4_2002
rename Y1295400 industry_job5_2002
rename Y1528800 industry_job1_2004
rename Y1528900 industry_job2_2004
rename Y1529000 industry_job3_2004
rename Y1529100 industry_job4_2004
rename Y1529200 industry_job5_2004
rename Y1779500 industry_job1_2006
rename Y1779600 industry_job2_2006
rename Y1779700 industry_job3_2006
rename Y1779800 industry_job4_2006
rename Y1779900 industry_job5_2006
rename Y2063600 industry_job1_2008
rename Y2063700 industry_job2_2008
rename Y2063800 industry_job3_2008
rename Y2063900 industry_job4_2008
rename Y2064000 industry_job5_2008
rename Y2395700 industry_job1_2010
rename Y2395800 industry_job2_2010
rename Y2395900 industry_job3_2010
rename Y2396000 industry_job4_2010
rename Y2396100 industry_job5_2010
rename Y2726200 industry_job1_2012
rename Y2726300 industry_job2_2012
rename Y2726400 industry_job3_2012
rename Y2726500 industry_job4_2012
rename Y2726600 industry_job5_2012
rename Y3079900 industry_job1_2014
rename Y3080000 industry_job2_2014
rename Y3080100 industry_job3_2014
rename Y3080200 industry_job4_2014
rename Y3080300 industry_job5_2014
rename Y3444700 industry_job1_2016
rename Y3444800 industry_job2_2016
rename Y3444900 industry_job3_2016
rename Y3445000 industry_job4_2016
rename Y3445100 industry_job5_2016
rename Y4082400 industry_job1_2018
rename Y4082500 industry_job2_2018
rename Y4082600 industry_job3_2018
rename Y4082700 industry_job4_2018
rename Y4082800 industry_job5_2018

rename Y0094500 Hrly_pay_job1_1994
rename Y0117900 Hrly_pay_job2_1994
rename Y0135100 Hrly_pay_job3_1994
rename Y0150700 Hrly_pay_job4_1994
rename Y0162600 Hrly_pay_job5_1994
rename Y0470800 Hrly_pay_job1_1996
rename Y0493000 Hrly_pay_job2_1996
rename Y0509500 Hrly_pay_job3_1996
rename Y0524100 Hrly_pay_job4_1996
rename Y0535600 Hrly_pay_job5_1996
rename Y0792000 Hrly_pay_job1_1998
rename Y0792100 Hrly_pay_job2_1998
rename Y0792200 Hrly_pay_job3_1998
rename Y0792300 Hrly_pay_job4_1998
rename Y0792400 Hrly_pay_job5_1998
rename Y1058300 Hrly_pay_job1_2000
rename Y1058400 Hrly_pay_job2_2000
rename Y1058500 Hrly_pay_job3_2000
rename Y1058600 Hrly_pay_job4_2000
rename Y1058700 Hrly_pay_job5_2000
rename Y1058800 Hrly_pay_job6_2000
rename Y1058900 Hrly_pay_job7_2000
rename Y1299900 Hrly_pay_job1_2002
rename Y1300000 Hrly_pay_job2_2002
rename Y1300100 Hrly_pay_job3_2002
rename Y1300200 Hrly_pay_job4_2002
rename Y1300300 Hrly_pay_job5_2002
rename Y1533800 Hrly_pay_job1_2004
rename Y1533900 Hrly_pay_job2_2004
rename Y1534000 Hrly_pay_job3_2004
rename Y1534100 Hrly_pay_job4_2004
rename Y1534200 Hrly_pay_job5_2004
rename Y1784500 Hrly_pay_job1_2006
rename Y1784600 Hrly_pay_job2_2006
rename Y1784700 Hrly_pay_job3_2006
rename Y1784800 Hrly_pay_job4_2006
rename Y1784900 Hrly_pay_job5_2006
rename Y2069000 Hrly_pay_job1_2008
rename Y2069100 Hrly_pay_job2_2008
rename Y2069200 Hrly_pay_job3_2008
rename Y2069300 Hrly_pay_job4_2008
rename Y2069400 Hrly_pay_job5_2008
rename Y2401200 Hrly_pay_job1_2010
rename Y2401300 Hrly_pay_job2_2010
rename Y2401400 Hrly_pay_job3_2010
rename Y2401500 Hrly_pay_job4_2010
rename Y2401600 Hrly_pay_job5_2010
rename Y2731700 Hrly_pay_job1_2012
rename Y2731800 Hrly_pay_job2_2012
rename Y2731900 Hrly_pay_job3_2012
rename Y2732000 Hrly_pay_job4_2012
rename Y2732100 Hrly_pay_job5_2012
rename Y3093500 Hrly_pay_job1_2014
rename Y3093600 Hrly_pay_job2_2014
rename Y3093700 Hrly_pay_job3_2014
rename Y3093800 Hrly_pay_job4_2014
rename Y3093900 Hrly_pay_job5_2014


***************************************************
* Reshape and recode certain variables.
***************************************************
* consolidate "height (in feet)" and "height (in inches)" into one variable:
forvalues y=1994(2)2018 {
    if `y'<2014 {
        gen height`y' = heightFeet`y'*12+heightInches`y' if heightFeet`y'>0
        drop heightFeet`y' heightInches`y'
    } 
    else {
        gen height`y' = heightFeet`y'*12+(heightInches`y'/100) if heightFeet`y'>0
        drop heightFeet`y' heightInches`y'
    }
}

forvalues yr=1988(2)2018 {
    gen temp`yr'=0
}

reshape long temp highestGradeCompleted highestDegreeReceived familyIncome height weight ethAfricanAmerican ethAmerican ethAsianIndian ethChicano ethChinese ethCuban ethEnglish ethFilipino ethFrench ethGerman ethGreek ethHawaiian ethIrish ethItalian ethJapanese ethKorean ethMexican ethMexicanAmerican ethNativeAmerican ethNone ethOther ethOtherLatino ethOtherSpanishDescent ethPolish ethPortuguese ethPuertoRican ethRussian ethScottish ethVietnamese ethWelsh everDrunkAlcohol everSmokedCigarette everUsedMarijuana timesWeekEatFastFood timesWeekDrinkSugary timesWeekEatFruit timesWeekEatVegetables timesWeekVigorousExercise timesWeekModerateExercise timesWeekMildExercise timesWeekStrengthExercise industry_job1_ industry_job2_ industry_job3_ industry_job4_ industry_job5_ industry_job6_ industry_job7_ occupation_job1_ occupation_job2_ occupation_job3_ occupation_job4_ occupation_job5_ occupation_job6_ occupation_job7_ Hrly_pay_job1_ Hrly_pay_job2_ Hrly_pay_job3_ Hrly_pay_job4_ Hrly_pay_job5_ Hrly_pay_job6_ Hrly_pay_job7_, i(id) j(year)

// Cases with a value of -7 were not in scope (child was not in mother's household or not age-eligible), or no mother main youth interview was completed.
recode _all (-1 = .r) (-2 = .d) (-3 = .i) (-4 = .v) (-5 = .n) (-7 = .m)

***************************************************
* Label variables and values
***************************************************

label var id                        "ID"
label var id_moth                   "ID OF MOTHER"
label var year                      "YEAR"
label var sex                       "SEX"
label var dob_yr                    "DATE OF BIRTH - YR"
label var highestDegreeReceived     "HIGHEST DEGREE RECEIVED"
label var highestGradeCompleted     "HIGHEST GRADE COMPLETED"
label var highestDegreeReceivedDLI  "HIGHEST DEGREE RECEIVED AT DATE OF LAST INTERVIEW"
label var race                      "RACE-ETHNICITY"
label var height                    "HEIGHT OF R (IN INCHES)"
label var weight                    "WEIGHT OF R (IN LBS)"
label var everDrunkAlcohol          "CHILD SELF-ADMINISTERED: HAVE YOU EVER DRUNK ALCOHOL"
label var everSmokedCigarette       "CHILD SELF-ADMINISTERED: HAVE YOU EVER SMOKED A CIGARETTE"
label var everUsedMarijuana         "CHILD SELF-ADMINISTERED: HAVE YOU EVER USED MARIJUANA"
label var timesWeekEatFastFood      "HOW MANY TIMES IN A TYPICAL WEEK R EATS FOOD FROM A FAST FOOD RESTAURANT"
label var timesWeekDrinkSugary      "HOW MANY TIMES IN A TYPICAL WEEK R DRINKS A SOFT DRINK OR SODA THAT CONTAINED SUGAR"
label var timesWeekEatFruit         "HOW MANY TIMES IN A TYPICAL WEEK R EATS FRUIT"
label var timesWeekEatVegetables    "HOW MANY TIMES IN A TYPICAL WEEK R EATS VEGETABLES"
label var timesWeekVigorousExercise "HOW MANY TIMES ON AVERAGE IN A TYPICAL WEEK R DOES STRENUOUS EXERCISE"
label var timesWeekModerateExercise "HOW MANY TIMES ON AVERAGE IN A TYPICAL WEEK R DOES MODERATE EXERCISE"
label var timesWeekMildExercise     "HOW MANY TIMES ON AVERAGE IN A TYPICAL WEEK R DOES MILD EXERCISE"
label var timesWeekStrengthExercise "HOW MANY TIMES ON AVERAGE IN A TYPICAL WEEK R DOES STRENGTH TRAINING"

* label define vl_grade   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YR COL"  14 "2ND YR COL"  15 "3RD YR COL"  16 "4TH YR COL"  17 "5TH YR COL"  18 "6TH YR COL"  19 "7TH YR COL"  20 "8TH YR COL OR MORE"  95 "UNGRADED" // prev defined
label values highestGradeCompleted vl_grade

* Bring together degree data
label define vl_degree_long  0 "NO DEGREE" 1 "GED" 2 "HIGH SCHOOL DIPLOMA"  3 "ASSOCIATE'S DEGREE"  4 "BACHELOR OF ARTS"  5 "BACHELOR OF SCIENCE"  6 "MASTER'S DEGREE"  7 "PHD"  8 "PROFESSIONAL DEGREE (MD,LLD,DDS)"
label values highestDegreeReceived    vl_degree_long
label values highestDegreeReceivedDLI vl_degree_long

label define vl_race   1 "HISPANIC"  2 "BLACK"  3 "NON-BLACK, NON-HISPANIC"
label values race vl_race

label define vl_sex   1 "MALE"  2 "FEMALE"
label values sex vl_sex

label define vl_diet 1 "0 TIMES PER WEEK" 2 "1 TO 3 TIMES PER WEEK" 3 "4 TO 6 TIMES PER WEEK" 4 "1 TIME PER DAY" 5 "2 TIMES PER DAY" 6 "3 TIMES PER DAY" 7 "4 OR MORE TIMES PER DAY"
label values timesWeekEatFastFood   vl_diet
label values timesWeekDrinkSugary   vl_diet
label values timesWeekEatFruit      vl_diet
label values timesWeekEatVegetables vl_diet

* fix measurement difference in times week eating fast food between 2012 and 2014
clonevar timesWeekEatFastFoodA = timesWeekEatFastFood
replace timesWeekEatFastFoodA = 7 if inrange(timesWeekEatFastFood,25,.)  & inrange(year,2010,2012)
replace timesWeekEatFastFoodA = 6 if inrange(timesWeekEatFastFood,18,24) & inrange(year,2010,2012)
replace timesWeekEatFastFoodA = 5 if inrange(timesWeekEatFastFood,11,17) & inrange(year,2010,2012)
replace timesWeekEatFastFoodA = 4 if inrange(timesWeekEatFastFood,7,10)  & inrange(year,2010,2012)
replace timesWeekEatFastFoodA = 3 if inrange(timesWeekEatFastFood,4,6)   & inrange(year,2010,2012)
replace timesWeekEatFastFoodA = 2 if inrange(timesWeekEatFastFood,1,3)   & inrange(year,2010,2012)
replace timesWeekEatFastFoodA = 1 if inrange(timesWeekEatFastFood,0,0)   & inrange(year,2010,2012)
replace timesWeekEatFastFood = timesWeekEatFastFoodA if inrange(year,2010,2012)


label define vl_exer 1 "0 TIMES PER WEEK" 2 "1 TIME PER WEEK" 3 "2 or 3 TIMES PER WEEK" 4 "4 or 5 TIMES PER WEEK" 5 "6 or MORE TIMES PER WEEK"
label values timesWeekVigorousExercise vl_exer
label values timesWeekModerateExercise vl_exer
label values timesWeekMildExercise     vl_exer
label values timesWeekStrengthExercise vl_exer

order id year id_moth dob* race sex height weight