library(tidyverse)
library(tidycensus)
library(magrittr)
library(haven)

# tidycensus API key
census_api_key(Sys.getenv("CENSUS_KEY"))

#-------------------------------------------------------------------------------
# county population data
#-------------------------------------------------------------------------------
cp_1970_2017 <- read_dta("../../../data/census/raw/county_population1970-2017.dta")
cp_2010_2019 <- read_csv("https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/totals/co-est2019-alldata.csv")
cp_2020_2021 <- read_csv("https://www2.census.gov/programs-surveys/popest/datasets/2020-2021/counties/totals/co-est2021-alldata.csv")

pops <- cp_1970_2017 %>% 
        select(fips_st,fips_co,year,pop=popAllTotal) %>%
        mutate(GEOID = paste0(str_pad(fips_st, width = 2, pad = "0"), str_pad(fips_co, width = 3, pad = "0")),
               fips_st = NULL,
               fips_co = NULL) %>%
        arrange(GEOID,year)

cp_2010_2019 %<>% filter(SUMLEV=="050") %>% 
                  select(STATE,COUNTY,starts_with("POPESTIM")) %>%
                  mutate(GEOID = paste0(STATE,COUNTY)) %>%
                  select(GEOID,ends_with("2018"),ends_with("2019"))

pops1819 <- cp_2010_2019 %>% 
            pivot_longer(cols = starts_with("POPESTIMATE"),
                         names_to = "year",
                         names_prefix = "POPESTIMATE",
                         values_to = "pop") %>%
            mutate(year = as.numeric(year)) %>%
            arrange(GEOID,year)

cp_2020_2021 %<>% filter(SUMLEV=="050") %>% 
                  select(STATE,COUNTY,starts_with("POPESTIM")) %>%
                  mutate(GEOID = paste0(STATE,COUNTY)) %>%
                  select(GEOID,ends_with("2020"),ends_with("2021"))

pops2021 <- cp_2020_2021 %>% 
            pivot_longer(cols = starts_with("POPESTIMATE"),
                         names_to = "year",
                         names_prefix = "POPESTIMATE",
                         values_to = "pop") %>%
            mutate(year = as.numeric(year)) %>%
            arrange(GEOID,year)

pops <- bind_rows(pops,pops1819,pops2021) %>% arrange(GEOID,year) %>% relocate(GEOID,year)


#-------------------------------------------------------------------------------
# 5-year ACS county characteristics
#-------------------------------------------------------------------------------
# Create a vector of years to loop over
years  <- 2009:2021

# Create an empty list to store the results
results <- list()

# Get the variables of interest for the given year
# URL for DP02 table: https://www2.census.gov/programs-surveys/acs/tech_docs/table_shells/2019/DP02.xlsx
# URL for Documentation: https://www.census.gov/programs-surveys/acs/technical-documentation/table-and-geography-changes/2019/5-year.html
vars <- list(
             total_pop = "B01003_001",
             median_income = "B19013_001",
             pop_grad_deg = "DP02_0065",
             pop_bach_deg = "DP02_0064",
             pop_white = "B03002_003",
             pop_black = "B03002_004",
             pop_hispanic = "B03002_012",
             pop_asian = "B03002_006",
             pop_natam = "B03002_005",
             pop_race2 = "B03002_009",
             pop_female = "B01001_026",
             median_age = "B01002_001",
             pop_marr_coup_fam = "DP02_0004",
             pop_moved_in_last_yr = "DP02_0084",
             pop_born_same_state = "DP02_0089",
             total_commute = "B08406_001",
             pop_bike = "B08406_014",
             pop_walk = "B08406_015"
            )

# Loop over the variables of interest
for (j in 1:length(vars)) {

    var_name <- names(vars)[j]
    var_code <- vars[[j]]

    # Create an empty data frame to store the results for the current variable
    var_results <- tibble()

        # Loop over the years
        for (year in years) {

        # fix later years where the line numbers changed
        if (year>=2019 & var_name=="pop_marr_coup_fam") { # married couple
          var_code <- "DP02_0002"
        }

        if (year==2019 & var_name=="pop_moved_in_last_yr") { # moved in from other state
          var_code <- "DP02_0085"
        }

        if (year>=2020 & var_name=="pop_moved_in_last_yr") { # moved in from other state
          var_code <- "DP02_0086"
        }

        if (year==2019 & var_name=="pop_born_same_state") { # born in this state
          var_code <- "DP02_0090"
        }

        if (year>=2020 & var_name=="pop_born_same_state") { # born in this state
          var_code <- "DP02_0091"
        }

        if (year>=2019 & var_name=="pop_grad_deg") { # grad degree
          var_code <- "DP02_0066"
        }

        if (year>=2019 & var_name=="pop_bach_deg") { # bach degree
          var_code <- "DP02_0065"
        }

        # Get the data for the given year and variable
        data <- get_acs(geography = "county",
        survey = "acs5",
        variables = var_code,
        year = year)

        # Select the variable of interest and rename it
        data_select <- select(data, GEOID, NAME, estimate)

        # Add the year to the data and bind it to the previous years
        data_select <- mutate(data_select, year = year)
        var_results <- bind_rows(var_results, data_select)
    }

    # Rename the columns to match the variable name
    var_results <- var_results %>%
    rename_at("estimate", ~var_name)

    # Add the results for the current variable to the list
    results[[var_name]] <- var_results
}
# Join the results for all variables
final_result <- reduce(results, full_join, by = c("GEOID", "NAME", "year"))

# Select the columns of interest
final_result %<>% select(GEOID, NAME, year, median_age, total_pop, median_income, pop_bach_deg, pop_grad_deg, pop_white, pop_black, pop_hispanic, pop_asian, pop_natam, pop_race2, pop_female, pop_moved_in_last_yr, pop_marr_coup_fam, pop_born_same_state, total_commute, pop_bike, pop_walk)

# Create shares
final_result %<>% mutate(
                         pct_white = pop_white/total_pop*100,
                         pct_black = pop_black/total_pop*100,
                         pct_hisp  = pop_hispanic/total_pop*100,
                         pct_asian = pop_asian/total_pop*100,
                         pct_natam = pop_natam/total_pop*100,
                         pct_race2 = pop_race2/total_pop*100,
                         pct_female = pop_female/total_pop*100,
                         pct_bach_deg = pop_bach_deg/total_pop*100,
                         pct_grad_deg = pop_grad_deg/total_pop*100,
                         pct_moved_in_last_yr = pop_moved_in_last_yr/total_pop*100,
                         pct_born_same_state = pop_born_same_state/total_pop*100,
                         pct_marr_coup_fam = pop_marr_coup_fam/total_pop*100,
                         pct_bike = pop_bike/total_commute*100,
                         pct_walk = pop_walk/total_commute*100,
                        )

df <- final_result %>% select(-pop_white,-pop_black,-pop_hispanic,-pop_asian,-pop_natam,-pop_race2,-pop_female, -pop_bach_deg, -pop_grad_deg, -pop_moved_in_last_yr, -pop_born_same_state, -pop_marr_coup_fam, -pop_bike, -pop_walk, -total_commute)

df %<>% mutate(pct_bach_deg_plus = pct_bach_deg+pct_grad_deg,
               pct_bike_walk     = pct_bike+pct_walk)

df %<>% arrange(GEOID,year)

df <- left_join(pops, df, by=c("GEOID","year"))

write_csv(df,"../../../data/census/cleaned/census1970_2021.csv")
