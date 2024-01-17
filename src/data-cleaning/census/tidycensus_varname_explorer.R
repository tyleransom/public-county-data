library(tidyverse)
library(tidycensus)
library(magrittr)

# tidycensus API key
census_api_key(Sys.getenv("CENSUS_KEY"))

# Create a vector of years to loop over
years  <- 2009:2021

allvars <- list()

for (j in 1:length(years)) {
  print(as.character(years[j]))
  
  if (years[j]>=2011) {
    allvars[[j]] <- load_variables(years[j], "acs5") %>% filter(geography=="county")
  }
  else {
    allvars[[j]] <- load_variables(years[j], "acs5") 
  }
  names(allvars)[j] <- as.character(years[j])
  
}

avtib <- bind_rows(allvars, .id = "year")

write_csv(avtib,"../../../data/census/documentation/acs_vars_2009_2021.csv")