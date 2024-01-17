library(tidyverse)
library(magrittr)
library("bea.R")

# helpful tutorial here: https://jwrchoi.com/post/how-to-use-bureau-of-economic-analysis-bea-api-in-r/

beaKey <- Sys.getenv("BEA_KEY")

df <- list()
allfips <- read_csv("https://raw.githubusercontent.com/kjhealy/us-county/master/data/census/fips-by-state.csv")

beaSpecs10 <- list(
  "UserID" = beaKey, # Set up API key
  "Method" = "GetData", # Method
  "datasetname" = "Regional", # Specify dataset
  "TableName" = "CAEMP25N", # Specify table within the dataset
  "LineCode" = 10, # Specify the line code
  "GeoFips" = "COUNTY", # Specify the geographical level
  "Year" = paste(2001:2022,collapse=",") # Specify the years
)

beaSpecs10o <- list(
  "UserID" = beaKey, # Set up API key
  "Method" = "GetData", # Method
  "datasetname" = "Regional", # Specify dataset
  "TableName" = "CAEMP25", # Specify table within the dataset
  "LineCode" = 10, # Specify the line code
  "GeoFips" = "COUNTY", # Specify the geographical level
  "Year" = paste(1970:2000,collapse=",") # Specify the years
)

bea_10  <- beaGet(beaSpecs10,  asWide = FALSE)
#bea_10o <- beaGet(beaSpecs10o, asWide = FALSE)


beanew <- bea_10 %>% 
  select(FIPS=GeoFips, year=TimePeriod, DataValue, GeoName) %>% 
  mutate(GeoName = gsub(",.*$", "", GeoName)) %>% 
  rename(totalemp = DataValue,
         county = GeoName)

#beaold <- bea_10o %>% 
#  select(FIPS=GeoFips, year=TimePeriod, DataValue, GeoName) %>% 
#  mutate(GeoName = gsub(",.*$", "", GeoName)) %>% 
#  rename(totalemp = DataValue,
#         county = GeoName)

write_csv(beanew %>% arrange(FIPS,year),"../../../data/bea/cleaned/countyemp2001_2021.csv")
