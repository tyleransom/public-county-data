library(tidyverse)
library(magrittr)

# create list of state abbreviations for USGS
stabbvec <- c( "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY" )

tdf <- list()
# loop through all states and grab data from USGS
for (i in seq(1,length(stabbvec))) {
    Sys.sleep(10)
    url <- paste0("https://geonames.usgs.gov/docs/stategaz/",stabbvec[i],"_Features.zip")
    temp <- tempfile()
    download.file(url,temp)
    data <- read_delim(temp,delim="|")
    unlink(temp)
    if (stabbvec[i]=="AK") {
        data %<>% filter(str_detect(FEATURE_NAME,"Census Area$") | str_detect(FEATURE_NAME,"Borough$"))
        data %<>% filter(FEATURE_CLASS=="Civil")
    } else if (stabbvec[i]=="DC") {
        data %<>% filter(str_detect(FEATURE_NAME,"The White House$"))
    } else if (stabbvec[i]%in%c("MD","MO","VA")) {
        data %<>% filter(str_detect(FEATURE_NAME," County$") | str_detect(FEATURE_NAME,"^City of"))
        data %<>% filter(FEATURE_CLASS=="Civil")
    } else if (stabbvec[i]=="NV") {
        data %<>% filter(str_detect(FEATURE_NAME," County$") | (FEATURE_NAME=="Carson City"))
        data %<>% filter(FEATURE_CLASS=="Civil")
    } else if (stabbvec[i]=="LA") {
        data %<>% filter(str_detect(FEATURE_NAME," Parish$"))
        data %<>% filter(FEATURE_CLASS=="Civil")
    } else {
      data %<>% filter(str_detect(FEATURE_NAME," County$"))
      data %<>% filter(FEATURE_CLASS=="Civil")
    }
    data %<>% mutate(STATE_NUMERIC = as.numeric(STATE_NUMERIC))
    tdf %<>% bind_rows(data)
}
# fix some random issues with extra counties appearing
tdf %<>% filter(!(STATE_ALPHA=="AZ" & is.na(COUNTY_NAME)))
tdf %<>% distinct(STATE_ALPHA,COUNTY_NUMERIC,.keep_all = TRUE)
print(table(tdf$STATE_ALPHA))

# rename 
tdf %<>% select(STATE_ALPHA,STATE_NUMERIC,COUNTY_NAME,COUNTY_NUMERIC,PRIM_LAT_DEC,PRIM_LONG_DEC,ELEV_IN_FT)
tdf %<>% rename(stabb = STATE_ALPHA, stfips = STATE_NUMERIC, cntyname = COUNTY_NAME, cntyfips = COUNTY_NUMERIC, lat = PRIM_LAT_DEC, long = PRIM_LONG_DEC, elev = ELEV_IN_FT)
# save as CSV
write_csv(tdf,"../../../data/elevation/cleaned/county_elevation.csv")

