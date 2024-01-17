library(tidyverse)
library(magrittr)

df  <-  read_tsv("https://www2.census.gov/geo/docs/reference/county_adjacency.txt", col_names = FALSE)

df %<>% rename(focal = X1, focalFIPS = X2, adjacent = X3, adjacentFIPS = X4)

df %<>% fill(focal:focalFIPS)

df %<>% filter(focalFIPS!=adjacentFIPS) %>% relocate(focalFIPS,adjacentFIPS)

write_csv(df,"../../../data/county-adjacency/cleaned/adjacent_counties.csv")
