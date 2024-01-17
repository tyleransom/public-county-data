#!/bin/sh

cd raw

# DOWNLOAD CENSUS FILES (can't use loop because of the Dropbox SHAs)



# 1970s
wget -O pop_sex_age_race1970_1979.csv "https://www2.census.gov/programs-surveys/popest/tables/1900-1980/counties/asrh/co-asr-7079.csv"



#1980s
# Create a variable to keep track of which file we're processing
count=0

# Loop through each year
for yr in {1980..1989}; do
    # Download the file
    wget -O temp.csv "https://www2.census.gov/programs-surveys/popest/tables/1980-1990/counties/asrh/pe-02-${yr}.csv"

    # Increment the file count
    count=$((count + 1))

    # If this is the first file, remove the specified lines and copy it
    if [ $count -eq 1 ]; then
        tail -n +6 "temp.csv" | sed '2,2d' > pop_sex_age_race1980s.csv
    else
        # Otherwise, remove the first seven lines and append to the final file
        tail -n +8 "temp.csv" >> pop_sex_age_race1980s.csv
    fi
done
rm -f temp.csv



# 2000s
# Create a variable to keep track of which file we're processing
count=0

# Loop through each state code
for st in 01 02 04 05 06 08 09 10 11 12 13 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 44 45 46 47 48 49 50 51 53 54 55 56; do
    # Download the file
    wget -O temp.csv "https://www2.census.gov/programs-surveys/popest/datasets/2000-2010/intercensal/county/co-est00int-alldata-${st}.csv"

    # Increment the file count
    count=$((count + 1))

    # If this is the first file, just copy it
    if [ $count -eq 1 ]; then
        cat "temp.csv" > pop_sex_age_race2000s.csv
    else
        # Otherwise, remove the first line and append to the final file
        tail -n +2 "temp.csv" >> pop_sex_age_race2000s.csv
    fi
done
rm -f temp.csv



# 2010s
wget -O pop_sex_age_race2010s.csv "https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/asrh/cc-est2019-alldata.csv"

cd ..

