library(tidyverse)
library(magrittr)

# load data
allfips <- read_csv("https://raw.githubusercontent.com/kjhealy/us-county/master/data/census/fips-by-state.csv")
oil <- read_csv("../../../data/oil-and-gas/raw/Oil_Wells.csv")
gas <- read_csv("../../../data/oil-and-gas/raw/Natural_Gas_Wells.csv")

# clean up county data
allfips_clean <- allfips %>%
                 mutate(
                   county = str_remove(name, "\\s+County$"),
                   county = str_remove(county, "\\s+Parish$"),
                   county = str_remove(county, "\\s+Borough$"),
                   county = str_remove(county, "\\s+Municipality$"),
                   county = str_remove(county, "\\s+Census Area$"),
                   state  = state,
                   county = str_to_lower(county),
                   county = str_replace(county, "st\\.", "st")
                 )

# reduce number of variables
oil_sliced <- oil %>% select(countynm, state) %>% mutate(id = paste(countynm, state, sep="_"))
gas_sliced <- gas %>% select(countynm, state) %>% mutate(id = paste(countynm, state, sep="_")) 

# drop missing states
oil_sliced <- oil_sliced %>% drop_na(state)
gas_sliced <- gas_sliced %>% drop_na(state)

# count number of wells in each county and state
oil_sliced %<>% count(id) %>% rename(n_oil_wells = n)
gas_sliced %<>% count(id) %>% rename(n_gas_wells = n)

# get county fips codes for oil and gas wells
oil_sliced_clean <- oil_sliced %>%
  separate(id, into = c("county", "state"), sep = "_", remove = FALSE) %>%
  mutate(
    county = str_to_lower(county),
    county = str_replace(county, "st\\.", "st"),
    county = str_replace(county, "\\s+County$", "")
  ) %>%
  filter(!(state %in% c("FP", "FG")))

gas_sliced_clean <- gas_sliced %>%
  separate(id, into = c("county", "state"), sep = "_", remove = FALSE) %>%
  mutate(
    county = str_to_lower(county),
    county = str_replace(county, "st\\.", "st"),
    county = str_replace(county, "\\s+County$", "")
  ) %>%
  filter(!(state %in% c("FP", "FG")))

# Join the datasets with county fips codes
oil_sliced_clean %<>%
  left_join(allfips_clean, by = c("county", "state")) %>%
  select(FIPS = fips, n_oil_wells)
gas_sliced_clean %<>%
  left_join(allfips_clean, by = c("county", "state")) %>%
  select(FIPS = fips, n_gas_wells)

# Check for unmatched rows
unmatched <- oil_sliced_clean %>%
  filter(is.na(FIPS))
print(unmatched)
unmatched <- gas_sliced_clean %>%
  filter(is.na(FIPS))
print(unmatched)

# missing rows need to be included as having 0 wells
fips <- allfips$fips
template <- expand_grid(FIPS = fips)

# Merge template with original data
oil_all <- left_join(template, oil_sliced_clean, by = c("FIPS"))
gas_all <- left_join(template, gas_sliced_clean, by = c("FIPS"))

# Replace missing values with 0
oil_all %<>% replace_na(list(n_oil_wells = 0))
gas_all %<>% replace_na(list(n_gas_wells = 0))

# Merge together
OG_all <- left_join(oil_all, gas_all, by = c("FIPS"))

# save as CSV
write_csv(OG_all, "../../../data/oil-and-gas/cleaned/OG_count.csv")
