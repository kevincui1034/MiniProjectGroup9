#!/bin/bash

# Input file
input_file="dota2Test.csv"

# Loop through the input file and create separate files for each ID
awk -F',' '{print > ("id_"$2".txt")}' "$input_file"

echo "Separation completed. Files are named id_*.txt"