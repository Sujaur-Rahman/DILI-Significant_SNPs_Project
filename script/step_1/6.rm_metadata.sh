#!/bin/bash
##
# Input VCF file
input_file="filtered_eur_merged_cohort.vcf"

# Output file
output_file="no_metadata_eur_merged_cohort.vcf"

# Use grep to filter out lines starting with ##
grep -v '^##' "$input_file" > "$output_file"

echo "Lines starting with ## removed. Output saved to $output_file"
