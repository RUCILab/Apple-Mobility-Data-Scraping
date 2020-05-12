#!/bin/bash

# Apple mobility data scraping script
# Rutgers Urban & Civic Informatics Lab - Maintained by Gavin Rozzi - gavin.rozzi@rutgers.edu
# Usage ./scrape-apple-data.sh YEAR

# Create data directory if it doesn't exist
mkdir -p ~/movement-data/apple-mobility-trends

# Render the HTML of the Apple Mobility Data site using PhantomJS
phantomjs get-apple-html.js

# Extract the current url for the Apple CSV file from the HTML code
APPLE_DATA_URL=$(cat apple_covid.html | grep -Eoi '<a [^>]+>' | grep -Eo 'href="[^\"]+"' | grep -e ".csv"| sed 's/href="//g'| sed 's/"//g')

# Download the current data file
cd ~/movement-data/apple-mobility-trends
echo 'Downloading current mobility trends data from' $APPLE_DATA_URL
wget $APPLE_DATA_URL