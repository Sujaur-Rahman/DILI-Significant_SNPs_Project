#!/bin/bash
###############
# Define the input and output file names
INPUT_FILE="final_merged_output.tsv"
OUTPUT_FILE="rm_dot_final_merged_output.tsv"

# Use awk to filter out rows where the second column is exactly "."
awk -F'\t' '$74 != "."' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Rows with '.' in the second column have been removed. Output file: $OUTPUT_FILE"
