#!/bin/bash

# Specify the directory where the files are located
directory="."

# Define the regions
regions="US_West US_East China Russia Europe_West Europe_East South_America South_Korea South_Africa Chile Peru Southeast_Asia India Australia"

# Function to cleanup a file
cleanup_file() {
    file="$1"

    if [ -e "$file" ]; then
        rm "$file"
        echo "Deleted: $file"
    else
        echo "File not found: $file"
    fi
}

# Use a loop to iterate over regions and delete files matching the pattern
for region in $regions; do
    file="$directory/$region.txt"
    
    if [ -e "$file" ]; then
        rm "$file"
        echo "Deleted: $file"
    else
        echo "File not found: $file"
    fi
done

# Use a loop to iterate over regions and delete files matching the pattern
for region in $regions; do
    region_file="$directory/$region.txt"

    cleanup_file "$region_file"
done

echo "Regions.txt cleanup complete."
