* Import, rename, reshape, recode and label the variables

infile using ${raw}obesity.dct, clear

****************
* Rename
****************

ren R0000100 id
ren R1235800 Sample_type
ren R1482600 race_ethnicity
ren R0536300 sex
ren R0536401 birth_month
ren R0536402 birth_year

ren R1236101 svywgt1997
ren R2600301 svywgt1998
ren R3923701 svywgt1999
ren R5510600 svywgt2000
ren R7274200 svywgt2001
ren S1598100 svywgt2002
ren S2067000 svywgt2003
ren S3861600 svywgt2004
ren S5444200 svywgt2005
ren S7545500 svywgt2006
ren T0042100 svywgt2007
ren T2022500 svywgt2008
ren T3613300 svywgt2009
ren T5213200 svywgt2010
ren T6665000 svywgt2011
ren T8135900 svywgt2013
ren U0017100 svywgt2015
ren U1855400 svywgt2017
ren U3455500 svywgt2019

ren R1209300 interview_mo1997
ren R2568200 interview_mo1998
ren R3890100 interview_mo1999
ren R5472200 interview_mo2000
ren R7236000 interview_mo2001
ren S1550800 interview_mo2002
ren S2020700 interview_mo2003
ren S3821900 interview_mo2004
ren S5421900 interview_mo2005
ren S7524000 interview_mo2006
ren T0024400 interview_mo2007
ren T2019300 interview_mo2008
ren T3609900 interview_mo2009
ren T5210300 interview_mo2010
ren T6661300 interview_mo2011
ren T8132800 interview_mo2013
ren U0013100 interview_mo2015
ren U1850600 interview_mo2017
ren U3450100 interview_mo2019

ren R1209401 interviewM1997
ren R1209402 interviewY1997
ren R2568301 interviewM1998
ren R2568302 interviewY1998
ren R3890301 interviewM1999
ren R3890302 interviewY1999
ren R5472301 interviewM2000
ren R5472302 interviewY2000
ren R7236101 interviewM2001
ren R7236102 interviewY2001
ren S1550901 interviewM2002
ren S1550902 interviewY2002
ren S2020801 interviewM2003
ren S2020802 interviewY2003
ren S3822001 interviewM2004
ren S3822002 interviewY2004
ren S5422001 interviewM2005
ren S5422002 interviewY2005
ren S7524101 interviewM2006
ren S7524102 interviewY2006
ren T0024501 interviewM2007
ren T0024502 interviewY2007
ren T2019401 interviewM2008
ren T2019402 interviewY2008
ren T3610001 interviewM2009
ren T3610002 interviewY2009
ren T5210401 interviewM2010
ren T5210402 interviewY2010
ren T6661401 interviewM2011
ren T6661402 interviewY2011
ren T8132901 interviewM2013
ren T8132902 interviewY2013
ren U0013201 interviewM2015
ren U0013202 interviewY2015
ren U1850701 interviewM2017
ren U1850702 interviewY2017
ren U3450201 interviewM2019
ren U3450202 interviewY2019

ren R1205000 Relationship_to_Par_age12_
ren R1205100 Relationship_to_Par_age2_
ren R1205200 Relationship_to_Par_age6_
ren R1205300 Relationship_HH_head1997
ren R2563600 Relationship_HH_head1998
ren R3885200 Relationship_HH_head1999
ren R5464400 Relationship_HH_head2000
ren R7228100 Relationship_HH_head2001
ren S1542000 Relationship_HH_head2002
ren S2011800 Relationship_HH_head2003

ren R0608200 parent_height_feet
ren R0608300 parent_height_inches
ren R0608400 parent_weight
ren R0608500 bio_parent1_height_feet
ren R0608600 bio_parent1_height_inches
ren R0608700 bio_parent1_weight
ren R0608900 bio_parent2_height_feet
ren R0609000 bio_parent2_height_inches
ren R0609100 bio_parent2_weight

ren R5821400 bornUS2001
ren S0191300 bornUS2002
ren S2175900 bornUS2003
ren S3952000 bornUS2004
ren S7642200 bornUS2006
ren T0135800 bornUS2007
ren T2110700 bornUS2008
ren T3721700 bornUS2009
ren T5313500 bornUS2010
ren T6758500 bornUS2011
ren T8232600 bornUS2013
ren U0128300 bornUS2015
ren U1981300 bornUS2017

ren R9829600 ASVAB
ren R1210800 PIAT_math1997
ren R2569700 PIAT_math1998
ren R3891700 PIAT_math1999
ren R5473700 PIAT_math2000
ren R7237400 PIAT_math2001
ren S1552700 PIAT_math2002

ren R1204500 grossFamilyIncome1997
ren R2563300 grossFamilyIncome1998
ren R3884900 grossFamilyIncome1999
ren R5464100 grossFamilyIncome2000
ren R7227800 grossFamilyIncome2001
ren S1541700 grossFamilyIncome2002
ren S2011500 grossFamilyIncome2003
ren S3812400 grossFamilyIncome2004
ren S5412800 grossFamilyIncome2005
ren S7513700 grossFamilyIncome2006
ren T0014100 grossFamilyIncome2007
ren T2016200 grossFamilyIncome2008
ren T3606500 grossFamilyIncome2009
ren T5206900 grossFamilyIncome2010
ren T6656700 grossFamilyIncome2011
ren T8129100 grossFamilyIncome2013
ren U0008900 grossFamilyIncome2015
ren U1845500 grossFamilyIncome2017
ren U3444000 grossFamilyIncome2019

ren R1302400 Bio_father_highest_educ
ren R1302500 Bio_mother_highest_educ

ren R2510200 reason_noninterview1998
ren R3827700 reason_noninterview1999
ren R5341500 reason_noninterview2000
ren R7085400 reason_noninterview2001
ren S1524700 reason_noninterview2002
ren S3590300 reason_noninterview2003
ren S4966600 reason_noninterview2004
ren S6706700 reason_noninterview2005
ren S8679600 reason_noninterview2006
ren T1099500 reason_noninterview2007
ren T3176800 reason_noninterview2008
ren T4587900 reason_noninterview2009
ren T6221000 reason_noninterview2010
ren T7718200 reason_noninterview2011
ren T9118900 reason_noninterview2013
ren U1110400 reason_noninterview2015
ren U1700600 reason_noninterview2017
ren U3300300 reason_noninterview2019

ren R1217600 urbanicity_12
ren R1217610 urbanicity_12_youth

