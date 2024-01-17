library(tidyverse)
library(magrittr)

# load data
allfips <- read_csv("https://raw.githubusercontent.com/kjhealy/us-county/master/data/census/fips-by-state.csv")
mines <- read_csv("../../../data/mines/raw/Mines_and_Mineral_Resources.csv")

# clean up date variable
mines %<>% mutate(STAT_YEAR = as.numeric(substr(mines$STAT_DATE, 1,4)))

# reduce number of variables
mine_sliced <- mines %>% select(FIPS, STAT_YEAR)

# count number of mines per year
mine_sliced %<>% count(FIPS, STAT_YEAR)

# rename 
mine_sliced %<>% rename(year = STAT_YEAR, n_new_mines = n)

# create "cumulative number of mines"
fips <- allfips$fips
years <- 1925:2022
template <- expand_grid(FIPS = fips, year = years)

# Merge template with original data
mines_all <- left_join(template, mine_sliced, by = c("FIPS", "year"))

# Replace missing values with 0
mines_all %<>% replace_na(list(n_new_mines = 0))

# Number of mines
mines_all %<>% group_by(FIPS) %>%
               mutate(n_mines = cumsum(n_new_mines)) %>%
               ungroup

mines_all %<>% filter(year>=1970)

# save as CSV
write_csv(mines_all,"../../../data/mines/cleaned/mines_count.csv")
