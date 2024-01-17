library(tidyverse)
library(magrittr)
library(zip)
library(haven)

#-------------------------------------------------------------------------------
# Load the CSV files as data frames
#-------------------------------------------------------------------------------
mines        <- read_csv("../../../data/mines/cleaned/mines_count.csv")
oil_gas      <- read_csv("../../../data/oil-and-gas/cleaned/OG_count.csv")
census       <- read_csv("../../../data/census/cleaned/census1970_2021.csv")
coastline    <- read_csv("../../../data/coastline/cleaned/coastlineFIPS.csv")
elevation    <- read_csv("../../../data/elevation/cleaned/county_elevation.csv")
elevation_pc <- read_csv("../../../data/elevation/cleaned/county_elevation_pop_centers.csv")
health       <- read_csv("../../../data/health/cleaned/health.csv")
qcew         <- read_csv("../../../data/qcew/cleaned/employment_1990_2021.csv")
temperature  <- read_csv("../../../data/temperature/cleaned/temperature2000-2019.csv")
vote         <- read_csv("../../../data/vote/cleaned/dem_vote_shr.csv")
watershed    <- read_csv("../../../data/watershed/cleaned/fips_watershed.csv")
adjacency    <- read_csv("../../../data/county-adjacency/cleaned/adjacent_counties.csv")

#-------------------------------------------------------------------------------
# Convert the "by" variables to numeric
#-------------------------------------------------------------------------------
mines        %<>% mutate(across(c("FIPS", "year"), as.numeric))
oil_gas      %<>% mutate(across(c("FIPS", "year"), as.numeric))
census       %<>% rename(FIPS = GEOID) %>%
                  mutate(across(c("FIPS", "year"), as.numeric))
coastline    %<>% mutate(FIPS = as.numeric(FIPS))
elevation    %<>% mutate(across(c("stfips","cntyfips"), as.numeric)) %>% 
                  mutate(FIPS = stfips * 1000 + cntyfips) %>% 
                  mutate(elev000 = elev/1000) %>%
                  select(-stfips, -cntyfips)
elevation_pc %<>% mutate(FIPS = as.numeric(FIPS)) %>%
                  rename(elevpc = elevation) %>%
                  mutate(elevpc000 = elevpc/1000) %>%
                  mutate(
                         elevpc = replace(elevpc, FIPS== 2016, 0),
                         elevpc = replace(elevpc, FIPS==53029, 0),
                         elevpc = replace(elevpc, FIPS== 2013, 0),
                  )
health       %<>% mutate(across(c("FIPS", "year"), as.numeric))
qcew         %<>% rename(FIPS = area_fips) %>%
                  mutate(FIPS = as.numeric(FIPS))
temperature  %<>% rename(FIPS = fips) %>%
                  mutate(across(c("FIPS", "year"), as.numeric))
vote         %<>% mutate(FIPS = as.numeric(FIPS))
watershed    %<>% rename(FIPS = fips) %>%
                  mutate(FIPS = as.numeric(FIPS))
adjacency    %<>% mutate(focalFIPS    = as.numeric(focalFIPS),
                         adjacentFIPS = as.numeric(adjacentFIPS))

#-------------------------------------------------------------------------------
# Merge the CSV files based on their identifiers
#-------------------------------------------------------------------------------
df <- mines %>% left_join(oil_gas, by = c("FIPS", "year")) 
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(census, by = c("FIPS", "year"))
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(coastline, by = "FIPS")
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(elevation, by = "FIPS")
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(elevation_pc, by = "FIPS")
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(health, by = c("FIPS", "year"))
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(qcew, by = c("FIPS","year"))
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(temperature, by = c("FIPS", "year"))
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(vote, by = c("FIPS","year"))
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

df %<>% left_join(watershed, by = "FIPS")
df %>% `$`(FIPS) %>% unique %>% length %>% paste0("number of unique counties: ",.) %>% print
df %>% `$`(year) %>% unique %>% length %>% paste0("number of unique years: "   ,.) %>% print

#-------------------------------------------------------------------------------
# clean a couple of variables
#-------------------------------------------------------------------------------
df %<>% mutate(coastal = !is.na(coast)) %>%
        rename(avg_annual_pay_arts_ent = avg_annual_pay_arts_entertainment)

#-------------------------------------------------------------------------------
# rearrange into optimal format
#-------------------------------------------------------------------------------
df %<>% filter(year>=1970) %>%
        select(-County,-State,-NAME,-mean_lat,-mean_lon) %>%
        relocate(FIPS,year,cntyname,stabb,obesity_rate,coast,coastal,elev,elevpc,modal_reg,modal_sub,modal_acc) %>%
        rename(longitude = long, latitude = lat)


#-------------------------------------------------------------------------------
# merge in adjacent counties and compute average variables of adjacent counties
#-------------------------------------------------------------------------------
dfadj <- left_join(df, adjacency, by = c("FIPS"="adjacentFIPS")) %>%
         rename(adjacentFIPS = FIPS) %>%
         relocate(focalFIPS,adjacentFIPS) %>%
         arrange(focalFIPS,year,adjacentFIPS)

dfadjm <- dfadj %>%
          group_by(focalFIPS,year) %>%
          summarize(obesity_rate_adj = weighted.mean(obesity_rate,pop),
                    elevpc_adj = mean(elevpc),
                    elevpc000_adj = mean(elevpc000),
                    median_inc_adj = weighted.mean(median_income,pop),
                   ) %>%
          rename(FIPS = focalFIPS)

df <- left_join(df, dfadjm, by=c("FIPS","year"))


#-------------------------------------------------------------------------------
# Save the merged data as a CSV file
#-------------------------------------------------------------------------------
write_csv(df, "../../../data/county-combined/cleaned/county_all.csv")
zip("../../../data/county-combined/cleaned/county_all.csv.zip", files = "../../../data/county-combined/cleaned/county_all.csv")
unlink("../../../data/county-combined/cleaned/county_all.csv")

# Save as a DTA file
write_dta(df, "../../../data/county-combined/cleaned/county_all.dta")
zip("../../../data/county-combined/cleaned/county_all.dta.zip", files = "../../../data/county-combined/cleaned/county_all.dta")
unlink("../../../data/county-combined/cleaned/county_all.dta")