ren R2563101 Highest_Grade_Completed1998
ren R3884701 Highest_Grade_Completed1999
ren R5463901 Highest_Grade_Completed2000
ren R7227601 Highest_Grade_Completed2001
ren S1541501 Highest_Grade_Completed2002
ren S2011301 Highest_Grade_Completed2003
ren S3812201 Highest_Grade_Completed2004
ren S5412600 Highest_Grade_Completed2005
ren S7513500 Highest_Grade_Completed2006
ren T0013900 Highest_Grade_Completed2007
ren T2016000 Highest_Grade_Completed2008
ren T3606300 Highest_Grade_Completed2009
ren T5206700 Highest_Grade_Completed2010
ren T6656500 Highest_Grade_Completed2011
ren T8128900 Highest_Grade_Completed2013
ren U0008800 Highest_Grade_Completed2015
ren U1845400 Highest_Grade_Completed2017
ren U3443900 Highest_Grade_Completed2019

ren R2564001 Highest_degree_ever1998
ren R3885601 Highest_degree_ever1999
ren R5464801 Highest_degree_ever2000
ren R7228501 Highest_degree_ever2001
ren S1542401 Highest_degree_ever2002
ren S2012201 Highest_degree_ever2003
ren S3813701 Highest_degree_ever2004
ren S5413300 Highest_degree_ever2005
ren S7514200 Highest_degree_ever2006
ren T0014600 Highest_degree_ever2007
ren T2016700 Highest_degree_ever2008
ren T3607000 Highest_degree_ever2009
ren T5207400 Highest_degree_ever2010
ren T6657200 Highest_degree_ever2011
ren T8129600 Highest_degree_ever2013
ren U0009400 Highest_degree_ever2015
ren U1846000 Highest_degree_ever2017
ren U3444500 Highest_degree_ever2019

ren Z9085300 num_residences_since_age12

ren R1200300 region1997
ren R2558800 region1998
ren R3880300 region1999
ren R5459400 region2000
ren R7222400 region2001
ren S1535500 region2002
ren S2005400 region2003
ren S3805700 region2004
ren S5405600 region2005
ren S7506100 region2006
ren T0009400 region2007
ren T2012100 region2008
ren T3602100 region2009
ren T5202300 region2010
ren T6652100 region2011
ren T8123700 region2013
ren U0001900 region2015
ren U1838600 region2017
ren U3438000 region2019

ren R0322700 weight1997
ren R2164300 weight1998
ren R3482200 weight1999
ren R4880400 weight2000
ren S0905700 weight2002
ren S2978400 weight2003
ren S4677200 weight2004
ren S6309400 weight2005
ren S8330300 weight2006
ren T0738100 weight2007
ren T2780400 weight2008
ren T4494800 weight2009
ren T6141900 weight2010
ren T7635800 weight2011
ren T9039300 weight2013
ren U1028700 weight2015
ren U2962700 weight2017
ren U4368100 weight2019

ren R0322500 heightFeet1997
ren R0322600 heightInches1997
ren R2164100 heightFeet1998
ren R2164200 heightInches1998
ren R3482000 heightFeet1999
ren R3482100 heightInches1999
ren R4880200 heightFeet2000
ren R4880300 heightInches2000
ren R6497600 heightFeet2001
ren R6497700 heightInches2001
ren S0905500 heightFeet2002
ren S0905600 heightInches2002
ren S2978200 heightFeet2003
ren S2978300 heightInches2003
ren S4677000 heightFeet2004
ren S4677100 heightInches2004
ren S6309200 heightFeet2005
ren S6309300 heightInches2005
ren S8330100 heightFeet2006
ren S8330200 heightInches2006
ren T0737900 heightFeet2007
ren T0738000 heightInches2007
ren T2780200 heightFeet2008
ren T2780300 heightInches2008
ren T4494600 heightFeet2009
ren T4494700 heightInches2009
ren T6141700 heightFeet2010
ren T6141800 heightInches2010
ren T7635600 heightFeet2011
ren T7635700 heightInches2011

ren R0320600 generalHealth1997
ren R2164000 generalHealth1998
ren R3481900 generalHealth1999
ren R4880100 generalHealth2000
ren R6497500 generalHealth2001
ren S1225000 generalHealth2002
ren S3302500 generalHealth2003
ren S4919500 generalHealth2004
ren S6661100 generalHealth2005
ren S8644200 generalHealth2006
ren T1049500 generalHealth2007
ren T3144600 generalHealth2008
ren T4562200 generalHealth2009
ren T6206400 generalHealth2010
ren T7703800 generalHealth2011
ren T9093100 generalHealth2013
ren U1096500 generalHealth2015
ren U2962600 generalHealth2017
ren U4368000 generalHealth2019

ren R0358100 daysSmokedCigPastMonth1997
ren R2189500 daysSmokedCigPastMonth1998
ren R3508600 daysSmokedCigPastMonth1999
ren R4906700 daysSmokedCigPastMonth2000
ren R6534200 daysSmokedCigPastMonth2001
ren S0921700 daysSmokedCigPastMonth2002
ren S2988400 daysSmokedCigPastMonth2003
ren S4683000 daysSmokedCigPastMonth2004
ren S6318500 daysSmokedCigPastMonth2005
ren S8333500 daysSmokedCigPastMonth2006
ren T0740300 daysSmokedCigPastMonth2007
ren T2783800 daysSmokedCigPastMonth2008
ren T4495500 daysSmokedCigPastMonth2009
ren T6144400 daysSmokedCigPastMonth2010
ren T7638900 daysSmokedCigPastMonth2011
ren T9040900 daysSmokedCigPastMonth2013
ren U1031400 daysSmokedCigPastMonth2015

ren R0358500 daysDrinkAlcoholPastMonth1997
ren R2190300 daysDrinkAlcoholPastMonth1998
ren R3509400 daysDrinkAlcoholPastMonth1999
ren R4907500 daysDrinkAlcoholPastMonth2000
ren R6534800 daysDrinkAlcoholPastMonth2001
ren S0922300 daysDrinkAlcoholPastMonth2002
ren S2989000 daysDrinkAlcoholPastMonth2003
ren S4683800 daysDrinkAlcoholPastMonth2004
ren S6319400 daysDrinkAlcoholPastMonth2005
ren S8333900 daysDrinkAlcoholPastMonth2006
ren T0740700 daysDrinkAlcoholPastMonth2007
ren T2784200 daysDrinkAlcoholPastMonth2008
ren T4495900 daysDrinkAlcoholPastMonth2009
ren T6144800 daysDrinkAlcoholPastMonth2010
ren T9041300 daysDrinkAlcoholPastMonth2013
ren U1031800 daysDrinkAlcoholPastMonth2015

