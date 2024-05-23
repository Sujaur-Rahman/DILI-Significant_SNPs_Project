#!/bin/bash
##############
# Your modified VCF file with SNP_COUNT, AC=1_COUNT, and AC=2_COUNT columns
vcf_file="2.modified_no_metadata_eur_merged_cohort.vcf"

# Final output file with an additional column for the count of patients without each SNP
enhanced_output_file="NO_SNP_${vcf_file}"

# Copy the header to the enhanced output file and modify the #CHROM line to add new column name
grep '^#' $vcf_file | while read -r line; do
    if [[ $line == *CHROM* ]]; then
        echo -e "${line}\tNO_SNP_COUNT" # Directly modify the #CHROM line to include the new column
    else
        echo "$line" # Echo other header lines unmodified
    fi
done > $enhanced_output_file

# Process the VCF file, skipping header lines
grep -v '^#' $vcf_file | while read -r line; do
    IFS=$'\t' read -r -a fields <<< "$line"
    # The SNP_COUNT is now directly extracted from the 107th column, assuming the first column is index 1
    snp_count="${fields[60]}" # Adjust the index by subtracting 1 because arrays are 0-indexed
    no_snp_count=$((51 - snp_count))
    # Add the NO_SNP_COUNT as a new column and output the modified line
    echo -e "$line\t$no_snp_count"
done >> $enhanced_output_file

echo "Enhanced file with NO_SNP_COUNT is saved as $enhanced_output_file"
