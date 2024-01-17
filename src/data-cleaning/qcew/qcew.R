library(tidyverse)
library(magrittr)

# List of file names (1975-1989(
start_year <- 1975
end_year <- 1989
files <- paste0("../../../data/qcew/raw/", start_year:end_year, ".annual 10 Total, all industries.csv")

# Load each file into a list of data frames and mutate the industry_code column to be a character
df_list <- files %>% 
           purrr::map(~readr::read_csv(.x, col_select = c("area_fips", "own_code", "industry_code", "agglvl_code", "size_code", "year", "qtr", "area_title", "own_title", "industry_title", "size_title", "annual_avg_emplvl", "total_annual_wages", "avg_annual_pay"))) %>% 
           purrr::map(~ .x %>% mutate(industry_code = as.character(industry_code))) %>%
           purrr::map(~ .x %>% mutate(industry_code = str_replace_all(industry_code, "-.*", ""))) %>%
           purrr::map(~ .x %>% mutate(industry_code = as.numeric(industry_code))) %>%
           purrr::map(~ .x %>% filter(own_code==5)) %>%  # all covered enterprises
           purrr::map(~ .x %>% filter(size_code==0)) %>% # all establishment sizes
           purrr::map(~ .x %>% filter(industry_code<100 & industry_code>=10)) %>% # only 2-digit industries
           purrr::map(~ .x %>% filter(agglvl_code>=70))  # counties only

# Bind rows of each data frame together
fils0 <- bind_rows(df_list)
write_csv(fils0,"../../../data/qcew/cleaned/employment_big_1975_1989.csv")


# List of directory names (1990 and onward)
start_year <- 1990
end_year <- 2021
directories <- paste0("../../../data/qcew/raw/", start_year:end_year, ".annual.by_industry/")

# List of file names in each directory
files_list <- purrr::map(
                         directories, 
                         function(dir) {
                           list.files(path = dir, pattern = "*.csv", full.names = TRUE)
                         }
                        )

# Flatten the list of file names
files <- flatten(files_list)

# Load each file into a list of data frames and mutate the industry_code column to be a character
df_list <- files %>% 
           purrr::map(~readr::read_csv(.x, col_select = c("area_fips", "own_code", "industry_code", "agglvl_code", "size_code", "year", "qtr", "area_title", "own_title", "industry_title", "size_title", "annual_avg_emplvl", "total_annual_wages", "avg_annual_pay"))) %>% 
           purrr::map(~ .x %>% mutate(industry_code = as.character(industry_code))) %>%
           purrr::map(~ .x %>% mutate(industry_code = str_replace_all(industry_code, "-.*", ""))) %>%
           purrr::map(~ .x %>% mutate(industry_code = as.numeric(industry_code))) %>%
           purrr::map(~ .x %>% filter(own_code==5)) %>%  # all covered enterprises
           purrr::map(~ .x %>% filter(size_code==0)) %>% # all establishment sizes
           purrr::map(~ .x %>% filter(industry_code<100 & industry_code>10)) %>% # only 2-digit industries
           purrr::map(~ .x %>% filter(agglvl_code>=70))  # counties only

# Bind rows of each data frame together and keep only 2-digit industries
fils1 <- bind_rows(df_list)

write_csv(fils1,"../../../data/qcew/cleaned/employment_big_1990_2021.csv")


# combine two eras
fils <- bind_rows(fils0,fils1)

write_csv(fils,"../../../data/qcew/cleaned/employment_big_all.csv")


#filter own_code==5, groupby -> industry code 

# Calculate employment share and avg wages, add inductry code and title to df
head(fils,100) %>% print
df <- fils %>% group_by(area_fips,year) %>% 
               summarize(
                         area_fips = area_fips,
                         year = year,
                         industry_title = industry_title,
                         industry_code = industry_code,
                         emp_shr = annual_avg_emplvl/sum(annual_avg_emplvl),
                         wage_shr = total_annual_wages/sum(total_annual_wages),
                         avg_annual_pay = avg_annual_pay
                        )
# Make the data set strongly balanced
df %<>% ungroup %>% complete(area_fips, year, industry_code, fill = list(emp_shr = 0, wage_shr = 0, avg_annual_pay = 0), explicit = FALSE)
df %<>% mutate(industry_title = str_replace_all(industry_title, "NAICS [0-9][0-9] ", ""))
df %<>% mutate(industry_title = str_replace_all(industry_title, "NAICS [0-9][0-9]-[0-9][0-9] ", ""))

# Fix missing industry titles
# create a lookup table
lookup_table <- tibble(
                       industry_code = c(11, 21, 22, 23, 31, 42, 44, 48, 51, 52, 53, 54, 55, 56, 61, 62, 71, 72, 81, 99),
                       industry_title = c("Agriculture, forestry, fishing and hunting", "Mining, quarrying, and oil and gas extraction", "Utilities", "Construction", "Manufacturing", "Wholesale trade", "Retail trade", "Transportation and warehousing", "Information", "Finance and insurance", "Real estate and rental and leasing", "Professional and technical services", "Management of companies and enterprises", "Administrative and waste services", "Educational services", "Health care and social assistance", "Arts, entertainment, and recreation", "Accommodation and food services", "Other services, except public administration", "Unclassified")
                      )

# join the lookup table with the original data frame to complete the missing values of industry title
df %<>% left_join(lookup_table, by = "industry_code") %>% 
        mutate(industry_title = ifelse(is.na(industry_title.x), industry_title.y, industry_title.x)) %>% 
        select(-industry_title.y, -industry_title.x)

# shorten industry titles for reshape
df %<>% mutate(industry = case_when(
                                    industry_title=="Agriculture, forestry, fishing and hunting"    ~ "agriculture",
                                    industry_title=="Mining, quarrying, and oil and gas extraction" ~ "mining",
                                    industry_title=="Utilities"                                     ~ "utilities",
                                    industry_title=="Construction"                                  ~ "construction",
                                    industry_title=="Manufacturing"                                 ~ "manufacturing",
                                    industry_title=="Wholesale trade"                               ~ "wholesale_trade",
                                    industry_title=="Retail trade"                                  ~ "retail_trade",
                                    industry_title=="Transportation and warehousing"                ~ "transport",
                                    industry_title=="Information"                                   ~ "information",
                                    industry_title=="Finance and insurance"                         ~ "finance",
                                    industry_title=="Real estate and rental and leasing"            ~ "real_estate",
                                    industry_title=="Professional and technical services"           ~ "prof_svc",
                                    industry_title=="Management of companies and enterprises"       ~ "management",
                                    industry_title=="Administrative and waste services"             ~ "admin_svc",
                                    industry_title=="Educational services"                          ~ "educ_svc",
                                    industry_title=="Health care and social assistance"             ~ "healthcare",
                                    industry_title=="Arts, entertainment, and recreation"           ~ "arts_entertainment",
                                    industry_title=="Accommodation and food services"               ~ "hospitality_food",
                                    industry_title=="Other services, except public administration"  ~ "other_svc",
                                    industry_title=="Unclassified"                                  ~ "unclassified",
                                    TRUE ~ NA_character_
                                   )
              )

# reshape wide
df %<>% select(-industry_code,-industry_title) %>% 
        pivot_wider(names_from = industry, values_from = c(emp_shr, wage_shr, avg_annual_pay)) %>%
        select(-ends_with("_NA"))

write_csv(df,"../../../data/qcew/cleaned/employment_all.csv")
write_csv(df %>% filter(year>=1990),"../../../data/qcew/cleaned/employment_1990_2021.csv")

