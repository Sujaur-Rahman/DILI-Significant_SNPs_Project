for vcf in *.final.vcf
do
  awk -F'\t' '
    /^#/ {print; next}  # Print all header lines
    {
      split($10, arr, ":"); 
      dp = arr[3]; 
      gq = arr[4]; 
      if (dp >= 20 && gq >= 30) print  # Print lines where DP >= 20 and GQ >= 30
    }
  ' $vcf > "${vcf%.vcf}.filtered.vcf"
done

