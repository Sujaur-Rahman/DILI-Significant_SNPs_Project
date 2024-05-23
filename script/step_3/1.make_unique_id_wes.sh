awk -F'\t' '{OFS="\t"; $(NF+1)=$1":"$2":"$4":"$5; print}' 2.final_with_pos_neg.vcf > 2.filtered_1.final_with_pos_neg.vcf
