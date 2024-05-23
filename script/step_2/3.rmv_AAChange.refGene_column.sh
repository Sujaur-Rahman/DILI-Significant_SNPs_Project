#####This column was causing problem in the format after converting csv to tsv file and thus causing problem in the downstream analysis.

awk -F, '{ $10=""; sub(",,",","); print }' OFS=, filtered_eur_merged_cohort.hg38_multianno.csv > 2.filtered_eur_merged_cohort.hg38_multianno.csv
