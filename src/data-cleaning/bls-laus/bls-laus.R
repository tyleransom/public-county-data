library(tidyverse)
library(magrittr)
library(blsR)

df <- list()
allfips <- read_csv("https://raw.githubusercontent.com/kjhealy/us-county/master/data/census/fips-by-state.csv")

Sys.sleep(86401)
req <- 0
for (j in 1:length(allfips$fips)) {
  fipsj <- allfips$fips[j]
  print(fipsj)
  temp <- get_series_table(paste0('LAUCN',fipsj,'0000000003'), Sys.getenv("BLS_KEY"), 1990, 2022)
  if (is.null(dim(temp))) {
    print("skipped")  
  }
  else {
    if (dim(temp)[1]>0) {
      temp %<>% mutate(FIPS = fipsj)
    }
    df %<>% bind_rows(temp)
  }
  req <- req+2
  if (req%%500==0) {
    Sys.sleep(86401)
  }
}

df %<>% group_by(FIPS,year) %>% summarize(urate = mean(value)) %>% ungroup

write_csv(df,"../../../data/bls-laus/cleaned/urate1990_2022.csv")
