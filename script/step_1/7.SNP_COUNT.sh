#!/bin/bash
#####
# Your original VCF file
vcf_file="no_metadata_eur_merged_cohort.vcf"

# Temporary file to hold intermediate results
tmp_file=$(mktemp)

# Output file with the added column for SNP count
output_file="2.modified_${vcf_file}"

# Copy the header to the output file and modify the #CHROM line to add new column name
grep '^#' $vcf_file | while read -r line; do
    if [[ $line == *CHROM* ]]; then
        echo -e "${line}\tSNP_COUNT"
    else
        echo "$line"
    fi
done > $output_file

# Process the VCF file, skipping header lines
grep -v '^#' $vcf_file | while read -r line; do
    # Extract all sample fields into an array
    IFS=$'\t' read -r -a fields <<< "$line"
    samples=("${fields[@]:9}") # Extract samples starting from the 10th field
    snp_count=0
    for sample in "${samples[@]}"; do
        if [[ $sample != "./.:.:.:.:." ]]; then # Check if SNP is present
            ((snp_count++))
        fi
    done
    # Add the SNP count as a new column
    echo -e "$line\t$snp_count"
done > $tmp_file

# Append the modified lines to the output file
cat $tmp_file >> $output_file

# Remove the temporary file
rm $tmp_file

echo "Modified file is saved as $output_file"
