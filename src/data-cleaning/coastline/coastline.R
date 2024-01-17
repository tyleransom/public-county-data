library("readxl")
library("tidyverse")

df <- as.data.frame(read_excel("../../../data/coastline/raw/coastline-counties-list.xlsx"))

df <- df[0:255,c("STATE/\r\nCOUNTY\r\nFIPS","COASTLINE REGION")]

df <- rename(df, "FIPS" = "STATE/\r\nCOUNTY\r\nFIPS", "coast" = "COASTLINE REGION")

write_csv(df,"../../../data/coastline/cleaned/coastlineFIPS.csv")
