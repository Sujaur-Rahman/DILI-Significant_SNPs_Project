#!/bin/bash
########
# Define the input file name
INPUT_FILE="eur_merged_cohort.hg38_multianno.tsv"

# Use cut to extract the 11th and 25th columns
cut -f 1,2,3,4,5,6,7,8,9,10,24 "$INPUT_FILE" > avsnp_nfe.tsv

echo "Columns extracted. Output file: extracted_columns.tsv"
