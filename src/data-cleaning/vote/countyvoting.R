library(tidyverse)
library(magrittr)
library(imputeTS)

# load data
votes <- read_csv("../../../data/vote/raw/countypres_2000-2020.csv")

# set up data for all combinations of fips and year instead of every 4 years
allyr <- tibble(year=1998:2022)
allco <- read_csv("https://raw.githubusercontent.com/kjhealy/us-county/master/data/census/fips-by-state.csv")
allboth <- expand_grid(FIPS = allco$fips, year = allyr$year)

# compute dem vote shares and interpolate missing values
vote1 <- votes %>%
         group_by(county_fips, year) %>%
         summarize(dem_vote_share = sum(ifelse(party == "DEMOCRAT", candidatevotes, 0), na.rm=T) / sum(candidatevotes) * 100)

# join with full combinations data frame
vote2 <- left_join(allboth,vote1, by=c('FIPS'='county_fips','year'='year'))

# flag counties that never have election data
vote3 <- vote2 %>%
         group_by(FIPS) %>%
         mutate(all_missing = all(is.na(dem_vote_share))) %>%
         ungroup

# interpolate / extrapolate vote shares
vote4 <- vote3 %>%
         filter(!all_missing) %>%
         select(-all_missing) %>%
         group_by(FIPS) %>%
         mutate(dem_shr = imputeTS::na_interpolation(dem_vote_share)) %>%
         select(-dem_vote_share)

# save as CSV
write_csv(vote4,"../../../data/vote/cleaned/dem_vote_shr.csv")
