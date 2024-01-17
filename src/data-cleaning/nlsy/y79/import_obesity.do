* Import, rename, reshape, recode and label the variables

infile using ${raw}obesity.dct, clear

****************
* Rename
****************

rename R0000100 id
rename R0018300 diploma_or_ged1979
rename R0216701 high_grade_comp_May1979
rename R0230000 diploma_or_ged1980
rename R0406401 high_grade_comp_May1980
rename R0418200 diploma_or_ged1981
rename R0618901 high_grade_comp_May1981
rename R0665300 diploma_or_ged1982
rename R0898201 high_grade_comp_May1982
rename R0906700 diploma_or_ged1983
rename R1145001 high_grade_comp_May1983
rename R1206600 diploma_or_ged1984
rename R1520201 high_grade_comp_May1984
rename R1605900 diploma_or_ged1985
rename R1890901 high_grade_comp_May1985
rename R1906100 diploma_or_ged1986
rename R2258001 high_grade_comp_May1986
rename R2307000 diploma_or_ged1987
rename R2445401 high_grade_comp_May1987
rename R2509500 diploma_or_ged1988
rename R2871101 high_grade_comp_May1988
rename R2908600 diploma_or_ged1989
rename R3074801 high_grade_comp_May1989
rename R3110700 diploma_or_ged1990
rename R3401501 high_grade_comp_May1990
rename R3510700 diploma_or_ged1991
rename R3656901 high_grade_comp_May1991
rename R3710700 diploma_or_ged1992
rename R4007401 high_grade_comp_May1992
rename R4138500 diploma_or_ged1993
rename R4418501 high_grade_comp_May1993
rename R4527100 diploma_or_ged1994
rename R5103900 high_grade_comp_May1994
rename R5166901 high_grade_comp_May1996
rename R5222400 diploma_or_ged1996
rename R5822300 diploma_or_ged1998
rename R6479600 high_grade_comp_May1998
rename R6540900 diploma_or_ged2000
rename R7007300 high_grade_comp_May2000
rename R7104100 diploma_or_ged2002
rename R7704600 high_grade_comp_May2002
rename R7811000 diploma_or_ged2004
rename R8497000 high_grade_comp_May2004
rename T0014900 diploma_or_ged2006
rename T0988800 high_grade_comp_May2006
rename T1214900 diploma_or_ged2008
rename T2210700 high_grade_comp_May2008
rename T2273400 diploma_or_ged2010
rename T3108600 high_grade_comp_May2010
rename T3213500 diploma_or_ged2012
rename T4113000 high_grade_comp_May2012
rename R2509800 high_deg_recd1988
rename R2909200 high_deg_recd1989
rename R3111200 high_deg_recd1990
rename R3511200 high_deg_recd1991
rename R3711200 high_deg_recd1992
rename R4138900 high_deg_recd1993
rename R4527600 high_deg_recd1994
rename R5222900 high_deg_recd1996
rename R5822800 high_deg_recd1998
rename R6541400 high_deg_recd2000
rename R7104600 high_deg_recd2002
rename R7811500 high_deg_recd2004
rename T0015400 high_deg_recd2006
rename T1215400 high_deg_recd2008
rename T2273900 high_deg_recd2010 
rename T3214000 high_deg_recd2012
rename T4202200 high_deg_recd2014
rename T5177200 high_deg_recd2016
rename T7745000 high_deg_recd2018
rename R0217900 netFamilyIncome1979
rename R0406010 netFamilyIncome1980
rename R0618410 netFamilyIncome1981
rename R0898600 netFamilyIncome1982
rename R1144500 netFamilyIncome1983
rename R1519700 netFamilyIncome1984
rename R1890400 netFamilyIncome1985
rename R2257500 netFamilyIncome1986
rename R2444700 netFamilyIncome1987
rename R2870200 netFamilyIncome1988
rename R3074000 netFamilyIncome1989
rename R3400700 netFamilyIncome1990
rename R3656100 netFamilyIncome1991
rename R4006600 netFamilyIncome1992
rename R4417700 netFamilyIncome1993
rename R5080700 netFamilyIncome1994
rename R5166000 netFamilyIncome1996
rename R6478700 netFamilyIncome1998
rename R7006500 netFamilyIncome2000
rename R7703700 netFamilyIncome2002
rename R8496100 netFamilyIncome2004
rename T0987800 netFamilyIncome2006
rename T2210000 netFamilyIncome2008
rename T3107800 netFamilyIncome2010
rename T4112300 netFamilyIncome2012
rename T5022600 netFamilyIncome2014
rename T5770800 netFamilyIncome2016
rename T8218700 netFamilyIncome2018
rename R0000300 dob_mo1979
rename R0000500 dob_yr1979
rename R0000700 country_born             // COUNTRY OF BIRTH
rename R0001800 urbanicity_14            // AREA OF RESIDENCE AT AGE 14 URBAN/RURAL?
rename R0001900 live_with_14
rename R0006500 hgcMoth
rename R0007900 hgcFath
rename R0009600 ethnicity1
rename R0009700 ethnicity2
rename R0009800 ethnicity3
rename R0009900 ethnicity4
rename R0010000 ethnicity5
rename R0010100 ethnicity6
rename R0010200 ethnicityMostClose
rename R0153000 rotter_1a
rename R0153100 rotter_1b
rename R0153200 rotter_2a
rename R0153300 rotter_2b
rename R0153400 rotter_3a
rename R0153500 rotter_3b
rename R0153600 rotter_4a
rename R0153700 rotter_4b
rename R0153710 rotter_score
rename R0172500 interview_mo1979
rename R0173600 sample_id
rename R0214700 race_screen
rename R0214800 sex
rename R0216100 svywgt1979
rename R0216400 region1979
rename R0216500 age1979
rename R0217501 marst1979
rename R0217502 family_size1979
rename R0329200 interview_mo1980
rename R0405200 svywgt1980
rename R0405601 marst1980
rename R0405700 region1980
rename R0406310 reason_noninterview1980
rename R0406510 age1980
rename R0481600 height1981
rename R0481700 weight1981
rename R0530700 interview_mo1981
rename R0602810 region1981
rename R0614600 svywgt1981
rename R0618200 afqt1980
rename R0618300 afqt1989
rename R0618301 afqt2006
rename R0618601 marst1981
rename R0618810 reason_noninterview1981
rename R0619010 age1981
rename R0779800 height1982
rename R0779900 weight1982
rename R0809900 interview_mo1982
rename R0896700 svywgt1982
rename R0897910 region1982
rename R0898310 age1982
rename R0898401 marst1982
rename R0898510 reason_noninterview1982
rename R0901000 yearEnteredUS
rename R1045700 interview_mo1983
rename R1144400 svywgt1983
rename R1144710 reason_noninterview1983
rename R1144800 region1983
rename R1144901 marst1983
rename R1145110 age1983
rename R1427500 interview_mo1984
rename R1519600 svywgt1984
rename R1519910 reason_noninterview1984
rename R1520000 region1984
rename R1520101 marst1984
rename R1520310 age1984
rename R1773900 height1985
rename R1774000 weight1985
rename R1794600 interview_mo1985
rename R1890200 svywgt1985
rename R1890300 reason_noninterview1985
rename R1890700 region1985
rename R1890801 marst1985
rename R1891010 age1985
rename R2141300 weight1986
rename R2156200 interview_mo1986
rename R2257300 svywgt1986
rename R2257400 reason_noninterview1986
rename R2257800 region1986
rename R2257901 marst1986
rename R2258110 age1986
rename R2365700 interview_mo1987
rename R2444500 svywgt1987
rename R2444600 reason_noninterview1987
rename R2445200 region1987
rename R2445301 marst1987
rename R2445510 age1987
rename R2711500 weight1988
rename R2742500 interview_mo1988
rename R2870000 svywgt1988
rename R2870100 reason_noninterview1988
rename R2870800 region1988
rename R2871000 marst1988
rename R2871300 age1988
rename R2959600 weight1989
rename R2986100 interview_mo1989
rename R3073800 svywgt1989
rename R3073900 reason_noninterview1989
rename R3074500 region1989
rename R3074700 marst1989
rename R3075000 age1989
rename R3271000 weight1990
rename R3302500 interview_mo1990
rename R3400200 svywgt1990
rename R3400500 reason_noninterview1990
rename R3401200 region1990
rename R3401400 marst1990
rename R3401700 age1990
rename R3573400 interview_mo1991
rename R3655800 svywgt1991
rename R3655900 reason_noninterview1991
rename R3656600 region1991
rename R3656800 marst1991
rename R3657100 age1991
rename R3886400 weight1992
rename R3917600 interview_mo1992
rename R4006300 svywgt1992
rename R4006400 reason_noninterview1992
rename R4007100 region1992
rename R4007300 marst1992
rename R4007600 age1992
rename R4100200 interview_mo1993
rename R4100202 interview_yr1993
rename R4284800 weight1993
rename R4417400 svywgt1993
rename R4417500 reason_noninterview1993
rename R4418200 region1993
rename R4418400 marst1993
rename R4418700 age1993
rename R4500201 interview_mo1994
rename R4500202 interview_yr1994
rename R4962000 weight1994
rename R5080400 svywgt1994
rename R5080500 reason_noninterview1994
rename R5081200 region1994
rename R5081400 marst1994
rename R5081700 age1994
rename R5165700 svywgt1996
rename R5165800 reason_noninterview1996
rename R5166500 region1996
rename R5166700 marst1996
rename R5167000 age1996
rename R5200201 interview_mo1996
rename R5200202 interview_yr1996
rename R5617500 weight1996
rename R6344500 weight1998
rename R6435301 interview_mo1998
rename R6435302 interview_yr1998
rename R6466300 svywgt1998
rename R6478500 reason_noninterview1998
rename R6479100 region1998
rename R6479300 marst1998
rename R6479800 age1998
rename R6888100 weight2000
rename R6963301 interview_mo2000
rename R6963302 interview_yr2000
rename R7006200 svywgt2000
rename R7006300 reason_noninterview2000
rename R7006800 region2000
rename R7007000 marst2000
rename R7007500 age2000
rename R7598500 weight2002
rename R7656301 interview_mo2002
rename R7656302 interview_yr2002
rename R7703400 svywgt2002
rename R7703500 reason_noninterview2002
rename R7704100 region2002
rename R7704300 marst2002
rename R7704800 age2002
rename R7800501 interview_mo2004
rename R7800502 interview_yr2004
rename R8298300 weight2004
rename R8495700 svywgt2004
rename R8495900 reason_noninterview2004
rename R8496500 region2004
rename R8496700 marst2004
rename R8497200 age2004
rename R9908600 ageFirstMarriage
rename T0000901 interview_mo2006
rename T0000902 interview_yr2006
rename T0897300 weight2006
rename T0897400 heightFeet2006
rename T0897500 heightInches2006
rename T0987300 svywgt2006
rename T0987500 reason_noninterview2006
rename T0988300 region2006
rename T0988500 marst2006
rename T0989000 age2006
rename T1200701 interview_mo2008
rename T1200702 interview_yr2008
rename T2053800 weight2008
rename T2053900 heightFeet2008
rename T2054000 heightInches2008
rename T2209600 svywgt2008
rename T2209800 reason_noninterview2008
rename T2210300 region2008
rename T2210500 marst2008
rename T2210800 age2008
rename T2260601 interview_mo2010
rename T2260602 interview_yr2010
rename T3024700 weight2010
rename T3024800 heightFeet2010
rename T3024900 heightInches2010
rename T3107400 svywgt2010
rename T3107600 reason_noninterview2010
rename T3108200 region2010
rename T3108400 marst2010
rename T3108700 age2010
rename T3195601 interview_mo2012
rename T3195602 interview_yr2012
rename T3955000 weight2012
rename T3955100 heightFeet2012
rename T3955200 heightInches2012
rename T4111900 svywgt2012
rename T4112100 reason_noninterview2012
rename T4112700 region2012
rename T4112900 marst2012
rename T4113200 age2012
rename T4181101 interview_mo2014
rename T4181102 interview_yr2014
rename T4892700 weight2014
rename T4892800 heightFeet2014
rename T4892900 heightInches2014
rename T5022100 svywgt2014
rename T5022300 reason_noninterview2014
rename T5023100 region2014
rename T5023300 marst2014
rename T5023600 age2014
rename T5150001 interview_mo2016
rename T5150002 interview_yr2016
rename T5595800 weight2016
rename T5595900 heightFeet2016
rename T5596000 heightInches2016
rename T5770400 svywgt2016
rename T5770600 reason_noninterview2016
rename T5771000 region2016
rename T5771200 marst2016
rename T5771500 age2016
rename T7720001 interview_mo2018
rename T7720002 interview_yr2018
rename T8089600 weight2018
rename T8089700 heightFeet2018
rename T8089800 heightInches2018
rename T8218300 svywgt2018
rename T8218500 reason_noninterview2018
rename T8219100 region2018
rename T8219300 marst2018
rename T8219400 age2018