ren R0358600 alcoholicDrinksPerDayPastMo1997
ren R2190400 alcoholicDrinksPerDayPastMo1998
ren R3509500 alcoholicDrinksPerDayPastMo1999
ren R4907600 alcoholicDrinksPerDayPastMo2000
ren R6534900 alcoholicDrinksPerDayPastMo2001
ren S0922400 alcoholicDrinksPerDayPastMo2002
ren S2989100 alcoholicDrinksPerDayPastMo2003
ren S4683900 alcoholicDrinksPerDayPastMo2004
ren S6319500 alcoholicDrinksPerDayPastMo2005
ren S8334000 alcoholicDrinksPerDayPastMo2006
ren T0740800 alcoholicDrinksPerDayPastMo2007
ren T2784300 alcoholicDrinksPerDayPastMo2008
ren T4496000 alcoholicDrinksPerDayPastMo2009
ren T6144900 alcoholicDrinksPerDayPastMo2010
ren T9041400 alcoholicDrinksPerDayPastMo2013
ren U1031900 alcoholicDrinksPerDayPastMo2015

ren R0358900 marijuana1997
ren R2191200 marijuana1998
ren R3510300 marijuana1999
ren R4908400 marijuana2000
ren R6535600 marijuana2001
ren S0923200 marijuana2002
ren S2989700 marijuana2003
ren S4684700 marijuana2004
ren S6320300 marijuana2005
ren S8334300 marijuana2006
ren T0741100 marijuana2007
ren T2784600 marijuana2008
ren T4496300 marijuana2009
ren T6145200 marijuana2010
ren U1032200 marijuana2015

ren R0320800 daysEatBreakfast1997
ren R0320900 daysEatFruitVeg1997

ren T4562500 nutritionAwareness2009
ren T6206700 nutritionAwareness2010
ren T7704100 nutritionAwareness2011
ren U1096800 nutritionAwareness2015

ren T4562600 freqEatFastFood2009
ren T6206800 freqEatFastFood2010
ren T7704200 freqEatFastFood2011
ren U1096900 freqEatFastFood2015
ren T4562700 freqEatFastFoodTimeU2009
ren T6206900 freqEatFastFoodTimeU2010
ren T7704300 freqEatFastFoodTimeU2011
ren U1097000 freqEatFastFoodTimeU2015

ren T4562800 freqSnack2009
ren T6207000 freqSnack2010
ren T7704400 freqSnack2011
ren U1097100 freqSnack2015
ren T4562900 freqSnackTimeU2009
ren T6207100 freqSnackTimeU2010
ren T7704500 freqSnackTimeU2011
ren U1097200 freqSnackTimeU2015

ren S1226002 eatingDisorder2002
ren T1051302 eatingDisorder2007
ren T3146302 eatingDisorder2008
ren T4566502 eatingDisorder2009
ren T9094102 eatingDisorder2013

ren S1225100 timesWeekEatFruit2002
ren T1049600 timesWeekEatFruit2007
ren T3144800 timesWeekEatFruit2008
ren T4562300 timesWeekEatFruit2009
ren T6206500 timesWeekEatFruit2010
ren T7703900 timesWeekEatFruit2011
ren U1096600 timesWeekEatFruit2015

ren S1225200 timesWeekEatVeg2002
ren T1049700 timesWeekEatVeg2007
ren T3144900 timesWeekEatVeg2008
ren T4562400 timesWeekEatVeg2009
ren T6206600 timesWeekEatVeg2010
ren T7704000 timesWeekEatVeg2011
ren U1096700 timesWeekEatVeg2015

ren R0321000 daysPerWeekExercise30mins1997
ren T4564500 freqModerateExercise2009
ren T6208700 freqModerateExercise2010
ren T7706100 freqModerateExercise2011
ren U1098800 freqModerateExercise2015
ren T4565000 freqStrengthExercise2009
ren T6209200 freqStrengthExercise2010
ren T7706600 freqStrengthExercise2011
ren U1099300 freqStrengthExercise2015
ren T4564000 freqVigorousExercise2009
ren T6208200 freqVigorousExercise2010
ren T7705600 freqVigorousExercise2011
ren U1098300 freqVigorousExercise2015
ren S1225300 timesWeekExercise30mins2002
ren T1049800 timesWeekExercise30mins2007
ren T3145000 timesWeekExercise30mins2008
ren T4564700 lengthModerateExercise2009
ren T6208900 lengthModerateExercise2010
ren T7706300 lengthModerateExercise2011
ren U1099000 lengthModerateExercise2015
ren T4565200 lengthStrengthExercise2009
ren T6209400 lengthStrengthExercise2010
ren T7706800 lengthStrengthExercise2011
ren U1099500 lengthStrengthExercise2015
ren T4564200 lengthVigorousExericse2009
ren T6208400 lengthVigorousExericse2010
ren T7705800 lengthVigorousExericse2011
ren U1098500 lengthVigorousExericse2015
ren T4564600 freqModerateExerciseTimeU2009
ren T6208800 freqModerateExerciseTimeU2010
ren T7706200 freqModerateExerciseTimeU2011
ren U1098900 freqModerateExerciseTimeU2015
ren T4565100 freqStrengthExerciseTimeU2009
ren T6209300 freqStrengthExerciseTimeU2010
ren T7706700 freqStrengthExerciseTimeU2011
ren U1099400 freqStrengthExerciseTimeU2015
ren T4564100 freqVigorousExerciseTimeU2009
ren T6208300 freqVigorousExerciseTimeU2010
ren T7705700 freqVigorousExerciseTimeU2011
ren U1098400 freqVigorousExerciseTimeU2015
ren T4564800 lengthModerateExerciseTimeU2009
ren T6209000 lengthModerateExerciseTimeU2010
ren T7706400 lengthModerateExerciseTimeU2011
ren U1099100 lengthModerateExerciseTimeU2015
ren T4565300 lengthStrengthExerciseTimeU2009
ren T6209500 lengthStrengthExerciseTimeU2010
ren T7706900 lengthStrengthExerciseTimeU2011
ren U1099600 lengthStrengthExerciseTimeU2015
ren T4564300 lengthVigorousExerciseTimeU2009
ren T6208500 lengthVigorousExerciseTimeU2010
ren T7705900 lengthVigorousExerciseTimeU2011
ren U1098600 lengthVigorousExerciseTimeU2015

ren T4563200 freqDrinkSugary2009
ren T6207400 freqDrinkSugary2010
ren T7704800 freqDrinkSugary2011
ren U1097500 freqDrinkSugary2015
ren T4563300 freqDrinkSugaryTimeU2009
ren T6207500 freqDrinkSugaryTimeU2010
ren T7704900 freqDrinkSugaryTimeU2011
ren U1097600 freqDrinkSugaryTimeU2015

