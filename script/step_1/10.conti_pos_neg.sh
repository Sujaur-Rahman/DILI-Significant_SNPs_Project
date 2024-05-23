#!/bin/bash
##############
# Define the input VCF file and the output file
vcf_file="Allele_Count_NO_SNP_2.modified_no_metadata_eur_merged_cohort.vcf"
output_file="2.final_with_pos_neg.vcf"

# Process the header to include the new columns for Positive and Negative counts
grep '^#' "$vcf_file" | while read -r line; do
    if [[ $line == *CHROM* ]]; then
        echo -e "${line}\tPOSITIVE\tNEGATIVE"
    else
        echo "$line"
    fi
done > "$output_file"

# Read through the VCF file, skipping header lines, and process each data line
awk -F'\t' 'BEGIN {OFS="\t"}
!/^#/ {
  # Extract the necessary counts
  snp_count=$61  # Number of patients with the SNP
  no_snp_count=$62  # Number of patients without the SNP
  ac1_count=$63  # Number of patients with AC=1
  ac2_count=$64  # Number of patients with AC=2

  # Calculate Positive and Negative
  positive=ac2_count * 2 + ac1_count
  negative=no_snp_count * 2 + ac1_count

  # Print the original line with the Positive and Negative counts appended
  print $0, positive, negative
}' "$vcf_file" >> "$output_file"

echo "The file with added POSITIVE and NEGATIVE columns has been saved as $output_file"