rename R0780300 drinkAlcoholPastMonth1982
rename R1021900 drinkAlcoholPastMonth1983
rename R1391000 drinkAlcoholPastMonth1984
rename R1774600 drinkAlcoholPastMonth1985
rename R2716600 drinkAlcoholPastMonth1988
rename R2968200 drinkAlcoholPastMonth1989
rename R4979200 drinkAlcoholPastMonth1994
rename R7606400 drinkAlcoholPastMonth2002
rename T0911100 drinkAlcoholPastMonth2006
rename T2075400 drinkAlcoholPastMonth2008
rename T3044000 drinkAlcoholPastMonth2010
rename T3976200 drinkAlcoholPastMonth2012
rename T4914500 drinkAlcoholPastMonth2014

rename R1022100 daysDrinkAlcoholPastMonth1983
rename R1391400 daysDrinkAlcoholPastMonth1984
rename R1774900 daysDrinkAlcoholPastMonth1985
rename R2716800 daysDrinkAlcoholPastMonth1988
rename R2968400 daysDrinkAlcoholPastMonth1989
rename R3914800 daysDrinkAlcoholPastMonth1992
rename R4979400 daysDrinkAlcoholPastMonth1994
rename R7606500 daysDrinkAlcoholPastMonth2002
rename T0911200 daysDrinkAlcoholPastMonth2006
rename T2075500 daysDrinkAlcoholPastMonth2008
rename T3044100 daysDrinkAlcoholPastMonth2010
rename T3976300 daysDrinkAlcoholPastMonth2012
rename T4914600 daysDrinkAlcoholPastMonth2014

