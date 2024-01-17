#-------------------------------------------------------------------------------
# Configure Stata - run this file once at the start of replication
#     This file downloads and installs custom Stata commands used in the
#     data production, data cleaning, and descriptive analysis
#-------------------------------------------------------------------------------
stata-se -b do config_stata.do
R CMD BATCH config_R.R

#-------------------------------------------------------------------------------
# Downloading the Data
#     below are steps to obtain raw data from the QCEW, NSLY, PRISM, Census, and
#     County Health Rankings.
#     Other datasets we use either require manual intervention (EPA air quality)
#     or are accessible via an existing R package
#-------------------------------------------------------------------------------
# QCEW:
# download the QCEW data by executing the following shell script, which auto-
# matically downloads the raw data files from BLS into the `data/qcew/raw/`
# folder
cd ../data/qcew
bash downloader.sh
cd ../../src

# PRISM:
# download the PRISM data by executing the following shell script, which auto-
# matically downloads the raw data files from a Dropbox folder into the 
# `data/temperature/raw/` folder
cd ../data/temperature
bash downloader.sh
cd ../../src

# Census:
# download the Census Bureau data on county demographics by executing the follow-
# ing shell script, # which automatically downloads the raw data files from the 
# Census Bureau website into the `data/census/raw/` folder
cd ../data/census
bash downloader.sh
cd ../../src

# County Health Rankings:
# download the County Health Rankings data by executing the following shell script,
# which automatically downloads the raw data files from the County Health Rankings 
# website into the `data/health/raw/` folder
cd ../data/health
bash downloader.sh
cd ../../src

#-------------------------------------------------------------------------------
# Data Cleaning (approximately 16 hours)
#-------------------------------------------------------------------------------
# EPA Air Quality (minutes)
cd air-pollution/
R CMD BATCH airPollution.R

# County Coastlines (minutes)
cd ../coastline
R CMD BATCH coastline.R

# Census data (minutes)
cd ../census
R CMD BATCH census.R

# County Elevation (minutes)
cd ../elevation
R CMD BATCH elevation.R

# County Health (minutes)
cd ../health
R CMD BATCH countyhealth.R

# Mining Activity (minutes)
cd ../mines
R CMD BATCH mines.R

# Oil & Gas Wells (minutes)
cd ../oil-and-gas
R CMD BATCH OG.R

# Watershed Boundaries (minutes)
cd ../watershed
stata-se -b do create_fips_huc8.do

# Vote History (minutes)
cd ../vote
R CMD BATCH countyvoting.R

# PRISM (12 hours)
cd ../../temperature
R CMD BATCH temperature.R

# QCEW (2 hours)
cd ../qcew
R CMD BATCH qcew.R

# All County Data
cd ../county-combined
R CMD BATCH combine_county_data.R
