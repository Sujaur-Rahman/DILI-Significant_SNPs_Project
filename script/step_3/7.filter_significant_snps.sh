#######This line worked when there is 5e-08 type values
awk -F'\t' 'NR==1 || ($80 + 0) < 5e-08' pvalue_Python_final_merged_output.tsv > nfe_pvalues_filtered_snp.tsv