rename T2074500 ever100cigs2008
rename T3043100 ever100cigs2010
rename T3975300 ever100cigs2012
rename T4913600 ever100cigs2014
rename T5617300 ever100cigs2016
rename T8113900 ever100cigs2018

rename R1395700 marijuana1984
rename R2721100 marijuana1988
rename R3915300 marijuana1992
rename R5053400 marijuana1994
rename R6430700 marijuana1998

rename R0144900 healthProblemKindWork1979
rename R0298900 healthProblemKindWork1980
rename R0478200 healthProblemKindWork1981
rename R0776400 healthProblemKindWork1982
rename R1021100 healthProblemKindWork1983
rename R1390400 healthProblemKindWork1984
rename R1773300 healthProblemKindWork1985
rename R2140800 healthProblemKindWork1986
rename R2348600 healthProblemKindWork1987
rename R2711000 healthProblemKindWork1988
rename R2959100 healthProblemKindWork1989
rename R3270500 healthProblemKindWork1990
rename R3558000 healthProblemKindWork1991
rename R3885600 healthProblemKindWork1992
rename R4284000 healthProblemKindWork1993
rename R4961200 healthProblemKindWork1994
rename R5616700 healthProblemKindWork1996
rename R6343700 healthProblemKindWork1998
rename R6887300 healthProblemKindWork2000
rename R7597700 healthProblemKindWork2002
rename R8297500 healthProblemKindWork2004
rename T0895800 healthProblemKindWork2006
rename T2051600 healthProblemKindWork2008
rename T3022900 healthProblemKindWork2010
rename T3953100 healthProblemKindWork2012
rename T4890800 healthProblemKindWork2014
rename T5593900 healthProblemKindWork2016
rename T8088200 healthProblemKindWork2018

rename R0145000 healthProblemAmntWork1979
rename R0299000 healthProblemAmntWork1980
rename R0478300 healthProblemAmntWork1981
rename R0776500 healthProblemAmntWork1982
rename R1021200 healthProblemAmntWork1983
rename R1390500 healthProblemAmntWork1984
rename R1773400 healthProblemAmntWork1985
rename R2140900 healthProblemAmntWork1986
rename R2348700 healthProblemAmntWork1987
rename R2711100 healthProblemAmntWork1988
rename R2959200 healthProblemAmntWork1989
rename R3270600 healthProblemAmntWork1990
rename R3558100 healthProblemAmntWork1991
rename R3885700 healthProblemAmntWork1992
rename R4284100 healthProblemAmntWork1993
rename R4961300 healthProblemAmntWork1994
rename R5616800 healthProblemAmntWork1996
rename R6343800 healthProblemAmntWork1998
rename R6887400 healthProblemAmntWork2000
rename R7597800 healthProblemAmntWork2002
rename R8297600 healthProblemAmntWork2004
rename T0895900 healthProblemAmntWork2006
rename T2051700 healthProblemAmntWork2008
rename T3023000 healthProblemAmntWork2010
rename T3953200 healthProblemAmntWork2012
rename T4890900 healthProblemAmntWork2014
rename T5594000 healthProblemAmntWork2016
rename T8088300 healthProblemAmntWork2018

rename T2057300 freqSnack2008
rename T3027700 freqSnack2010
rename T3958500 freqSnack2012
rename T4896200 freqSnack2014
rename T5600200 freqSnack2016
rename T2057400 freqSnackTimeU2008
rename T3027800 freqSnackTimeU2010
rename T3958600 freqSnackTimeU2012
rename T4896300 freqSnackTimeU2014
rename T5600300 freqSnackTimeU2016

rename T2057100 freqEatFastFood2008
rename T3027500 freqEatFastFood2010
rename T3958300 freqEatFastFood2012
rename T4896000 freqEatFastFood2014
rename T5600000 freqEatFastFood2016
rename T2057200 freqEatFastFoodTimeU2008
rename T3027600 freqEatFastFoodTimeU2010
rename T3958400 freqEatFastFoodTimeU2012
rename T4896100 freqEatFastFoodTimeU2014
rename T5600100 freqEatFastFoodTimeU2016

rename T2057700 freqSugary2008
rename T3028100 freqSugary2010
rename T3958900 freqSugary2012
rename T4896600 freqSugary2014
rename T5600600 freqSugary2016
rename T2057800 freqSugaryTimeU2008
rename T3028200 freqSugaryTimeU2010
rename T3959000 freqSugaryTimeU2012
rename T4896700 freqSugaryTimeU2014
rename T5600700 freqSugaryTimeU2016

rename R7599600 tryingLoseGainWeight2002
rename R8300000 tryingLoseGainWeight2004
rename T0899200 tryingLoseGainWeight2006
rename T2056800 tryingLoseGainWeight2008
rename T3027200 tryingLoseGainWeight2010
rename T3958000 tryingLoseGainWeight2012
rename T4895700 tryingLoseGainWeight2014
rename T5599700 tryingLoseGainWeight2016
rename T8092800 tryingLoseGainWeight2018

rename R7599700 readNutritionLabels2002
rename R8301800 readNutritionLabels2004
rename T0899300 readNutritionLabels2006
rename T2056900 readNutritionLabels2008
rename T3027300 readNutritionLabels2010
rename T3958100 readNutritionLabels2012
rename T4895800 readNutritionLabels2014
rename T5599800 readNutritionLabels2016

rename R7599800 readIngredients2002
rename R8301900 readIngredients2004
rename T0899400 readIngredients2006
rename T2057000 readIngredients2008
rename T3027400 readIngredients2010
rename T3958200 readIngredients2012
rename T4895900 readIngredients2014
rename T5599900 readIngredients2016

rename T2057500 freqSkipMeal2008
rename T3027900 freqSkipMeal2010
rename T3958700 freqSkipMeal2012
rename T4896400 freqSkipMeal2014
rename T5600400 freqSkipMeal2016
rename T2057600 freqSkipMealTimeU2008
rename T3028000 freqSkipMealTimeU2010
rename T3958800 freqSkipMealTimeU2012
rename T4896500 freqSkipMealTimeU2014
rename T5600500 freqSkipMealTimeU2016

rename R8298400 freqVigorousExercise2004
rename T0897600 freqVigorousExercise2006
rename T2054100 freqVigorousExercise2008
rename T3024901 freqVigorousExercise2010
rename T3955300 freqVigorousExercise2012
rename T4893000 freqVigorousExercise2014
rename T5596100 freqVigorousExercise2016
rename T8089900 freqVigorousExercise2018

rename R8298700 lengthVigorousExericse2004
rename T0897900 lengthVigorousExericse2006
rename T2054400 lengthVigorousExericse2008
rename T3025101 lengthVigorousExericse2010
rename T3955600 lengthVigorousExericse2012
rename T4893300 lengthVigorousExericse2014
rename T5596400 lengthVigorousExericse2016

rename R8298900 freqModerateExercise2004
rename T0898100 freqModerateExercise2006
rename T2054600 freqModerateExercise2008
rename T3025201 freqModerateExercise2010
rename T3955800 freqModerateExercise2012
rename T4893500 freqModerateExercise2014
rename T5596600 freqModerateExercise2016
rename T8090000 freqModerateExercise2018

rename R7598700 unableNeverModerateExercise2002
rename R8299100 unableNeverModerateExercise2004
rename T0898300 unableNeverModerateExercise2006
rename T2054800 unableNeverModerateExercise2008
rename T3025400 unableNeverModerateExercise2010
rename T3956000 unableNeverModerateExercise2012
rename T4893700 unableNeverModerateExercise2014
rename T5596800 unableNeverModerateExercise2016