ren S3659000 occupation_job1_1997
ren S3659100 occupation_job2_1997
ren S3659200 occupation_job3_1997
ren S3659300 occupation_job4_1997
ren S3659400 occupation_job5_1997
ren S3659500 occupation_job6_1997
ren S3659600 occupation_job7_1997
ren S3681000 occupation_job1_1998
ren S3681100 occupation_job2_1998
ren S3681200 occupation_job3_1998
ren S3681300 occupation_job4_1998
ren S3681400 occupation_job5_1998
ren S3681500 occupation_job6_1998
ren S3681600 occupation_job7_1998
ren S3681700 occupation_job8_1998
ren S3681800 occupation_job9_1998
ren S3697000 occupation_job1_1999
ren S3697100 occupation_job2_1999
ren S3697200 occupation_job3_1999
ren S3697300 occupation_job4_1999
ren S3697400 occupation_job5_1999
ren S3697500 occupation_job6_1999
ren S3697600 occupation_job7_1999
ren S3697700 occupation_job8_1999
ren S3697800 occupation_job9_1999
ren S3713000 occupation_job1_2000
ren S3713100 occupation_job2_2000
ren S3713200 occupation_job3_2000
ren S3713300 occupation_job4_2000
ren S3713400 occupation_job5_2000
ren S3713500 occupation_job6_2000
ren S3713600 occupation_job7_2000
ren S3713700 occupation_job8_2000
ren S3713800 occupation_job9_2000
ren S3729000 occupation_job1_2001
ren S3729100 occupation_job2_2001
ren S3729200 occupation_job3_2001
ren S3729300 occupation_job4_2001
ren S3729400 occupation_job5_2001
ren S3729500 occupation_job6_2001
ren S3729600 occupation_job7_2001
ren S3729700 occupation_job8_2001
ren S1603000 occupation_job1_2002
ren S1603100 occupation_job2_2002
ren S1603200 occupation_job3_2002
ren S1603300 occupation_job4_2002
ren S1603400 occupation_job5_2002
ren S1603500 occupation_job6_2002
ren S1603600 occupation_job7_2002
ren S1603700 occupation_job8_2002
ren S1603800 occupation_job9_2002
ren S1603900 occupation_job10_2002
ren S1604000 occupation_job11_2002
ren S3757000 occupation_job1_2003
ren S3757100 occupation_job2_2003
ren S3757200 occupation_job3_2003
ren S3757300 occupation_job4_2003
ren S3757400 occupation_job5_2003
ren S3757500 occupation_job6_2003
ren S3757600 occupation_job7_2003
ren S3757700 occupation_job8_2003
ren S3757800 occupation_job9_2003
ren S3757900 occupation_job10_2003
ren S5041700 occupation_job1_2004
ren S5041800 occupation_job2_2004
ren S5041900 occupation_job3_2004
ren S5042000 occupation_job4_2004
ren S5042100 occupation_job5_2004
ren S5042200 occupation_job6_2004
ren S5042300 occupation_job7_2004
ren S6783100 occupation_job1_2005
ren S6783200 occupation_job2_2005
ren S6783300 occupation_job3_2005
ren S6783400 occupation_job4_2005
ren S6783500 occupation_job5_2005
ren S6783600 occupation_job6_2005
ren S6783700 occupation_job7_2005
ren S6783800 occupation_job8_2005
ren S6783900 occupation_job9_2005
ren S8689700 occupation_job1_2006
ren S8689800 occupation_job2_2006
ren S8689900 occupation_job3_2006
ren S8690000 occupation_job4_2006
ren S8690100 occupation_job5_2006
ren S8690200 occupation_job6_2006
ren S8690300 occupation_job7_2006
ren S8690400 occupation_job8_2006
ren S8690500 occupation_job9_2006
ren T1109400 occupation_job1_2007
ren T1109500 occupation_job2_2007
ren T1109600 occupation_job3_2007
ren T1109700 occupation_job4_2007
ren T1109800 occupation_job5_2007
ren T1109900 occupation_job6_2007
ren T1110000 occupation_job7_2007
ren T1110100 occupation_job8_2007
ren T3186900 occupation_job1_2008
ren T3187000 occupation_job2_2008
ren T3187100 occupation_job3_2008
ren T3187200 occupation_job4_2008
ren T3187300 occupation_job5_2008
ren T3187400 occupation_job6_2008
ren T3187500 occupation_job7_2008
ren T3187600 occupation_job8_2008
ren T3187700 occupation_job9_2008
ren T4597800 occupation_job1_2009
ren T4597900 occupation_job2_2009
ren T4598000 occupation_job3_2009
ren T4598100 occupation_job4_2009
ren T4598200 occupation_job5_2009
ren T4598300 occupation_job6_2009
ren T4598400 occupation_job7_2009
ren T4598500 occupation_job8_2009
ren T4598600 occupation_job9_2009
ren T6231000 occupation_job1_2010
ren T6231100 occupation_job2_2010
ren T6231200 occupation_job3_2010
ren T6231300 occupation_job4_2010
ren T6231400 occupation_job5_2010
ren T6231500 occupation_job6_2010
ren T6231600 occupation_job7_2010
ren T6231700 occupation_job8_2010
ren T6231800 occupation_job9_2010
ren T7732100 occupation_job1_2011
ren T7732200 occupation_job2_2011
ren T7732300 occupation_job3_2011
ren T7732400 occupation_job4_2011
ren T7732500 occupation_job5_2011
ren T7732600 occupation_job6_2011
ren T7732700 occupation_job7_2011
ren T7732800 occupation_job8_2011
ren T7732900 occupation_job9_2011
ren T7733000 occupation_job13_2011
ren T9133500 occupation_job1_2013
ren T9133600 occupation_job2_2013
ren T9133700 occupation_job3_2013
ren T9133800 occupation_job4_2013
ren T9133900 occupation_job5_2013
ren T9134000 occupation_job6_2013
ren T9134100 occupation_job7_2013
ren T9134200 occupation_job8_2013
ren T9134300 occupation_job9_2013
ren U1127100 occupation_job1_2015
ren U1127200 occupation_job2_2015
ren U1127300 occupation_job3_2015
ren U1127400 occupation_job4_2015
ren U1127500 occupation_job5_2015
ren U1127600 occupation_job6_2015
ren U1127700 occupation_job7_2015
ren U1127800 occupation_job8_2015
ren U1127900 occupation_job9_2015
ren U1128000 occupation_job10_2015
ren U1128100 occupation_job11_2015
ren U1128200 occupation_job12_2015
ren U1719400 occupation_job1_2017
ren U1719500 occupation_job2_2017
ren U1719600 occupation_job3_2017
ren U1719700 occupation_job4_2017
ren U1719800 occupation_job5_2017
ren U1719900 occupation_job6_2017
ren U1720000 occupation_job7_2017
ren U1720100 occupation_job8_2017
ren U1720200 occupation_job9_2017
ren U1720300 occupation_job10_2017
ren U1720400 occupation_job11_2017
ren U1720500 occupation_job12_2017
ren U1720600 occupation_job13_2017
ren U1720700 occupation_job14_2017
ren U3315700 occupation_job1_2019
ren U3315800 occupation_job2_2019
ren U3315900 occupation_job3_2019
ren U3316000 occupation_job4_2019
ren U3316100 occupation_job5_2019
ren U3316200 occupation_job6_2019
ren U3316300 occupation_job7_2019
ren U3316400 occupation_job8_2019
ren U3316500 occupation_job9_2019
ren U3316600 occupation_job10_2019
ren U3316700 occupation_job11_2019

