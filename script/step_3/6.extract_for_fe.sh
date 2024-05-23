#!/bin/bash

# Input file name
inputFile="conti_added_final_merged_output.tsv"

# Output file name
outputFile="extracted_columns_for_fe.tsv"

# Use awk to extract the desired columns
awk -F'\t' '{print $75 "\t" $71 "\t" $72 "\t" $76 "\t" $77}' "$inputFile" > "$outputFile"

echo "Extraction completed. Output file: $outputFile"
