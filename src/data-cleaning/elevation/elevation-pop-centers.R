library(tidyverse)
library(magrittr)
library(elevatr)

# get population center lat/lon from Census Bureau
df <- list()
for (var in c("01", "02", "04", "05", "06", "08", "09", "10", "11", "12", "13", "15",
              "16", "17", "18", "19", "20", "21", "22","23","24","25","26","27",
              "28","29","30","31","32","33","34","35","36","37",
              "38","39","40","41","42" ,"44" ,"45" ,"46" ,"47" ,"48" ,
              "49" ,"50" ,"51" ,"53" ,"54" ,"55" ,"56")) {
  temp  <-  read_csv(paste0("https://www2.census.gov/geo/docs/reference/cenpop2010/county/CenPop2010_Mean_CO",var,".txt"))
  temp %<>% mutate(STATEFP=as.character(STATEFP),
                   COUNTYFP=as.character(COUNTYFP))
  df   %<>% bind_rows(temp)
}

# rename, rearrange
df %<>% mutate(FIPS=paste0(STATEFP,COUNTYFP))
df %<>% select(FIPS, latit=LATITUDE, longi=LONGITUDE, stname=STNAME, ctyname=COUNAME)
df %<>% arrange(FIPS)

dfe <- df %>% select(x=longi,y=latit) %>% as.data.frame

# loop through counties and get elevation from Amazon Web Services (AWS)
elev <- list()
for (i in seq(1:dim(dfe)[1])) {
  te <- get_elev_point(dfe[i,], prj = "EPSG:4326", z = 14, src = "aws")
  te2 <- bind_cols(dfe[i,],te$elevation[1])
  elev %<>% bind_rows(te2)
}
# convert from meters to feet
elev %<>% rename(elevation = `...3`) %>%
          mutate(elevation = elevation*3.28084)

# merge with FIPS codes
df %<>% left_join(elev,by=c("longi"="x","latit"="y"))

# save as CSV
write_csv(df,"../../../data/elevation/cleaned/county_elevation_pop_centers.csv")