ren S3658000 industry_job1_1997
ren S3658100 industry_job2_1997
ren S3658200 industry_job3_1997
ren S3658300 industry_job4_1997
ren S3658400 industry_job5_1997
ren S3658500 industry_job6_1997
ren S3658600 industry_job7_1997
ren S3679000 industry_job1_1998
ren S3679100 industry_job2_1998
ren S3679200 industry_job3_1998
ren S3679300 industry_job4_1998
ren S3679400 industry_job5_1998
ren S3679500 industry_job6_1998
ren S3679600 industry_job7_1998
ren S3679700 industry_job8_1998
ren S3679800 industry_job9_1998
ren S3695000 industry_job1_1999
ren S3695100 industry_job2_1999
ren S3695200 industry_job3_1999
ren S3695300 industry_job4_1999
ren S3695400 industry_job5_1999
ren S3695500 industry_job6_1999
ren S3695600 industry_job7_1999
ren S3695700 industry_job8_1999
ren S3695800 industry_job9_1999
ren S3711000 industry_job1_2000
ren S3711100 industry_job2_2000
ren S3711200 industry_job3_2000
ren S3711300 industry_job4_2000
ren S3711400 industry_job5_2000
ren S3711500 industry_job6_2000
ren S3711600 industry_job7_2000
ren S3711700 industry_job8_2000
ren S3711800 industry_job9_2000
ren S3727000 industry_job1_2001
ren S3727100 industry_job2_2001
ren S3727200 industry_job3_2001
ren S3727300 industry_job4_2001
ren S3727400 industry_job5_2001
ren S3727500 industry_job6_2001
ren S3727600 industry_job7_2001
ren S3727700 industry_job8_2001
ren S1601900 industry_job1_2002
ren S1602000 industry_job2_2002
ren S1602100 industry_job3_2002
ren S1602200 industry_job4_2002
ren S1602300 industry_job5_2002
ren S1602400 industry_job6_2002
ren S1602500 industry_job7_2002
ren S1602600 industry_job8_2002
ren S1602700 industry_job9_2002
ren S1602800 industry_job10_2002
ren S1602900 industry_job11_2002
ren S3755000 industry_job1_2003
ren S3755100 industry_job2_2003
ren S3755200 industry_job3_2003
ren S3755300 industry_job4_2003
ren S3755400 industry_job5_2003
ren S3755500 industry_job6_2003
ren S3755600 industry_job7_2003
ren S3755700 industry_job8_2003
ren S3755800 industry_job9_2003
ren S3755900 industry_job10_2003
ren S5041000 industry_job1_2004
ren S5041100 industry_job2_2004
ren S5041200 industry_job3_2004
ren S5041300 industry_job4_2004
ren S5041400 industry_job5_2004
ren S5041500 industry_job6_2004
ren S5041600 industry_job7_2004
ren S6782200 industry_job1_2005
ren S6782300 industry_job2_2005
ren S6782400 industry_job3_2005
ren S6782500 industry_job4_2005
ren S6782600 industry_job5_2005
ren S6782700 industry_job6_2005
ren S6782800 industry_job7_2005
ren S6782900 industry_job8_2005
ren S6783000 industry_job9_2005
ren S8688800 industry_job1_2006
ren S8688900 industry_job2_2006
ren S8689000 industry_job3_2006
ren S8689100 industry_job4_2006
ren S8689200 industry_job5_2006
ren S8689300 industry_job6_2006
ren S8689400 industry_job7_2006
ren S8689500 industry_job8_2006
ren S8689600 industry_job9_2006
ren T1108600 industry_job1_2007
ren T1108700 industry_job2_2007
ren T1108800 industry_job3_2007
ren T1108900 industry_job4_2007
ren T1109000 industry_job5_2007
ren T1109100 industry_job6_2007
ren T1109200 industry_job7_2007
ren T1109300 industry_job8_2007
ren T3186000 industry_job1_2008
ren T3186100 industry_job2_2008
ren T3186200 industry_job3_2008
ren T3186300 industry_job4_2008
ren T3186400 industry_job5_2008
ren T3186500 industry_job6_2008
ren T3186600 industry_job7_2008
ren T3186700 industry_job8_2008
ren T3186800 industry_job9_2008
ren T4596900 industry_job1_2009
ren T4597000 industry_job2_2009
ren T4597100 industry_job3_2009
ren T4597200 industry_job4_2009
ren T4597300 industry_job5_2009
ren T4597400 industry_job6_2009
ren T4597500 industry_job7_2009
ren T4597600 industry_job8_2009
ren T4597700 industry_job9_2009
ren T6230100 industry_job1_2010
ren T6230200 industry_job2_2010
ren T6230300 industry_job3_2010
ren T6230400 industry_job4_2010
ren T6230500 industry_job5_2010
ren T6230600 industry_job6_2010
ren T6230700 industry_job7_2010
ren T6230800 industry_job8_2010
ren T6230900 industry_job9_2010
ren T7731100 industry_job1_2011
ren T7731200 industry_job2_2011
ren T7731300 industry_job3_2011
ren T7731400 industry_job4_2011
ren T7731500 industry_job5_2011
ren T7731600 industry_job6_2011
ren T7731700 industry_job7_2011
ren T7731800 industry_job8_2011
ren T7731900 industry_job9_2011
ren T7732000 industry_job13_2011
ren T9132600 industry_job1_2013
ren T9132700 industry_job2_2013
ren T9132800 industry_job3_2013
ren T9132900 industry_job4_2013
ren T9133000 industry_job5_2013
ren T9133100 industry_job6_2013
ren T9133200 industry_job7_2013
ren T9133300 industry_job8_2013
ren T9133400 industry_job9_2013
ren U1125900 industry_job1_2015
ren U1126000 industry_job2_2015
ren U1126100 industry_job3_2015
ren U1126200 industry_job4_2015
ren U1126300 industry_job5_2015
ren U1126400 industry_job6_2015
ren U1126500 industry_job7_2015
ren U1126600 industry_job8_2015
ren U1126700 industry_job9_2015
ren U1126800 industry_job10_2015
ren U1126900 industry_job11_2015
ren U1127000 industry_job12_2015
ren U1718000 industry_job1_2017
ren U1718100 industry_job2_2017
ren U1718200 industry_job3_2017
ren U1718300 industry_job4_2017
ren U1718400 industry_job5_2017
ren U1718500 industry_job6_2017
ren U1718600 industry_job7_2017
ren U1718700 industry_job8_2017
ren U1718800 industry_job9_2017
ren U1718900 industry_job10_2017
ren U1719000 industry_job11_2017
ren U1719100 industry_job12_2017
ren U1719200 industry_job13_2017
ren U1719300 industry_job14_2017
ren U3314600 industry_job1_2019
ren U3314700 industry_job2_2019
ren U3314800 industry_job3_2019
ren U3314900 industry_job4_2019
ren U3315000 industry_job5_2019
ren U3315100 industry_job6_2019
ren U3315200 industry_job7_2019
ren U3315300 industry_job8_2019
ren U3315400 industry_job9_2019
ren U3315500 industry_job10_2019
ren U3315600 industry_job11_2019

