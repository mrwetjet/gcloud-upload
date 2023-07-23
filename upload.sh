#!/bin/bash

set -e

# Must use double quotes
green_prefix="\033[32m"
red_prefix="\033[31m"
color_suffix="\033[00m"

# Perform actions

# Initialize
printf "1\n1\n1" | gcloud init &&
# Create temp upload directory
mkdir ./UPLOAD &&
cd ./UPLOAD &&
# Make sure git credentials are good
git config --global user.name "mrwetjet" &&
git config --global user.email "mr.wetjet01@gmail.com" &&
# Clone the remote repo
git clone git@github.com:mrwetjet/mrwetjet-automated-emailing.git &&
cd ./mrwetjet-automated-emailing &&
# Deploy it
yes | gcloud app deploy &&
cd ../.. &&
# Clean up temp upload directory
rm -rf ./UPLOAD &&
# Echo the success message and exit
echo -e "\n\n--- "$green_prefix"SUCCESS"$color_suffix" ---\n\n" &&
exit 0

# Otherwise echo the failure message and exit 1
echo -e "\n\n--- "$red_prefix"FAIL"$color_suffix" ---\n\n"
exit 1