rename R8299200 lengthModerateExercise2004
rename T0898400 lengthModerateExercise2006
rename T2054900 lengthModerateExercise2008
rename T3025401 lengthModerateExercise2010
rename T3956100 lengthModerateExercise2012
rename T4893800 lengthModerateExercise2014
rename T5596900 lengthModerateExercise2016

rename R8299400 freqStrengthExercise2004
rename T0898600 freqStrengthExercise2006
rename T2055100 freqStrengthExercise2008
rename T3025501 freqStrengthExercise2010
rename T3956300 freqStrengthExercise2012
rename T4894000 freqStrengthExercise2014
rename T5597100 freqStrengthExercise2016
rename T8090100 freqStrengthExercise2018

rename R0089700 occupation_job2_1979
rename R0089800 occupation_job3_1979
rename R0089900 occupation_job4_1979
rename R0090000 occupation_job5_1979
rename R0338300 occupation_job1_1980
rename R0349800 occupation_job2_1980
rename R0361300 occupation_job3_1980
rename R0372800 occupation_job4_1980
rename R0384300 occupation_job5_1980
rename R0546000 occupation_job1_1981
rename R0559100 occupation_job2_1981
rename R0572200 occupation_job3_1981
rename R0585300 occupation_job4_1981
rename R0598400 occupation_job5_1981
rename R0840500 occupation_job1_1982
rename R0853600 occupation_job2_1982
rename R0866700 occupation_job3_1982
rename R0879800 occupation_job4_1982
rename R0892900 occupation_job5_1982
rename R1087700 occupation_job1_1983
rename R1100900 occupation_job2_1983
rename R1114100 occupation_job3_1983
rename R1127300 occupation_job4_1983
rename R1140500 occupation_job5_1983
rename R1463400 occupation_job1_1984
rename R1476500 occupation_job2_1984
rename R1489600 occupation_job3_1984
rename R1502700 occupation_job4_1984
rename R1515800 occupation_job5_1984
rename R1810200 occupation_job1_1985
rename R1822900 occupation_job2_1985
rename R1835600 occupation_job3_1985
rename R1848300 occupation_job4_1985
rename R1861000 occupation_job5_1985
rename R2171900 occupation_job1_1986
rename R2185500 occupation_job2_1986
rename R2199100 occupation_job3_1986
rename R2212700 occupation_job4_1986
rename R2226300 occupation_job5_1986
rename R2376700 occupation_job1_1987
rename R2388000 occupation_job2_1987
rename R2399300 occupation_job3_1987
rename R2410600 occupation_job4_1987
rename R2421900 occupation_job5_1987
rename R2771500 occupation_job1_1988
rename R2784400 occupation_job2_1988
rename R2797300 occupation_job3_1988
rename R2810200 occupation_job4_1988
rename R2823100 occupation_job5_1988
rename R3013300 occupation_job1_1989
rename R3026400 occupation_job2_1989
rename R3039500 occupation_job3_1989
rename R3052600 occupation_job4_1989
rename R3065700 occupation_job5_1989
rename R3340700 occupation_job1_1990
rename R3354700 occupation_job2_1990
rename R3368700 occupation_job3_1990
rename R3382700 occupation_job4_1990
rename R3396700 occupation_job5_1990
rename R3605000 occupation_job1_1991
rename R3617100 occupation_job2_1991
rename R3629200 occupation_job3_1991
rename R3641300 occupation_job4_1991
rename R3653400 occupation_job5_1991
rename R3955200 occupation_job1_1992
rename R3967400 occupation_job2_1992
rename R3979600 occupation_job3_1992
rename R3991800 occupation_job4_1992
rename R4004000 occupation_job5_1992
rename R4206100 occupation_job2_1993
rename R4213300 occupation_job3_1993
rename R4220900 occupation_job4_1993
rename R4228300 occupation_job5_1993
rename R4587904 occupation_job1_1994
rename R4631902 occupation_job2_1994
rename R4675902 occupation_job3_1994
rename R4715202 occupation_job4_1994
rename R4749402 occupation_job5_1994
rename R5270600 occupation_job1_1996
rename R5310900 occupation_job2_1996
rename R5349900 occupation_job3_1996
rename R5387000 occupation_job4_1996
rename R5421500 occupation_job5_1996
rename R6472600 occupation_job1_1998
rename R6472700 occupation_job2_1998
rename R6472800 occupation_job3_1998
rename R6472900 occupation_job4_1998
rename R6473000 occupation_job5_1998
rename R6591800 occupation_job1_2000
rename R6591900 occupation_job2_2000
rename R6592000 occupation_job3_2000
rename R6592100 occupation_job4_2000
rename R6592200 occupation_job5_2000
rename R7209600 occupation_job1_2002
rename R7209700 occupation_job2_2002
rename R7209800 occupation_job3_2002
rename R7209900 occupation_job4_2002
rename R7210000 occupation_job5_2002
rename R7898000 occupation_job1_2004
rename R7898100 occupation_job2_2004
rename R7898200 occupation_job3_2004
rename R7898300 occupation_job4_2004
rename R7898400 occupation_job5_2004
rename T0138400 occupation_job1_2006
rename T0138500 occupation_job2_2006
rename T0138600 occupation_job3_2006
rename T0138700 occupation_job4_2006
rename T0138800 occupation_job5_2006
rename T1298000 occupation_job1_2008
rename T1298100 occupation_job2_2008
rename T1298200 occupation_job3_2008
rename T1298300 occupation_job4_2008
rename T1298400 occupation_job5_2008
rename T2326500 occupation_job1_2010
rename T2326600 occupation_job2_2010
rename T2326700 occupation_job3_2010
rename T2326800 occupation_job4_2010
rename T2326900 occupation_job5_2010
rename T3308700 occupation_job1_2012
rename T3308800 occupation_job2_2012
rename T3308900 occupation_job3_2012
rename T3309000 occupation_job4_2012
rename T3309100 occupation_job5_2012
rename T4282800 occupation_job1_2014
rename T4282900 occupation_job2_2014
rename T4283000 occupation_job3_2014
rename T4283100 occupation_job4_2014
rename T4283200 occupation_job5_2014
rename T5256900 occupation_job1_2016
rename T5257000 occupation_job2_2016
rename T5257100 occupation_job3_2016
rename T5257200 occupation_job4_2016
rename T5257300 occupation_job5_2016
rename T7818600 occupation_job1_2018
rename T7818700 occupation_job2_2018
rename T7818800 occupation_job3_2018
rename T7818900 occupation_job4_2018
rename T7819000 occupation_job5_2018

