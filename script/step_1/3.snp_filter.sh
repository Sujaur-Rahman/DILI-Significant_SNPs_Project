for input_file in *.final.filtered.vcf.gz; 
do 
    output_file="${input_file%.vcf.gz}.snps.max2.vcf.gz"
    bcftools view -v snps -m2 -M2 $input_file -Oz -o $output_file
    bcftools index $output_file
    echo "Filtering complete for $input_file. Output saved to $output_file"
done
