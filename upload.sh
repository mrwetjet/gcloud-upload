#!/bin/bash

#!/usr/bin/env bash

# must use double quotes
green_prefix="\033[32m"
red_prefix="\033[31m"
color_suffix="\033[00m"

# wrap the string "ERROR" with the prefix and suffix
echo -e "$red_prefix"ERROR"$red_suffix"


# Perform actions
printf "1\n1\n1" | gcloud init &&
mkdir ./UPLOAD &&
cd ./UPLOAD &&
git config --global user.name "mrwetjet" &&
git config --global user.email "mr.wetjet01@gmail.com" &&
git clone git@github.com:mrwetjet/mrwetjet-automated-emailing.git &&
cd ../ &&
rm -rf ./UPLOAD &&
yes | gcloud app deploy &&
echo -e "\n\n--- "$green_prefix"SUCCESS"$color_suffix" ---\n\n" &&
exit 0

echo -e "\n\n--- "$red_prefix"FAIL"$color_suffix" ---\n\n"
exit 1