ren R1208502 Main_job1997
ren R2567202 Main_job1998
ren R3888902 Main_job1999
ren R5471002 Main_job2000
ren R7234902 Main_job2001
ren S1549402 Main_job2002
ren S2019402 Main_job2003
ren S3820902 Main_job2004
ren S5421002 Main_job2005
ren S7523101 Main_job2006
ren T0023601 Main_job2007
ren T2009700 Main_job2008
ren T3600000 Main_job2009
ren T5200000 Main_job2010
ren T6650000 Main_job2011
ren T8122000 Main_job2013
ren U0000100 Main_job2015
ren U1836700 Main_job2017
ren U3436200 Main_job2019

ren R1207800 Hrly_comp_job1_1997
ren R1207900 Hrly_comp_job2_1997
ren R1208000 Hrly_comp_job3_1997
ren R1208100 Hrly_comp_job4_1997
ren R1208200 Hrly_comp_job5_1997
ren R1208300 Hrly_comp_job6_1997
ren R1208400 Hrly_comp_job7_1997
ren R2566300 Hrly_comp_job1_1998
ren R2566400 Hrly_comp_job2_1998
ren R2566500 Hrly_comp_job3_1998
ren R2566600 Hrly_comp_job4_1998
ren R2566700 Hrly_comp_job5_1998
ren R2566800 Hrly_comp_job6_1998
ren R2566900 Hrly_comp_job7_1998
ren R2567000 Hrly_comp_job8_1998
ren R2567100 Hrly_comp_job9_1998
ren R3888000 Hrly_comp_job1_1999
ren R3888100 Hrly_comp_job2_1999
ren R3888200 Hrly_comp_job3_1999
ren R3888300 Hrly_comp_job4_1999
ren R3888400 Hrly_comp_job5_1999
ren R3888500 Hrly_comp_job6_1999
ren R3888600 Hrly_comp_job7_1999
ren R3888700 Hrly_comp_job8_1999
ren R3888800 Hrly_comp_job9_1999
ren R5470100 Hrly_comp_job1_2000
ren R5470200 Hrly_comp_job2_2000
ren R5470300 Hrly_comp_job3_2000
ren R5470400 Hrly_comp_job4_2000
ren R5470500 Hrly_comp_job5_2000
ren R5470600 Hrly_comp_job6_2000
ren R5470700 Hrly_comp_job7_2000
ren R5470800 Hrly_comp_job8_2000
ren R5470900 Hrly_comp_job9_2000
ren R7234100 Hrly_comp_job1_2001
ren R7234200 Hrly_comp_job2_2001
ren R7234300 Hrly_comp_job3_2001
ren R7234400 Hrly_comp_job4_2001
ren R7234500 Hrly_comp_job5_2001
ren R7234600 Hrly_comp_job6_2001
ren R7234700 Hrly_comp_job7_2001
ren R7234800 Hrly_comp_job8_2001
ren S1548300 Hrly_comp_job1_2002
ren S1548400 Hrly_comp_job2_2002
ren S1548500 Hrly_comp_job3_2002
ren S1548600 Hrly_comp_job4_2002
ren S1548700 Hrly_comp_job5_2002
ren S1548800 Hrly_comp_job6_2002
ren S1548900 Hrly_comp_job7_2002
ren S1549000 Hrly_comp_job8_2002
ren S1549100 Hrly_comp_job9_2002
ren S1549200 Hrly_comp_job10_2002
ren S1549300 Hrly_comp_job11_2002
ren S2018400 Hrly_comp_job1_2003
ren S2018500 Hrly_comp_job2_2003
ren S2018600 Hrly_comp_job3_2003
ren S2018700 Hrly_comp_job4_2003
ren S2018800 Hrly_comp_job5_2003
ren S2018900 Hrly_comp_job6_2003
ren S2019000 Hrly_comp_job7_2003
ren S2019100 Hrly_comp_job8_2003
ren S2019200 Hrly_comp_job9_2003
ren S2019300 Hrly_comp_job10_2003
ren S3820200 Hrly_comp_job1_2004
ren S3820300 Hrly_comp_job2_2004
ren S3820400 Hrly_comp_job3_2004
ren S3820500 Hrly_comp_job4_2004
ren S3820600 Hrly_comp_job5_2004
ren S3820700 Hrly_comp_job6_2004
ren S3820800 Hrly_comp_job7_2004
ren S5420100 Hrly_comp_job1_2005
ren S5420200 Hrly_comp_job2_2005
ren S5420300 Hrly_comp_job3_2005
ren S5420400 Hrly_comp_job4_2005
ren S5420500 Hrly_comp_job5_2005
ren S5420600 Hrly_comp_job6_2005
ren S5420700 Hrly_comp_job7_2005
ren S5420800 Hrly_comp_job8_2005
ren S5420900 Hrly_comp_job9_2005
ren S7521300 Hrly_comp_job1_2006
ren S7521400 Hrly_comp_job2_2006
ren S7521500 Hrly_comp_job3_2006
ren S7521600 Hrly_comp_job4_2006
ren S7521700 Hrly_comp_job5_2006
ren S7521800 Hrly_comp_job6_2006
ren S7521900 Hrly_comp_job7_2006
ren S7522000 Hrly_comp_job8_2006
ren S7522100 Hrly_comp_job9_2006
ren T0022000 Hrly_comp_job1_2007
ren T0022100 Hrly_comp_job2_2007
ren T0022200 Hrly_comp_job3_2007
ren T0022300 Hrly_comp_job4_2007
ren T0022400 Hrly_comp_job5_2007
ren T0022500 Hrly_comp_job6_2007
ren T0022600 Hrly_comp_job7_2007
ren T0022700 Hrly_comp_job8_2007
ren T2016900 Hrly_comp_job1_2008
ren T2017000 Hrly_comp_job2_2008
ren T2017100 Hrly_comp_job3_2008
ren T2017200 Hrly_comp_job4_2008
ren T2017300 Hrly_comp_job5_2008
ren T2017400 Hrly_comp_job6_2008
ren T2017500 Hrly_comp_job7_2008
ren T2017600 Hrly_comp_job8_2008
ren T3607200 Hrly_comp_job1_2009
ren T3607300 Hrly_comp_job2_2009
ren T3607400 Hrly_comp_job3_2009
ren T3607500 Hrly_comp_job4_2009
ren T3607600 Hrly_comp_job5_2009
ren T3607700 Hrly_comp_job6_2009
ren T3607800 Hrly_comp_job7_2009
ren T3607900 Hrly_comp_job8_2009
ren T3608000 Hrly_comp_job9_2009
ren T5207600 Hrly_comp_job1_2010
ren T5207700 Hrly_comp_job2_2010
ren T5207800 Hrly_comp_job3_2010
ren T5207900 Hrly_comp_job4_2010
ren T5208000 Hrly_comp_job5_2010
ren T5208100 Hrly_comp_job6_2010
ren T5208200 Hrly_comp_job7_2010
ren T5208300 Hrly_comp_job8_2010
ren T5208400 Hrly_comp_job9_2010
ren T6657400 Hrly_comp_job1_2011
ren T6657500 Hrly_comp_job2_2011
ren T6657600 Hrly_comp_job3_2011
ren T6657700 Hrly_comp_job4_2011
ren T6657800 Hrly_comp_job5_2011
ren T6657900 Hrly_comp_job6_2011
ren T6658000 Hrly_comp_job7_2011
ren T6658100 Hrly_comp_job8_2011
ren T6658200 Hrly_comp_job9_2011
ren T6658300 Hrly_comp_job10_2011
ren T6658400 Hrly_comp_job11_2011
ren T6658500 Hrly_comp_job12_2011
ren T6658600 Hrly_comp_job13_2011
ren T8129800 Hrly_comp_job1_2013
ren T8129900 Hrly_comp_job2_2013
ren T8130000 Hrly_comp_job3_2013
ren T8130100 Hrly_comp_job4_2013
ren T8130200 Hrly_comp_job5_2013
ren T8130300 Hrly_comp_job6_2013
ren T8130400 Hrly_comp_job7_2013
ren T8130500 Hrly_comp_job8_2013
ren T8130600 Hrly_comp_job9_2013
ren T8130700 Hrly_comp_job10_2013
ren U0009500 Hrly_comp_job1_2015
ren U0009600 Hrly_comp_job2_2015
ren U0009700 Hrly_comp_job3_2015
ren U0009800 Hrly_comp_job4_2015
ren U0009900 Hrly_comp_job5_2015
ren U0010000 Hrly_comp_job6_2015
ren U0010100 Hrly_comp_job7_2015
ren U0010200 Hrly_comp_job8_2015
ren U0010300 Hrly_comp_job9_2015
ren U0010400 Hrly_comp_job10_2015
ren U0010500 Hrly_comp_job11_2015
ren U0010600 Hrly_comp_job12_2015
ren U1846100 Hrly_comp_job1_2017
ren U1846200 Hrly_comp_job2_2017
ren U1846300 Hrly_comp_job3_2017
ren U1846400 Hrly_comp_job4_2017
ren U1846500 Hrly_comp_job5_2017
ren U1846600 Hrly_comp_job6_2017
ren U1846700 Hrly_comp_job7_2017
ren U1846800 Hrly_comp_job8_2017
ren U1846900 Hrly_comp_job9_2017
ren U1847000 Hrly_comp_job10_2017
ren U1847100 Hrly_comp_job11_2017
ren U1847200 Hrly_comp_job12_2017
ren U1847300 Hrly_comp_job13_2017
ren U1847400 Hrly_comp_job14_2017
ren U1847500 Hrly_comp_job15_2017
ren U3444600 Hrly_comp_job1_2019
ren U3444700 Hrly_comp_job2_2019
ren U3444800 Hrly_comp_job3_2019
ren U3444900 Hrly_comp_job4_2019
ren U3445000 Hrly_comp_job5_2019
ren U3445100 Hrly_comp_job6_2019
ren U3445200 Hrly_comp_job7_2019
ren U3445300 Hrly_comp_job8_2019
ren U3445400 Hrly_comp_job9_2019
ren U3445500 Hrly_comp_job10_2019
ren U3445600 Hrly_comp_job11_2019



