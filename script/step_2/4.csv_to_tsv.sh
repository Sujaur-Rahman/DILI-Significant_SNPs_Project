#!/bin/bash
####
# Define the input and output file names
INPUT_FILE="2.filtered_eur_merged_cohort.hg38_multianno.csv"
OUTPUT_FILE="eur_merged_cohort.hg38_multianno.tsv"

# Use sed to replace all commas with tabs
sed 's/,/\t/g' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Conversion completed. Output file: $OUTPUT_FILE"
