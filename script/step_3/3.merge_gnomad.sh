#!/bin/bash
########################
# This awk command processes two files: gnomad2.tsv and patient.vcf
# It matches records based on the ID in the 66th column of patient.vcf with the ID in the 11th column of gnomad2.tsv,
# and merges the lines from both files into a new file: merged_output.tsv.

awk '
    # Preload gnomad2.tsv into an array, skip header
    # The NR==FNR condition is true only while reading the first file (gnomad2.tsv).
    NR==FNR && NR>1 {
        # Store the entire line from gnomad2.tsv in an array with the ID as the key
        gnomad[$12] = $0;
        next # Skip to the next record
    }

    # Process patient.vcf, skip its header and check for a match
    FNR > 1 && ($67 in gnomad) {
        # If the ID from patient.vcf ($66) matches an ID in the gnomad array,
        # print the line from patient.vcf (tab-separated, as FS is now set to "\t")
        # and append the matching line from gnomad2.tsv (also tab-separated).
        print $0 "\t" gnomad[$67]
    }
' FS="\t" 2.final_cleaned_avsnp_nfe.tsv FS="\t" 2.filtered_1.final_with_pos_neg.vcf > merged_output.tsv

# This script assumes that fields in both gnomad2.tsv and patient.vcf are separated by tabs.
# The output file, merged_output.tsv, will contain the combined lines from both files,
# for records with matching IDs, also separated by tabs.