***************************************************
* Reshape and recode certain variables.
***************************************************
* consolidate "height (in feet)" and "height (in inches)" into one variable:
forvalues y=1997/2011 {
    gen height`y' = heightFeet`y'*12+heightInches`y' if heightFeet`y'>0
    drop heightFeet`y' heightInches`y'
}

forvalues yr=1990/2011 {
    gen temp`yr'=0
}
forvalues yr=2013(2)2019 {
    gen temp`yr'=0
}
reshape long temp Highest_Grade_Completed Highest_degree_ever grossFamilyIncome reason_noninterview region bornUS weight height generalHealth daysSmokedCigPastMonth daysDrinkAlcoholPastMonth marijuana alcoholicDrinksPerDayPastMo nutritionAwareness freqEatFastFood freqEatFastFoodTimeU freqSnack freqSnackTimeU eatingDisorder timesWeekEatFruit timesWeekEatVeg freqDrinkSugary freqDrinkSugaryTimeU freqModerateExercise freqModerateExerciseTimeU freqStrengthExercise freqStrengthExerciseTimeU freqVigorousExercise freqVigorousExerciseTimeU lengthModerateExercise lengthModerateExerciseTimeU lengthStrengthExercise lengthStrengthExerciseTimeU lengthVigorousExericse lengthVigorousExerciseTimeU timesWeekExercise30mins svywgt interview_mo interviewM interviewY Relationship_HH_head PIAT_math Hrly_comp_job1_ Hrly_comp_job2_ Hrly_comp_job3_ Hrly_comp_job4_ Hrly_comp_job5_ Hrly_comp_job6_ Hrly_comp_job7_ Hrly_comp_job8_ Hrly_comp_job9_ Hrly_comp_job10_ Hrly_comp_job11_ Hrly_comp_job12_ Hrly_comp_job13_ Hrly_comp_job14_ industry_job1_ industry_job2_ industry_job3_ industry_job4_ industry_job5_ industry_job6_ industry_job7_ industry_job8_ industry_job9_ industry_job10_ industry_job11_ industry_job12_ industry_job13_ industry_job14_ occupation_job1_ occupation_job2_ occupation_job3_ occupation_job4_ occupation_job5_ occupation_job6_ occupation_job7_ occupation_job8_ occupation_job9_ occupation_job10_ occupation_job11_ occupation_job12_ occupation_job13_ occupation_job14_ Main_job, i(id) j(year)
drop temp
drop if id==.

