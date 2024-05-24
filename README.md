# DILI Samples Analysis Project
![Mechanism of DILI](Figures/DILI_Pathogenesis.png) 
Mechanism of DILI (Source: https://link.springer.com/article/10.1007/s00204-020-02885-1?fromPaywallRec=true)
## Overview

This project focuses on the analysis of 97 Drug-Induced Liver Injury (DILI) samples, with a subset of 51 samples being of European descent. The race verification was performed using Peddy and is ongoing with PLINK and the 1000 Genomes Project database. The project is divided into three main steps: data filtering and preparation, annotation, and statistical analysis to identify significant SNPs.

## Data Filtering and Preparation

### Step 1: Filtering VCF Files

1. **Filter Samples Based on GQ and DP**
   - Criteria: DP ≥ 20 and GQ ≥ 30.
   - Removed multi-alleles and indels to ensure unique alleles for statistical analysis.
   - **Rationale**: Ensures clarity in allele frequency (AF) calculations, focusing on minor alleles.
   
2. **Merge Filtered VCF Files**
   - Used `bcftools` to merge VCF files.
   - Removed remaining multi-allelic SNPs from the merged VCF.
   
3. **Metadata Removal**
   - Removed metadata from the final merged VCF to streamline data analysis.
   - Calculated the number of patients with specific SNPs and their allele counts.
   
   **Script Link**: [Filter and Merge VCFs](script/step_1)

## Annotation

### Step 2: Annotating with ANNOVAR

1. **Convert VCF to ANNOVAR Input**
   - Annotated using ANNOVAR with `refGene`, `avsnp150`, and `gnomad312_genome` databases.
   - Focused on the allele frequency of 34,029 non-Finnish European (NFE) individuals from the gnomAD v3.1.2 database.

2. **Processing Annotated Data**
   - Removed `AAChange.refGene` column for flexibility.
   - Converted annotated CSV file to TSV format.
   - Extracted AF column for NFE population and other necessary columns.
   
   **Script Link**: [Annotate with ANNOVAR](scripts/annotate_annovar.sh)

## Statistical Analysis

### Step 3: Fisher's Exact Test

1. **Merge Data for Statistical Analysis**
   - Merged the outputs from Steps 1 and 2 using unique SNP IDs.
   - Filtered out SNPs without AF information in the gnomAD NFE population.
   - Final dataset: 287,517 SNPs.

2. **Construct Contingency Table**
   - Derived the number of positive and negative alleles for gnomAD population.
   - Performed Fisher's exact test to calculate p-values and odds ratios.
   - Applied a p-value threshold of \(5 \times 10^{-8}\) for significance.
   - Calculated False Discovery Rate (FDR).
   
   **Script Link**: [Fisher's Exact Test](scripts/fisher_test.sh)

## Results

- **Total SNPs Analyzed**: 301,433
- **SNPs with AF in gnomAD NFE**: 287,517
- **Significant SNPs (p < \(5 \times 10^{-8}\))**: 44,856

![Volcano Plot](Figures/final_volcano_plot.png)
Figure 2: Volcano Plot of SNP Association with DILI in European Samples
This volcano plot visualizes the association between single nucleotide polymorphisms (SNPs) and drug-induced liver injury (DILI) in 51 European samples. The x-axis represents the log2 fold change in allele frequencies between DILI-positive and DILI-negative groups, while the y-axis displays the -log10(p-value), indicating the statistical significance of each SNP. Red dots denote individual SNPs, with those above the blue and green dashed lines (corresponding to p-value thresholds of 5e-8 and 1e-5, respectively) considered statistically significant. Notably, multiple SNPs in the HLA-C region exhibit high significance, suggesting a strong association with DILI. Other significant SNPs include those in the MYO5B and CCDC188 regions, highlighting potential genetic factors involved in DILI susceptibility.

## Additional Information

- **Race Verification**: Initial verification with Peddy, ongoing verification with PLINK and 1000 Genomes Project.
- **Annotation Database**: gnomAD v3.1.2 for comprehensive allele frequency data.
- **Statistical Analysis**: Focused on identifying significant SNPs related to DILI using Fisher's exact test.

## Future Work

- Further validation of significant SNPs in larger datasets.
- Integration with functional genomics data to understand the biological implications of identified SNPs.
- Development of visualization tools to better interpret and present findings.

**Figure Suggestions**:
1. A flowchart of the data filtering and preparation process.
2. A summary table of the SNP filtering and annotation results.
3. A Manhattan plot of the significant SNPs identified in the study.

**Contact Information**:
For further details or collaboration, please contact [Your Name] at [Your Email].

---

By following the steps outlined above, this project aims to provide a robust analysis of genetic variants associated with DILI, leveraging advanced bioinformatics tools and statistical methods to ensure accurate and meaningful results.
