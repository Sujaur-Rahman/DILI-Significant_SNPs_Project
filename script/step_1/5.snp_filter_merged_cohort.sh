bcftools view -v snps -m2 -M2 eur_merged_cohort.vcf.gz -Oz -o filtered_eur_merged_cohort.vcf.gz
bcftools index filtered_eur_merged_cohort.vcf.gz
echo "Filtering complete"