recode _all (-1 = .r) (-2 = .d) (-3 = .i) (-4 = .v) (-5 = .n)

***************************************************
* Label variables and values
***************************************************

label var id                          "ID"
label var year                        "YEAR"
label var sex                         "SEX"
label var birth_month                 "BIRTH MONTH"
label var birth_year                  "BIRTH YEAR"
label var Relationship_to_Par_age12_  "RELATIONSHIP TO PARENTS AT AGE 12"
label var Relationship_to_Par_age2_   "RELATIONSHIP TO PARENTS AT AGE 2"
label var Relationship_to_Par_age6_   "RELATIONSHIP TO PARENTS AT AGE 6"
label var Sample_type                 "SAMPLE TYPE (CROSS-SECTIONAL OR OVERSAMPLE)"
label var Bio_father_highest_educ     "FATHER'S EDUCATION"
label var Bio_mother_highest_educ     "MOTHER'S EDUCATION"
label var race_ethnicity              "RACE/ETHNICITY"
label var ASVAB                       "ASVAB MATH/VERBAL SCORE PERCENTILE"
label var svywgt                      "CUMULATIVE-CASES WEIGHTS"
label var interview_mo                "INTERVIEW MONTH (CONTINUOUS MONTH FORMAT)"
label var interviewM                  "INTERVIEW MONTH (CALENDAR FORMAT)"
label var interviewY                  "INTERVIEW YEAR (CALENDAR FORMAT)"
label var Relationship_HH_head        "RELATIONSHIP TO HOUSEHOLD HEAD"
label var bornUS                      "BORN IN THE US"
label var PIAT_math                   "PIAT MATH SCORE"
label var grossFamilyIncome           "FAMILY INCOME"
label var reason_noninterview         "REASON FOR NON-INTERVIEW"
label var Highest_Grade_Completed     "HIGHEST GRADE COMPLETED"
label var Highest_degree_ever         "HIGHEST DEGREE EVER COMPLETED"
label var generalHealth               "HOW IS R'S GENERAL HEALTH?"

label define vl_race   1 "Black"  2 "Hispanic"  3 "Mixed Race (Non-Hispanic)"  4 "Non-Black / Non-Hispanic"
label values race_ethnicity vl_race

label define vl_sex   1 "Male"  2 "Female"  0 "No Information"
label values sex vl_sex

label define vl_relPar 1 "Both biological parents"  2 "Biological mother, other parent present"  3 "Biological father, other parent present"  4 "Biological mother, marital status unknown"  5 "Biological dad, marital status unknown"  6 "Adoptive parent(s)"  7 "Foster parent(s)"  8 "Other adults, biologial parent status unknown, not group quarters"  9 "Group quarters"  10 "Anything else"
label define vl_relHH  1 "Both biological parents"  2 "Two parents, biological mother"  3 "Two parents, biological father"  4 "Biological mother only"  5 "Biological father only"  6 "Adoptive parent(s)"  7 "Foster parent(s)"  8 "No parents, grandparents"  9 "No parents, other relatives"  10 "Anything else"
label values Relationship_to_Par_age12_ vl_relPar
label values Relationship_to_Par_age2_  vl_relPar
label values Relationship_to_Par_age6_  vl_relPar
label values Relationship_HH_head       vl_relHH

label define vl_sample  1 "Cross-sectional"  0 "Oversample"
label values Sample_type vl_sample

label define vl_int  60 "Completed in person"  61 "Completed by phone"  62 "Comp in person/conv"  63 "Comp by phone/conv"  64 "Compy by proxy parent/R disabled"  65 "Comp by proxy nonparent/R disabled"  66 "Comp in person/incarcerated"  67 "Comp by phone/incarcerated"  80 "Prior deceased blocked"  89 "NIR blocked"  90 "Final unlocatable"  91 "Very hostile refusal"  92 "Gatekeeper Refusal"  93 "R - inaccessible"  94 "Respondent too ill/handicapped"  95 "Respondent unavailable entire field period"  96 "Refusal"  97 "Hostile refusal"  98 "Deceased"  99 "Other"
label values reason_noninterview vl_int

label define vl_origin 1 "YES"  0 "NO"
label values bornUS vl_origin

label define vl_HGC  0 "None"  1 "1st grade"  2 "2nd grade"  3 "3rd grade"  4 "4th grade"  5 "5th grade"  6 "6th grade"  7 "7th grade"  8 "8th grade"  9 "9th grade"  10 "10th grade"  11 "11th grade"  12 "12th grade"  13 "1st year college"  14 "2nd year college"  15 "3rd year college"  16 "4th year college"  17 "5th year college"  18 "6th year college"  19 "7th year college"  20 "8th year college or more"  95 "Ungraded"
label values Highest_Grade_Completed vl_HGC

label define vl_HDC 0 "None"  1 "GED"  2 "High school diploma (Regular 12 year program)"  3 "Associate/Junior college (AA)"  4 "Bachelor's degree (BA, BS)"  5 "Master's degree (MA, MS)"  6 "PhD"  7 "Professional degree (DDS, JD, MD)"
label values Highest_degree_ever     vl_HDC

label define vl_gh 1 "Excellent" 2 "Very good" 3 "Good" 4 "Fair" 5 "Poor"
label values generalHealth vl_gh

label define vl_nutrition 0 "Don't buy food" 1 "Always" 2 "Often" 3 "Sometimes" 4 "Rarely" 5 "Never"
label values nutritionAwareness vl_nutrition

label define vl_eat_timeunit 1 "Per Day" 2 "Per Week"
label values freqEatFastFoodTimeU vl_eat_timeunit
label values freqSnackTimeU vl_eat_timeunit
label values freqDrinkSugaryTimeU vl_eat_timeunit

label define vl_xc_timeunit 1 "Per Day" 2 "Per Week" 3 "Per Month" 4 "Per Year"
label values freqModerateExerciseTimeU vl_xc_timeunit
label values freqStrengthExerciseTimeU vl_xc_timeunit
label values freqVigorousExerciseTimeU vl_xc_timeunit

label define vl_lxc_timeunit 1 "Minutes" 2 "Hours"
label values lengthModerateExerciseTimeU vl_lxc_timeunit
label values lengthStrengthExerciseTimeU vl_lxc_timeunit
label values lengthVigorousExerciseTimeU vl_lxc_timeunit

order id year race_ethnicity sex
