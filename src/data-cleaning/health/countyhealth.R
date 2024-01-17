library(readxl)
library(tidyverse)
library(magrittr)


###############################################################################
# Import spreadsheets and drop unnecessary/repetitive columns
###############################################################################

# 2010
data2010 <- read_excel("../../../data/health/raw/year2010.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3141, col_names = TRUE)
cols_to_remove_2010 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "PCP No", "PCP Rate")
data2010 %<>% select(-which(sapply(names(data2010), function(x) any(sapply(cols_to_remove_2010, function(y) grepl(y, x))))))
data2010 %<>% mutate(`% Physically Inactive` = NA_real_)

# 2011
data2011 <- read_excel("../../../data/health/raw/year2011.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3141, col_names = TRUE)
cols_to_remove_2011 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "PCP No", "PCP Rate")
data2011 %<>% select(-which(sapply(names(data2011), function(x) any(sapply(cols_to_remove_2011, function(y) grepl(y, x))))))
data2011 %<>% mutate(`% Physically Inactive` = NA_real_)

# 2012
data2012 <- read_excel("../../../data/health/raw/year2012.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3141, col_names = TRUE)
cols_to_remove_2012 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# PCP", "PCP Ratio", "PCP Rate")
data2012 %<>% select(-which(sapply(names(data2012), function(x) any(sapply(cols_to_remove_2012, function(y) grepl(y, x))))))

# 2013
data2013 <- read_excel("../../../data/health/raw/year2013.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3192, col_names = TRUE)
cols_to_remove_2013 <- c("95% CI", "Z", "Sample Size", "# Dentists", "Dentist Ratio", "Dentist Rate")
data2013 %<>% select(-which(sapply(names(data2013), function(x) any(sapply(cols_to_remove_2013, function(y) grepl(y, x))))))
data2013 %<>% drop_na(County)

# 2014
data2014 <- read_excel("../../../data/health/raw/year2014.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3141, col_names = TRUE)
cols_to_remove_2014 <- c("95% CI", "Quartile", "Sample Size", "# Dentists", "Dentist Ratio", "Dentist Rate", "MHP Rate", "MHP Ratio")
data2014 %<>% select(-which(sapply(names(data2014), function(x) any(sapply(cols_to_remove_2014, function(y) grepl(y, x))))))

# 2015
data2015 <- read_excel("../../../data/health/raw/year2015.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3141, col_names = TRUE)
cols_to_remove_2015 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# Medicare Enrollees", "# Mental Health Providers", "MHP Rate", "MHP Ratio")
data2015 %<>% select(-which(sapply(names(data2015), function(x) any(sapply(cols_to_remove_2015, function(y) grepl(y, x))))))
data2015 %<>% mutate(Deaths = NA_real_)

# 2016
data2016 <- read_excel("../../../data/health/raw/year2016.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3141, col_names = TRUE)
cols_to_remove_2016 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# Medicare Enrollees", "# Mental Health Providers", "MHP Rate", "MHP Ratio")
data2016 %<>% select(-which(sapply(names(data2016), function(x) any(sapply(cols_to_remove_2016, function(y) grepl(y, x))))))
data2016 %<>% mutate(Deaths = NA_real_)

# 2017
data2017 <- read_excel("../../../data/health/raw/year2017.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3136, col_names = TRUE)
cols_to_remove_2017 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# Medicare Enrollees", "(Black)", "(Hispanic)", "(White)", "(white)")
data2017 %<>% select(-which(sapply(names(data2017), function(x) any(sapply(cols_to_remove_2017, function(y) grepl(y, x))))))
data2017 %<>% mutate(Deaths = NA_real_)

# 2018
data2018 <- read_excel("../../../data/health/raw/year2018.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3142, col_names = TRUE)
cols_to_remove_2018 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# Medicare Enrollees", "Error Flag", "Cohort Size", "(Black)", "(Hispanic)", "(White)", "(white)")
data2018 %<>% select(-which(sapply(names(data2018), function(x) any(sapply(cols_to_remove_2018, function(y) grepl(y, x))))))
data2018 %<>% mutate(Deaths = NA_real_)

# 2019
data2019 <- read_excel("../../../data/health/raw/year2019.xls", sheet = "Ranked Measure Data", skip = 1, n_max = 3142, col_names = TRUE)
cols_to_remove_2019 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# PCP", "PCP Ratio", "PCP Rate", "(Black)", "(Hispanic)", "(White)", "(white)")
data2019 %<>% select(-which(sapply(names(data2019), function(x) any(sapply(cols_to_remove_2019, function(y) grepl(y, x))))))
data2019 %<>% mutate(Deaths = NA_real_)

# 2020
data2020 <- read_excel("../../../data/health/raw/year2020.xlsx", sheet = "Ranked Measure Data", skip = 1, n_max = 3193, col_names = TRUE)
cols_to_remove_2020 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# PCP", "PCP Ratio", "PCP Rate", "(Black)", "(Hispanic)", "(White)", "(white)", "(AIAN)", "(Asian)")
data2020 %<>% select(-which(sapply(names(data2020), function(x) any(sapply(cols_to_remove_2020, function(y) grepl(y, x))))))
data2020 %<>% drop_na(County)

# 2021
data2021 <- read_excel("../../../data/health/raw/year2021.xlsx", sheet = "Ranked Measure Data", skip = 1, n_max = 3193, col_names = TRUE)
cols_to_remove_2021 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# PCP", "PCP Ratio", "PCP Rate", "(Black)", "(Hispanic)", "(White)", "(white)", "(AIAN)", "(Asian)")
data2021 %<>% select(-which(sapply(names(data2021), function(x) any(sapply(cols_to_remove_2021, function(y) grepl(y, x))))))
data2021 %<>% drop_na(County)

# 2022
data2022 <- read_excel("../../../data/health/raw/year2022.xlsx", sheet = "Ranked Measure Data", skip = 1, n_max = 3193, col_names = TRUE)
cols_to_remove_2022 <- c("Unreliable", "Aggregate Population", "95% CI", "Quartile", "Sample Size", "Population", "# PCP", "PCP Ratio", "PCP Rate", "(Black)", "(Hispanic)", "(White)", "(white)", "(AIAN)", "(Asian)")
data2022 %<>% select(-which(sapply(names(data2022), function(x) any(sapply(cols_to_remove_2022, function(y) grepl(y, x))))))
data2022 %<>% drop_na(County)


###############################################################################
# Harmonize Variable Names Across Years
###############################################################################
names(data2010) %>% print
names(data2011) %>% print
names(data2012) %>% print
names(data2013) %>% print
names(data2014) %>% print
names(data2015) %>% print
names(data2016) %>% print
names(data2017) %>% print
names(data2018) %>% print
names(data2019) %>% print
names(data2020) %>% print
names(data2021) %>% print
names(data2022) %>% print
d2010 <- data2010 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Binge Drinking"    ,fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "YPLL Rate"                        ,unemp_rate = "% unemployed"                                                                          ,viol_crime_rate = "Violent Crime Rate")
d2011 <- data2011 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "YPLL Rate"                        ,unemp_rate = "% unemployed"                                                                          ,viol_crime_rate = "Violent Crime Rate")
d2012 <- data2012 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "YPLL Rate"                        ,unemp_rate = "% Unemployed"                                                                          ,viol_crime_rate = "Violent Crime Rate")
d2013 <- data2013 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "YPLL Rate"                        ,unemp_rate = "% Unemployed", pm2_5 = "Average daily PM25"                                            ,viol_crime_rate = "Violent Crime Rate")
d2014 <- data2014 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "YPLL Rate"                        ,unemp_rate = "% Unemployed", pm2_5 = "Average daily PM25"                                            ,viol_crime_rate = "Violent Crime Rate")
d2015 <- data2015 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "Years of Potential Life Lost Rate",unemp_rate = "% Unemployed", pm2_5 = "Average Daily PM2.5"                                           ,viol_crime_rate = "Violent Crime Rate")
d2016 <- data2016 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "Years of Potential Life Lost Rate",unemp_rate = "% Unemployed", pm2_5 = "Average Daily PM2.5",water_viol = "Presence of violation"      ,viol_crime_rate = "Violent Crime Rate")
d2017 <- data2017 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "Years of Potential Life Lost Rate",unemp_rate = "% Unemployed", pm2_5 = "Average Daily PM2.5",water_viol = "Presence of violation"      ,viol_crime_rate = "Violent Crime Rate")
d2018 <- data2018 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "Years of Potential Life Lost Rate",unemp_rate = "% Unemployed", pm2_5 = "Average Daily PM2.5",water_viol = "Presence of violation"      ,viol_crime_rate = "Violent Crime Rate")
d2019 <- data2019 %>% select(FIPS,State,County,obesity_rate = "% Obese"              ,smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair/Poor"          ,phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Physically Unhealthy Days"                  ,ment_unhlth_days = "Mentally Unhealthy Days"                  ,lbw_rate = "% LBW",            teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "Years of Potential Life Lost Rate",unemp_rate = "% Unemployed", pm2_5 = "Average Daily PM2.5",water_viol = "Presence of violation"      ,viol_crime_rate = "Violent Crime Rate")
d2020 <- data2020 %>% select(FIPS,State,County,obesity_rate = "% Adults with Obesity",smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair or Poor Health",phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Average Number of Physically Unhealthy Days",ment_unhlth_days = "Average Number of Mentally Unhealthy Days",lbw_rate = "% Low Birthweight",teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "Years of Potential Life Lost Rate",unemp_rate = "% Unemployed", pm2_5 = "Average Daily PM2.5",water_viol = "Presence of Water Violation",viol_crime_rate = "Violent Crime Rate")
d2021 <- data2021 %>% select(FIPS,State,County,obesity_rate = "% Adults with Obesity",smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair or Poor Health",phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Average Number of Physically Unhealthy Days",ment_unhlth_days = "Average Number of Mentally Unhealthy Days",lbw_rate = "% Low birthweight",teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "Years of Potential Life Lost Rate",unemp_rate = "% Unemployed", pm2_5 = "Average Daily PM2.5",water_viol = "Presence of Water Violation",viol_crime_rate = "Violent Crime Rate")
d2022 <- data2022 %>% select(FIPS,State,County,obesity_rate = "% Adults with Obesity",smoker_rate = "% Smokers",hvy_drink_rate = "% Excessive Drinking",fair_poor_hlth_rate = "% Fair or Poor Health",phys_inact_rate = "% Physically Inactive",phys_unhlth_days = "Average Number of Physically Unhealthy Days",ment_unhlth_days = "Average Number of Mentally Unhealthy Days",lbw_rate = "% Low birthweight",teen_birth_rate = "Teen Birth Rate",deaths = "Deaths",child_pov_rate = "% Children in Poverty",ypll_rate = "Years of Potential Life Lost Rate",unemp_rate = "% Unemployed", pm2_5 = "Average Daily PM2.5",water_viol = "Presence of Water Violation",viol_crime_rate = "Violent Crime Rate")
names(d2010) %>% print
names(d2011) %>% print
names(d2012) %>% print
names(d2013) %>% print
names(d2014) %>% print
names(d2015) %>% print
names(d2016) %>% print
names(d2017) %>% print
names(d2018) %>% print
names(d2019) %>% print
names(d2020) %>% print
names(d2021) %>% print
names(d2022) %>% print
# create an empty data frame to store the results
df_names <- tibble()