rename R0091710 wage_job1_1979
rename R0091910 wage_job2_1979
rename R0092110 wage_job3_1979
rename R0092310 wage_job4_1979
rename R0092510 wage_job5_1979
rename R0338910 wage_job1_1980
rename R0350410 wage_job2_1980
rename R0361910 wage_job3_1980
rename R0373410 wage_job4_1980
rename R0384910 wage_job5_1980
rename R0546610 wage_job1_1981
rename R0559710 wage_job2_1981
rename R0572810 wage_job3_1981
rename R0585910 wage_job4_1981
rename R0599010 wage_job5_1981
rename R0841010 wage_job1_1982
rename R0854110 wage_job2_1982
rename R0867210 wage_job3_1982
rename R0880310 wage_job4_1982
rename R0893410 wage_job5_1982
rename R1088210 wage_job1_1983
rename R1101410 wage_job2_1983
rename R1114610 wage_job3_1983
rename R1127810 wage_job4_1983
rename R1141010 wage_job5_1983
rename R1463910 wage_job1_1984
rename R1477010 wage_job2_1984
rename R1490110 wage_job3_1984
rename R1503210 wage_job4_1984
rename R1516310 wage_job5_1984
rename R1810710 wage_job1_1985
rename R1823410 wage_job2_1985
rename R1836110 wage_job3_1985
rename R1848810 wage_job4_1985
rename R1861510 wage_job5_1985
rename R2172410 wage_job1_1986
rename R2186010 wage_job2_1986
rename R2199610 wage_job3_1986
rename R2213210 wage_job4_1986
rename R2226810 wage_job5_1986
rename R2377210 wage_job1_1987
rename R2388510 wage_job2_1987
rename R2399810 wage_job3_1987
rename R2411110 wage_job4_1987
rename R2422410 wage_job5_1987
rename R2772210 wage_job1_1988
rename R2785110 wage_job2_1988
rename R2798010 wage_job3_1988
rename R2810910 wage_job4_1988
rename R2823810 wage_job5_1988
rename R3014010 wage_job1_1989
rename R3027110 wage_job2_1989
rename R3040210 wage_job3_1989
rename R3053310 wage_job4_1989
rename R3066410 wage_job5_1989
rename R3341500 wage_job1_1990
rename R3355500 wage_job2_1990
rename R3369500 wage_job3_1990
rename R3383500 wage_job4_1990
rename R3397500 wage_job5_1990
rename R3605800 wage_job1_1991
rename R3617900 wage_job2_1991
rename R3630000 wage_job3_1991
rename R3642100 wage_job4_1991
rename R3654200 wage_job5_1991
rename R3956000 wage_job1_1992
rename R3968200 wage_job2_1992
rename R3980400 wage_job3_1992
rename R3992600 wage_job4_1992
rename R4004800 wage_job5_1992
rename R4416900 wage_job1_1993
rename R4417000 wage_job2_1993
rename R4417100 wage_job3_1993
rename R4417200 wage_job4_1993
rename R4417300 wage_job5_1993
rename R5079900 wage_job1_1994
rename R5080000 wage_job2_1994
rename R5080100 wage_job3_1994
rename R5080200 wage_job4_1994
rename R5080300 wage_job5_1994
rename R5165200 wage_job1_1996
rename R5165300 wage_job2_1996
rename R5165400 wage_job3_1996
rename R5165500 wage_job4_1996
rename R5165600 wage_job5_1996
rename R6478000 wage_job1_1998
rename R6478100 wage_job2_1998
rename R6478200 wage_job3_1998
rename R6478300 wage_job4_1998
rename R6478400 wage_job5_1998
rename R7005700 wage_job1_2000
rename R7005800 wage_job2_2000
rename R7005900 wage_job3_2000
rename R7006000 wage_job4_2000
rename R7006100 wage_job5_2000
rename R7702900 wage_job1_2002
rename R7703000 wage_job2_2002
rename R7703100 wage_job3_2002
rename R7703200 wage_job4_2002
rename R7703300 wage_job5_2002
rename R8495200 wage_job1_2004
rename R8495300 wage_job2_2004
rename R8495400 wage_job3_2004
rename R8495500 wage_job4_2004
rename R8495600 wage_job5_2004
rename T0986800 wage_job1_2006
rename T0986900 wage_job2_2006
rename T0987000 wage_job3_2006
rename T0987100 wage_job4_2006
rename T0987200 wage_job5_2006
rename T2209100 wage_job1_2008
rename T2209200 wage_job2_2008
rename T2209300 wage_job3_2008
rename T2209400 wage_job4_2008
rename T2209500 wage_job5_2008
rename T3106900 wage_job1_2010
rename T3107000 wage_job2_2010
rename T3107100 wage_job3_2010
rename T3107200 wage_job4_2010
rename T3107300 wage_job5_2010
rename T4110900 wage_job1_2012
rename T4111100 wage_job2_2012
rename T4111300 wage_job3_2012
rename T4111500 wage_job4_2012
rename T4111700 wage_job5_2012
rename T5019700 wage_job1_2014
rename T5019900 wage_job2_2014
rename T5020100 wage_job3_2014
rename T5020300 wage_job4_2014
rename T5020500 wage_job5_2014
rename T5768600 wage_job1_2016
rename T5768800 wage_job2_2016
rename T5769000 wage_job3_2016
rename T5769200 wage_job4_2016
rename T5769400 wage_job5_2016
rename T8215400 wage_job1_2018
rename T8215600 wage_job2_2018
rename T8215800 wage_job3_2018
rename T8216000 wage_job4_2018
rename T8216200 wage_job5_2018

