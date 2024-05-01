#!/bin/bash

combine_files() {
    region=$1
    shift
    files=("$@")

    output_file="${region}.txt"

    for file in "${files[@]}"; do
        if [ -e "$file" ]; then
            cat "$file" >> "$output_file"
            echo "Combined $file to $output_file"
        else
            echo "File $file not found. Skipping..."
        fi
    done
}

# Combine files for each region
combine_files "US_West" id_111.txt id_112.txt id_113.txt id_114.txt
combine_files "US_East" id_121.txt id_122.txt id_123.txt id_124.txt
combine_files "Europe_West" id_131.txt id_132.txt id_133.txt id_134.txt id_135.txt id_136.txt id_137.txt id_138.txt
combine_files "South_Korea" id_142.txt id_143.txt id_144.txt id_145.txt
combine_files "Southeast_Asia" id_151.txt id_152.txt id_153.txt id_154.txt id_155.txt id_156.txt
combine_files "China" id_161.txt id_162.txt id_163.txt id_221.txt id_222.txt id_223.txt id_224.txt id_225.txt id_226.txt id_227.txt id_228.txt id_229.txt id_230.txt id_231.txt
combine_files "Australia" id_171.txt
combine_files "Russia" id_181.txt id_182.txt id_183.txt id_184.txt id_185.txt id_186.txt id_187.txt id_188.txt
combine_files "Europe_East" id_191.txt id_192.txt
combine_files "South_America" id_200.txt id_201.txt id_202.txt id_203.txt id_204.txt
combine_files "South_Africa" id_211.txt id_212.txt id_213.txt
combine_files "Chile" id_241.txt id_242.txt
combine_files "Peru" id_251.txt
combine_files "India" id_261.txt