# loop through the years
for (year in 2010:2022) {
    # create the name of the dataset
    d_name <- paste0("data", year)

    # load the dataset and get names
    temp <- get(d_name)
    varnames <- names(temp)

    # add a column indicating the year
    temper <- tibble(year = year, variable = varnames)

    # append the dataset to the final data frame
    df_names <- bind_rows(df_names, temper)
}
class(df_names$variable) %>% print
#write_csv(df_names,"../../../data/health/cleaned/health_names.csv")


###############################################################################
# Append All Data Frames Together
###############################################################################

# create an empty data frame to store the results
df_final <- tibble()

# loop through the years
for (year in 2010:2022) {
    # create the name of the dataset
    d_name <- paste0("d", year)

    # load the dataset
    dataset <- get(d_name)

    # add a column indicating the year
    dataset$year <- year

    # append the dataset to the final data frame
    df_final <- bind_rows(df_final, dataset)
}
df_final %<>% relocate(FIPS,County,State,year)
#df_final %>% print
df_final %>% summarize_all(list(~ sum(is.na(.)), ~ mean(is.na(.)))) %>% print
#df_final %>% summarize_all(list(~ sum(is.na(.)), ~ mean(is.na(.)))) %>% write_csv("../../../data/health/cleaned/health_missings.csv")

###############################################################################
# Export to CSV and Save in Cleaned Folder
###############################################################################
write_csv(df_final,"../../../data/health/cleaned/health.csv")

