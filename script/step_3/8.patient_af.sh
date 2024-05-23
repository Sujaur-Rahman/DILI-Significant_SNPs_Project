#!/bin/bash

# Input and output file names
input_file="nfe_pvalues_filtered_snp.tsv"
output_file="patient_af.tsv"

# Process the file

awk -F'\t' 'BEGIN {OFS="\t"} NR > 1 {print $71 / 102}' "$input_file" > "$output_file"
