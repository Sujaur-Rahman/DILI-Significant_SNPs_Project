awk -F'\t' '{OFS="\t"; $(NF+1)=$1":"$2":"$4":"$5; print}' avsnp_nfe.tsv > 2.final_cleaned_avsnp_nfe.tsv
