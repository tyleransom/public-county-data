#!/bin/sh

cd raw

# Get annual average CSV files for NAICS
for yr in {1990..2021}; do
    wget -O ${yr}_annual_by_industry.zip "https://data.bls.gov/cew/data/files/${yr}/csv/${yr}_annual_by_industry.zip"
done

# Get annual average CSV files for NAICS10
for yr in {1975..1989}; do
    wget -O ${yr}_annual_by_industry.zip "https://data.bls.gov/cew/data/files/${yr}/csv/${yr}_annual_naics10_totals.zip"
done

# Unzip the raw files
for yr in {1975..2021}; do
    unzip -o ${yr}_annual_by_industry.zip
done

cd ..

