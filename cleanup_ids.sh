#!/bin/bash

# Specify the directory where the files are located
directory="."

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

# Use a loop to iterate over files and delete those matching the pattern
for file in "$directory"/id_*.txt; do
    cleanup_file "$file"
done

echo "Cleanup complete."