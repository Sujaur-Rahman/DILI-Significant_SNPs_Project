for vcf in *.final.vcf
do
  awk -F'\t' '
    /^#/ {print; next}  # Print all header lines
    {
      split($10, arr, ":");  # Assuming the first sample is in column 10
      dp = arr[3];  # Adjust index if DP is not the 3rd subfield
      gq = arr[4];  # Adjust index if GQ is not the 4th subfield
      if (dp >= 20 && gq >= 30) print  # Print lines where DP >= 20 and GQ >= 30
    }
  ' $vcf > "${vcf%.vcf}.filtered.vcf"
done

