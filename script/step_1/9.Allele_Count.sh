#!/bin/bash
##########
vcf_file="NO_SNP_2.modified_no_metadata_eur_merged_cohort.vcf"
final_output_file="Allele_Count_${vcf_file}"

# Extract the header and modify the #CHROM line to add new columns for AC=1_COUNT and AC=2_COUNT
grep '^#' $vcf_file | while read -r line; do
    if [[ $line == *CHROM* ]]; then
        echo -e "${line}\tAC=1_COUNT\tAC=2_COUNT" # Directly modify the #CHROM line to include new columns
    else
        echo "$line" # Echo other header lines unmodified
    fi
done > $final_output_file

# Process the file with awk to calculate and add AC=1_COUNT and AC=2_COUNT columns
awk -F'\t' '
    !/^#/ { # Skip header lines
        ac1_count=0
        ac2_count=0
        for (i=10; i<=NF; i++) {
            split($i, arr, ":")
            genotype=arr[1]
            if (genotype == "0/1") ac1_count++
            if (genotype == "1/1") ac2_count++
        }
        print $0"\t"ac1_count"\t"ac2_count
    }
' $vcf_file >> $final_output_file

echo "Final modified file is saved as $final_output_file"