rename R0090100 industry_job2_1979
rename R0090200 industry_job3_1979
rename R0090300 industry_job4_1979
rename R0090400 industry_job5_1979
rename R0338400 industry_job1_1980
rename R0349900 industry_job2_1980
rename R0361400 industry_job3_1980
rename R0372900 industry_job4_1980
rename R0384400 industry_job5_1980
rename R0546100 industry_job1_1981
rename R0559200 industry_job2_1981
rename R0572300 industry_job3_1981
rename R0585400 industry_job4_1981
rename R0598500 industry_job5_1981
rename R0840600 industry_job1_1982
rename R0853700 industry_job2_1982
rename R0866800 industry_job3_1982
rename R0879900 industry_job4_1982
rename R0893000 industry_job5_1982
rename R1087800 industry_job1_1983
rename R1101000 industry_job2_1983
rename R1114200 industry_job3_1983
rename R1127400 industry_job4_1983
rename R1140600 industry_job5_1983
rename R1463500 industry_job1_1984
rename R1476600 industry_job2_1984
rename R1489700 industry_job3_1984
rename R1502800 industry_job4_1984
rename R1515900 industry_job5_1984
rename R1810300 industry_job1_1985
rename R1823000 industry_job2_1985
rename R1835700 industry_job3_1985
rename R1848400 industry_job4_1985
rename R1861100 industry_job5_1985
rename R2172000 industry_job1_1986
rename R2185600 industry_job2_1986
rename R2199200 industry_job3_1986
rename R2212800 industry_job4_1986
rename R2226400 industry_job5_1986
rename R2376800 industry_job1_1987
rename R2388100 industry_job2_1987
rename R2399400 industry_job3_1987
rename R2410700 industry_job4_1987
rename R2422000 industry_job5_1987
rename R2771600 industry_job1_1988
rename R2784500 industry_job2_1988
rename R2797400 industry_job3_1988
rename R2810300 industry_job4_1988
rename R2823200 industry_job5_1988
rename R3013400 industry_job1_1989
rename R3026500 industry_job2_1989
rename R3039600 industry_job3_1989
rename R3052700 industry_job4_1989
rename R3065800 industry_job5_1989
rename R3340800 industry_job1_1990
rename R3354800 industry_job2_1990
rename R3368800 industry_job3_1990
rename R3382800 industry_job4_1990
rename R3396800 industry_job5_1990
rename R3605100 industry_job1_1991
rename R3617200 industry_job2_1991
rename R3629300 industry_job3_1991
rename R3641400 industry_job4_1991
rename R3653500 industry_job5_1991
rename R3955300 industry_job1_1992
rename R3967500 industry_job2_1992
rename R3979700 industry_job3_1992
rename R3991900 industry_job4_1992
rename R4004100 industry_job5_1992
rename R4206200 industry_job2_1993
rename R4213400 industry_job3_1993
rename R4221000 industry_job4_1993
rename R4228400 industry_job5_1993
rename R4587903 industry_job1_1994
rename R4631901 industry_job2_1994
rename R4675901 industry_job3_1994
rename R4715201 industry_job4_1994
rename R4749401 industry_job5_1994
rename R5270500 industry_job1_1996
rename R5310800 industry_job2_1996
rename R5349800 industry_job3_1996
rename R5386900 industry_job4_1996
rename R5421400 industry_job5_1996
rename R6472100 industry_job1_1998
rename R6472200 industry_job2_1998
rename R6472300 industry_job3_1998
rename R6472400 industry_job4_1998
rename R6472500 industry_job5_1998
rename R6591300 industry_job1_2000
rename R6591400 industry_job2_2000
rename R6591500 industry_job3_2000
rename R6591600 industry_job4_2000
rename R6591700 industry_job5_2000
rename R7209100 industry_job1_2002
rename R7209200 industry_job2_2002
rename R7209300 industry_job3_2002
rename R7209400 industry_job4_2002
rename R7209500 industry_job5_2002
rename R7897500 industry_job1_2004
rename R7897600 industry_job2_2004
rename R7897700 industry_job3_2004
rename R7897800 industry_job4_2004
rename R7897900 industry_job5_2004
rename T0137900 industry_job1_2006
rename T0138000 industry_job2_2006
rename T0138100 industry_job3_2006
rename T0138200 industry_job4_2006
rename T0138300 industry_job5_2006
rename T1297500 industry_job1_2008
rename T1297600 industry_job2_2008
rename T1297700 industry_job3_2008
rename T1297800 industry_job4_2008
rename T1297900 industry_job5_2008
rename T2326000 industry_job1_2010
rename T2326100 industry_job2_2010
rename T2326200 industry_job3_2010
rename T2326300 industry_job4_2010
rename T2326400 industry_job5_2010
rename T3308200 industry_job1_2012
rename T3308300 industry_job2_2012
rename T3308400 industry_job3_2012
rename T3308500 industry_job4_2012
rename T3308600 industry_job5_2012
rename T4282300 industry_job1_2014
rename T4282400 industry_job2_2014
rename T4282500 industry_job3_2014
rename T4282600 industry_job4_2014
rename T4282700 industry_job5_2014
rename T5256400 industry_job1_2016
rename T5256500 industry_job2_2016
rename T5256600 industry_job3_2016
rename T5256700 industry_job4_2016
rename T5256800 industry_job5_2016
rename T7818100 industry_job1_2018
rename T7818200 industry_job2_2018
rename T7818300 industry_job3_2018
rename T7818400 industry_job4_2018
rename T7818500 industry_job5_2018

drop R8298500 R8298800 R8299000 R8299300 R8299500 T0897700 T0898000 T0898200 T0898500 T0898700 T2054200 T2054500 T2054700 T2055000 T2055200 T3025000 T3025200 T3025300 T3025500 T3025600 T3955400 T3955700 T3955900 T3956200 T3956400 T4893100 T4893400 T4893600 T4893900 T4894100 T5596200 T5596500 T5596700 T5597000 T5597200

***************************************************
* Reshape and recode certain variables.
***************************************************
* consolidate "height (in feet)" and "height (in inches)" into one variable:
forvalues y=2006(2)2018 {
    gen height`y' = heightFeet`y'*12+heightInches`y' if heightFeet`y'>0
    drop heightFeet`y' heightInches`y'
}
generat heightRound1981 = floor(height1981/100)
generat heightIn1981    = height1981-(heightRound1981*100)
replace height1981 = heightRound1981*12+heightIn1981
drop heightRound1981 heightIn1981

* create interview year variables for annual rounds
forvalues y=1979/1992 {
    generat interview_yr`y' = `y'
    replace interview_yr`y' = interview_mo`y' if interview_mo`y'<=0
}

* exclued from reshape: id (i), afqt1980 afqt1989 afqt2006 country_born yearEnteredUS dob_mo1979 dob_yr1979 family_size1979 hgcFath hgcMoth live_with_14 race_screen rotter_1a rotter_1b rotter_2a rotter_2b rotter_3a rotter_3b rotter_4a rotter_4b rotter_score sample_id sex urbanicity_14
forvalues yr=1970/1994 {
    gen temp`yr'=0
}
forvalues yr=1996(2)2018 {
    gen temp`yr'=0
}
reshape long temp diploma_or_ged high_deg_recd high_grade_comp_May netFamilyIncome reason_noninterview region marst age weight height svywgt interview_mo interview_yr daysDrinkAlcoholPastMonth drinkAlcoholPastMonth ever100cigs marijuana healthProblemKindWork healthProblemAmntWork freqSnack freqSnackTimeU freqEatFastFood freqEatFastFoodTimeU freqSugary freqSugaryTimeU tryingLoseGainWeight readNutritionLabels readIngredients freqSkipMeal freqSkipMealTimeU freqVigorousExercise lengthVigorousExercise freqModerateExercise lengthModerateExercise freqStrengthExercise unableNeverModerateExercise wage_job1_ wage_job2_ wage_job3_ wage_job4_ wage_job5_ occupation_job1_ occupation_job2_ occupation_job3_ occupation_job4_ occupation_job5_ industry_job1_ industry_job2_ industry_job3_ industry_job4_ industry_job5_, i(id) j(year)
drop temp
drop if id==.

recode _all (-1 = .r) (-2 = .d) (-3 = .i) (-4 = .v) (-5 = .n)
recode *_yr* (50 = 1950) (51 = 1951) (52 = 1952) (53 = 1953) (54 = 1954) (55 = 1955) (55 = 1955) (57 = 1957) (58 = 1958) (59 = 1959) ///
             (60 = 1960) (61 = 1961) (62 = 1962) (63 = 1963) (64 = 1964) (65 = 1965) (66 = 1966) (67 = 1967) (68 = 1968) (69 = 1969) ///
             (70 = 1970) (71 = 1971) (72 = 1972) (73 = 1973) (74 = 1974) (75 = 1975) (76 = 1976) (77 = 1977) (78 = 1978) (79 = 1979) ///
             (80 = 1980) (81 = 1981) (82 = 1982) (83 = 1983) (84 = 1984) (85 = 1985) (86 = 1986) (87 = 1987) (88 = 1988) (89 = 1989) ///
             (90 = 1990) (91 = 1991) (92 = 1992) (93 = 1993) (94 = 1994) (95 = 1995) (96 = 1996) (97 = 1997) (98 = 1998) (99 = 1999)

***************************************************
* Label variables and values
***************************************************

