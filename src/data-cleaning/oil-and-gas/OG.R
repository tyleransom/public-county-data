library(tidyverse)
library(magrittr)

# load data
allfips <- read_csv("https://raw.githubusercontent.com/kjhealy/us-county/master/data/census/fips-by-state.csv")
OG <- read_csv("../../../data/oil-and-gas/raw/Oil_and_Natural_Gas_Wells.csv")

# clean up date variable
OG %<>% mutate(COMPDATE = as.Date(OG$COMPDATE, format =  "%Y/%m/%d %H:%M:%S"))
OG %<>% mutate(YEAR     = as.numeric(format(OG$COMPDATE,format='%Y')))

# reduce number of variables
OG_sliced <- OG %>% select(COUNTYFIPS, YEAR)

# count number of wells per year
OG_sliced %<>% count(COUNTYFIPS, YEAR)

# rename 
OG_sliced %<>% rename(FIPS = COUNTYFIPS, year = YEAR, n_new_og_wells = n)

# create "cumulative number of mines"
fips <- allfips$fips
years <- 1900:2022
template <- expand_grid(FIPS = fips, year = years)

# Merge template with original data
OG_all <- left_join(template, OG_sliced, by = c("FIPS", "year"))

# Replace missing values with 0
OG_all %<>% replace_na(list(n_new_og_wells = 0))

# Number of mines
OG_all %<>% group_by(FIPS) %>%
  mutate(n_og_wells = cumsum(n_new_og_wells)) %>%
  ungroup

OG_all %<>% filter(year>=1970)

# save as CSV
write_csv(OG_all,"../../../data/oil-and-gas/cleaned/OG_count.csv")
