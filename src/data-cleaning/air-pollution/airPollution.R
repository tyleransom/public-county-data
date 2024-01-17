library(tidyverse)

airPollution <- read_csv("../../../data/air-pollution/raw/conreport.csv")

glimpse(airPollution)

airPollution$STATE <- substring(airPollution$County, nchar(airPollution$County)-2)

airPollution$County <-substr(airPollution$County, 1,nchar(airPollution$County)-4)


airPollution_sliced <- subset(airPollution, select = c(STATE, County, Year, `PM2.5 Weighted Mean 24-hr`, `PM10 Mean 24-hr`, `SO2 99th Percentile 1-hr`, `NO2 98th Percentile 1-hr`))

airPollution_sliced <- airPollution_sliced[order(airPollution_sliced$County, airPollution_sliced$Year),]  


airPollution_sliced <- airPollution_sliced %>% 
  count(County, STATE, Year, `PM2.5 Weighted Mean 24-hr`, `PM10 Mean 24-hr`, `SO2 99th Percentile 1-hr`, `NO2 98th Percentile 1-hr`)

# rename 
airPollution_sliced <- airPollution_sliced %>%
  rename(YEAR = Year, OBSERVED = n, COUNTY = County)

# save as CSV
write_csv(airPollution_sliced,"../../../data/air-pollution/cleaned/airpollution_count.csv")