label var id                          "ID"
label var year                        "YEAR"
label var diploma_or_ged              "IS HS DEGREE A DIPLOMA OR GED"
label var high_deg_recd               "HIGHEST DGR RCVD"
label var high_grade_comp_May         "HIGHEST GRADE COMPLETED (AS OF MAY 1)"
label var dob_mo1979                  "DATE OF BIRTH - MONTH"
label var dob_yr1979                  "DATE OF BIRTH - YR"
label var race_screen                 "RACE-ETHNICITY"
label var ethnicity1                  "1ST OR ONLY RACIAL/ETHNIC ORIGIN"
label var ethnicity2                  "2ND RACIAL/ETHNIC ORIGIN"
label var ethnicity3                  "3RD RACIAL/ETHNIC ORIGIN"
label var ethnicity4                  "4TH RACIAL/ETHNIC ORIGIN"
label var ethnicity5                  "5TH RACIAL/ETHNIC ORIGIN"
label var ethnicity6                  "6TH RACIAL/ETHNIC ORIGIN"
label var ethnicityMostClose          "RACIAL/ETHNIC ORIGIN WITH WHICH R IDENTIFIES MOST CLOSELY (> 1 ORIGIN)"
label var sex                         "SEX"
label var afqt1980                    "AFQT PRCTILE SCORE-1980"
label var afqt1989                    "AFQT PRCTILE SCORE-1989 (REV)"
label var afqt2006                    "AFQT PRCTILE SCORE-2006 (REV)"
label var country_born                "CNTRY OF BIRTH 79"
label var yearEnteredUS               "YEAR FIRST ENTERED UNITED STATES"
label var family_size1979             "FAMILY SIZE 79"
label var hgcFath                     "HGC BY RS FATHER 79"
label var hgcMoth                     "HGC BY RS MOTHER 79"
label var live_with_14                "WITH WHOM DID R LIVE @ AGE 14 79"
label var reason_noninterview         "REASON FOR NONINTERVIEW"
label var region                      "CENSUS REGION OF CURRENT RESIDENCE"
label var marst                       "MARITAL STATUS"
label var height                      "HEIGHT OF R (IN INCHES)"
label var weight                      "WEIGHT OF R (IN LBS)"
label var rotter_1a                   "ROTTER SCALE - PAIR ONE, STMT A 79"
label var rotter_1b                   "ROTTER SCALE - PAIR ONE, STMT B 79"
label var rotter_2a                   "ROTTER SCALE - PAIR TWO, STMT A 79"
label var rotter_2b                   "ROTTER SCALE - PAIR TWO, STMT B 79"
label var rotter_3a                   "ROTTER SCALE - PAIR THREE, STMT A 79"
label var rotter_3b                   "ROTTER SCALE - PAIR THREE, STMT B 79"
label var rotter_4a                   "ROTTER SCALE - PAIR FOUR, STMT A 79"
label var rotter_4b                   "ROTTER SCALE - PAIR FOUR, STMT B 79"
label var rotter_score                "ROTTER SCALE SCORE 79"
label var sample_id                   "OVERSAMPLE STATUS"
label var urbanicity_14               "AREA RESIDENCE @ AGE 14 URBAN/RURAL 79"
label var svywgt                      "SAMPLING WEIGHT"
label var drinkAlcoholPastMonth       "ALCOHOL USE - HAD ANY ALCOHOLIC BEVERAGES IN LAST MONTH?"
label var daysDrinkAlcoholPastMonth   "ALCOHOL USE - # OF DAYS DRANK ALCOHOL IN LAST MONTH"
label var ever100cigs                 "R SMOKED AT LEAST 100 CIGARETTES IN R LIFETIME?"
label var marijuana                   "DRUG USE - # OF TIMES USED MARIJUANA OR HASHISH IN PAST 30 DAYS"
label var healthProblemKindWork       "DOES HEALTH LIMIT KIND OF WORK R CAN DO?"
label var healthProblemAmntWork       "DOES HEALTH LIMIT AMOUNT OF WORK R CAN DO?"
label var freqSnack                   "TIMES EATING SNACK BETWEEN MEALS IN THE PAST 7 DAYS"
label var freqSnackTimeU              "TIME UNIT EATING SNACK PAST 7 DAYS"
label var freqEatFastFood             "TIMES ATE FOOD FROM A FAST FOOD RESTAURANT IN THE PAST 7 DAYS"
label var freqEatFastFoodTimeU        "TIME UNIT ATE FOOD FROM A FAST FOOD RESTAURANT IN THE PAST 7 DAYS"
label var freqSugary                  "TIMES HAVING A SOFT DRINK OR SODA CONTAINED SUGAR IN THE PAST 7 DAYS"
label var freqSugaryTimeU             "TIME UNIT HAVING SOFT DRINK OR SODA PAST 7 DAYS"
label var tryingLoseGainWeight        "R CURRENTLY TRYING TO LOSE OR GAIN WEIGHT?"
label var readNutritionLabels         "R READ NUTRITIONAL INFORMATION WHEN SHOPPING FOR FOOD?"
label var readIngredients             "R READ INGREDIENTS WHEN SHOPPING FOR FOOD?"
label var freqSkipMeal                "TIMES SKIPPING A MEAL IN THE PAST 7 DAYS"
label var freqSkipMealTimeU           "TIME UNIT SKIPPING A MEAL IN THE PAST 7 DAYS"
label var freqVigorousExercise        "FREQUENCY R ENGAGES IN VIGOROUS ACTIVITIES FOR AT LEAST 10 MINUTES"
label var lengthVigorousExercise      "LENGTH OF TIME (MINUTES) OF VIGOROUS ACTIVITIES EACH TIME"
label var freqModerateExercise        "FREQUENCY R ENGAGES IN LIGHT OR MODERATE ACTIVITIES FOR AT LEAST 10 MINUTES"
label var lengthModerateExercise      "LENGTH OF TIME (MINUTES) OF LIGHT OR MODERATE ACTIVITIES EACH TIME"
label var freqStrengthExercise        "FREQUENCY R ENGAGES IN STRENGTH TRAINING ACTIVITIES FOR AT LEAST 10 MINUTES"
label var unableNeverModerateExercise "R UNABLE TO/NEVER ENGAGES IN LIGHT OR MODERATE ACTIVITIES AT LEAST 10 MINUTES"

* label define vl_grade   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YR COL"  14 "2ND YR COL"  15 "3RD YR COL"  16 "4TH YR COL"  17 "5TH YR COL"  18 "6TH YR COL"  19 "7TH YR COL"  20 "8TH YR COL OR MORE"  95 "UNGRADED" // prev defined
label values high_grade_comp_May vl_grade

label define vl_diploma  1 "HIGH SCHOOL DIPLOMA"  2 "GED"  3 "BOTH"
label values diploma_or_ged vl_diploma

* Bring together degree data
label define vl_degree_long   1 "HIGH SCHOOL DIPLOMA (OR EQUIVALENT)"  2 "ASSOCIATE/JUNIOR COLLEGE (AA)"  3 "BACHELOR'S DEGREE/BACHELOR OF ARTS DEGREE (BA)"  4 "BACHELOR OF SCIENCE (BS)"  5 "MASTER'S DEGREE (MA,MBA,MS,MSW)"  6 "DOCTORAL DEGREE (PHD)"  7 "PROFESSIONAL DEGREE (MD,LLD,DDS)"  8 "OTHER"
* label define vl_degree_short  1 "ASSOCIATE'S DEGREE"  2 "BACHELOR'S DEGREE"  3 "MASTER'S DEGREE"  4 "OTHER"
* recode type_*degree_recd (4/290 = 8) (3 = 5) (2 = 3) (1 = 2)
label values high_deg_recd     vl_degree_long

