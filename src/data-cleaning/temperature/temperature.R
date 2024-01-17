library(tidyverse)
library(haven)
library(lubridate)
library(magrittr)

# List of directory names (1950-2019)
start_year <- 1950
end_year <- 2019
directories <- paste0("../../../data/temperature/raw/year", start_year:end_year)

# List of file names in each directory
files_list <- purrr::map(
                         directories, 
                         function(dir) {
                           list.files(path = dir, pattern = "*.dta", full.names = TRUE)
                         }
                        )

# Flatten the list of file names
files <- flatten(files_list)
print(files)

# Load each file into a list of data frames and mutate the industry_code column to be a character
final <- files %>% 
         purrr::map_dfr(~haven::read_dta(.x) %>% 
                         mutate(filename = base::sub(".*fips", "fips", .x)) %>%
                         mutate(fips = readr::parse_number(filename)) %>%
                         mutate(year = lubridate::year(dateNum)) %>%
                         mutate(month = lubridate::month(dateNum)) %>%
                         mutate(lon = -125 + ((gridNumber - 1) %% 1405) / 24) %>%
                         mutate(lat = 49.9375 + (1/48) - ceiling(gridNumber / 1405) / 24) %>%
                         filter(month %in% c(1,7)) %>% # keep Jan and Jul
                         group_by(filename,fips,month,year) %>%
                         summarize(
                                   mean_tmax = mean(tMax),
                                   mean_tmin = mean(tMin),
                                   mean_prec = mean(prec),
                                   mean_lat  = mean(lat),
                                   mean_lon  = mean(lon),
                                  ) %>%
                         ungroup()
                       )

# reshape wide
final %<>% select(-filename) %>%
           mutate(mo = case_when(month==1 ~ "jan", month==7 ~ "jul", TRUE ~ NA_character_)) %>%
           select(-month) %>%
           pivot_wider(names_from = mo, values_from = c(mean_tmax, mean_tmin, mean_prec)) %>%
           arrange(fips,year)

# export to CSVs
write_csv(final,"../../../data/temperature/cleaned/temperature.csv")
write_csv(final %>% filter(year>=2000),"../../../data/temperature/cleaned/temperature2000-2019.csv")

