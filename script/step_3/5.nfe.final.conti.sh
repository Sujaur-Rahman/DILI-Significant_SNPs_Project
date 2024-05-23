#!/bin/bash
####
# Define the input and output files
input_file="rm_dot_final_merged_output.tsv"
output_file="add_nfe_conti.tsv"

# Assume total alleles is twice the number of individuals, adjust accordingly
total_individuals=34029
total_alleles=$((total_individuals * 2))

# Add header to the output file
echo -e "nfe_positive\tnfe_negative" > "$output_file"

# Use awk to process the data and handle floating-point arithmetic
awk -v total_alleles="$total_alleles" 'BEGIN {FS=OFS="\t"}
NR > 1 {
    # Extract AF_nfe value
    af_nfe=$74;
    
    # Calculate positive and negative
    positive=af_nfe * total_alleles;
    negative=total_alleles - positive;
    
    # Write the calculated values to output
    print positive, negative;
}' "$input_file" >> "$output_file"

echo "Processing complete. New columns saved to $output_file"
