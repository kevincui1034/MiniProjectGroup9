#!/bin/bash

# Specify the dataset file name
input_file="heroes_count.txt"

# Extract unique regions from the dataset
regions=$(awk -F'[\t ]+' '/Region:/ {print $2}' "$input_file" | sort -u)

for region in $regions; do
  output_file="${region}_herocounts.txt"
  
  # Filter lines related to the current region and save to the output file
  awk -v region="$region" '$2 == region {print $0}' "$input_file" | sort -k6 -nr > "$output_file"
  
  echo "Separated and sorted $region data into $output_file"
done
