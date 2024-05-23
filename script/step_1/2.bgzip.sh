for vcf in *.filtered.vcf
do
  bgzip -c $vcf > "${vcf}.gz"
  rm $vcf  # Optional: remove the original file after compressing
done
##