label define vl_race   1 "HISPANIC"  2 "BLACK"  3 "NON-BLACK, NON-HISPANIC"
label values race_screen vl_race

label define vl_sex   1 "MALE"  2 "FEMALE"
label values sex vl_sex

label define vl_born   1 "IN THE US"  2 "IN OTHER COUNTRY"
label values country_born vl_born

label define vl_eth    0 "NONE"  1 "BLACK"  2 "CHINESE"  3 "ENGLISH"  4 "FILIPINO"  5 "FRENCH"  6 "GERMAN"  7 "GREEK"  8 "HAWAIIAN, P.I."  9 "INDIAN-AMERICAN OR NATIVE AMERICAN" 10 "ASIAN INDIAN" 11 "IRISH" 12 "ITALIAN" 13 "JAPANESE" 14 "KOREAN" 15 "CUBAN" 16 "CHICANO" 17 "MEXICAN" 18 "MEXICAN-AMER" 19 "PUERTO RICAN" 20 "OTHER HISPANIC" 21 "OTHER SPANISH" 22 "POLISH" 23 "PORTUGUESE" 24 "RUSSIAN" 25 "SCOTTISH" 26 "VIETNAMESE" 27 "WELSH" 28 "OTHER" 29 "AMERICAN"
label values ethnicity1         vl_eth
label values ethnicity2         vl_eth
label values ethnicity3         vl_eth
label values ethnicity4         vl_eth
label values ethnicity5         vl_eth
label values ethnicity6         vl_eth
label values ethnicityMostClose vl_eth

label define vl_grade   0 "NONE"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YR COL"  14 "2ND YR COL"  15 "3RD YR COL"  16 "4TH YR COL"  17 "5TH YR COL"  18 "6TH YR COL"  19 "7TH YR COL"  20 "8TH YR COL OR MORE"  95 "UNGRADED"
label values hgcFath vl_grade
label values hgcMoth vl_grade

label define vl_live_with   11 "FATHER-MOTHER"  12 "FATHER-STEPMOTHER"  13 "FATHER-OTHER WOMAN RELATIVE"  14 "FATHER-OTHER WOMAN"  15 "FATHER-NO WOMAN"  19 "FATHER-MISSING WOMAN"  21 "STEPFATHER-MOTHER"  22 "STEPFATHER-STEPMOTHER"  23 "STEPFATHER-WOMAN RELATIVE"  24 "STEPFATHER-OTHER WOMAN"  25 "STEPFATHER-NO WOMAN"  31 "MAN RELATIVE-MOTHER"  32 "MAN RELATIVE-STEPMOTHER"  33 "MAN RELATIVE-WOMAN RELATIVE"  34 "MAN RELATIVE-OTHER WOMAN"  35 "MAN RELATIVE-NO WOMAN"  41 "OTHER MAN-MOTHER"  42 "OTHER MAN-STEPMOTHER"  43 "OTHER MAN-WOMAN RELATIVE"  44 "OTHER MAN-OTHER WOMAN"  45 "OTHER MAN-NO WOMAN"  51 "NO MAN-MOTHER"  52 "NO MAN-STEPMOTHER"  53 "NO MAN-WOMAN RELATIVE"  54 "NO MAN-OTHER WOMAN"  55 "NO MAN-NO WOMAN"  80 "OTHER ARRANGEMENT"  90 "ON MY OWN"  91 "MISSING MAN-MOTHER"  93 "MISSING MAN-WOMAN RELATIVE"
label values live_with_14 vl_live_with

label define vl_sample_id   1 "CROSS MALE WHITE"  2 "CROSS MALE WH. POOR"  3 "CROSS MALE BLACK"  4 "CROSS MALE HISPANIC"  5 "CROSS FEMALE WHITE"  6 "CROSS FEMALE WH POOR"  7 "CROSS FEMALE BLACK"  8 "CROSS FEMALE HISPANIC"  9 "SUP MALE WH POOR"  10 "SUP MALE BLACK"  11 "SUP MALE HISPANIC"  12 "SUP FEM WH POOR"  13 "SUP FEMALE BLACK"  14 "SUP FEMALE HISPANIC"  15 "MIL MALE WHITE"  16 "MIL MALE BLACK"  17 "MIL MALE HISPANIC"  18 "MIL FEMALE WHITE"  19 "MIL FEMALE BLACK"  20 "MIL FEMALE HISPANIC"
label values sample_id vl_sample_id

label define vl_rotter_control   1 "IN CONTROL"      2 "NOT IN CONTROL"
label define vl_rotter_closeness 1 "MUCH CLOSER"     2 "SLIGHTLY CLOSER"
label define vl_rotter_plans     1 "R'S PLANS WORK"  2 "MATTER OF LUCK"
label define vl_rotter_luck1     1 "LUCK NOT FACTOR" 2 "FLIP A COIN"
label define vl_rotter_luck2     1 "LUCK BIG ROLE"   2 "LUCK NO ROLE"
label values rotter_1a vl_rotter_control
label values rotter_1b vl_rotter_closeness
label values rotter_2a vl_rotter_plans
label values rotter_2b vl_rotter_closeness
label values rotter_3a vl_rotter_luck1
label values rotter_3b vl_rotter_closeness
label values rotter_4a vl_rotter_luck2
label values rotter_4b vl_rotter_closeness

label define vl_noninterview   60 "PARENT REFUSAL/BREAKOFF"  61 "YOUTH REFUSAL/BREAKOFF"  62 "PARENT AND YOUTH REFUSAL/BREAKOFF"  63 "UNABLE TO LOCATE FAMILY UNIT AND YOUTH"  64 "UNABLE TO LOCATE YOUTH"  65 "DECEASED"  66 "OTHER" 67 "DO NOT REFIELD (VERY DIFFICULT CASES)"  68 "MILITARY SAMPLE DROPPED"  69 "SUPPLEMENTAL MALE POOR WHITE SAMPLE DROPPED"  70 "SUPPLEMENTAL FEMALE POOR WHITE SAMPLE DROPPED"
label values reason_noninterview vl_noninterview

label define vl_marst   0 "NEVER MARRIED" 1 "MARRIED" 2 "SEPARATED" 3 "DIVORCED" 5 "REMARRIED" 6 "WIDOWED"
label values marst vl_marst

label define vl_region   1 "NORTHEAST"  2 "NORTH CENTRAL"  3 "SOUTH"  4 "WEST"
label values region vl_region

label define vl_urbanicity   1 "IN TOWN OR CITY"  2 "IN COUNTRY-NOT FARM"  3 "ON FARM OR RANCH"
label values urbanicity_14 vl_urbanicity

label define vl_eat_timeunit 1 "Per Day" 2 "Per Week"
label val freqSnackTimeU       vl_eat_timeunit
label val freqEatFastFoodTimeU vl_eat_timeunit
label val freqSugaryTimeU      vl_eat_timeunit
label val freqSkipMealTimeU    vl_eat_timeunit

label define vl_wgt_mgt 1 "Lose weight" 2 "Gain weight" 3 "Stay about the same" 4 "Not trying to do anything"
label val tryingLoseGainWeight vl_wgt_mgt

label define vl_nutrition 0 "Don't buy food" 1 "Always" 2 "Often" 3 "Sometimes" 4 "Rarely" 5 "Never"
label val readNutritionLabels vl_nutrition
label val readIngredients     vl_nutrition

order id year dob* race_screen sex