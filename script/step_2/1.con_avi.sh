#!/bin/bash

# Define paths
ANNOVAR_DIR="/home/mohammad/all_data/xist_gene/annovar"
VCF_FILE="/media/iscsi10TB/mohammad/nfe_data_filter_annotation/annotation/filtered_eur_merged_cohort.vcf" # Path to your merged VCF file
OUTPUT_DIR="/media/iscsi10TB/mohammad/nfe_data_filter_annotation/annotation"

# Ensure output directory exists
mkdir -p ${OUTPUT_DIR}

# Convert merged VCF to ANNOVAR format
# Extract base name for the output file
BASE_NAME=$(basename ${VCF_FILE} .vcf)

# Convert VCF to ANNOVAR format
echo "Converting ${VCF_FILE} to ANNOVAR format..."
perl ${ANNOVAR_DIR}/convert2annovar.pl -format vcf4 -allsample -withfreq ${VCF_FILE} > ${OUTPUT_DIR}/${BASE_NAME}.avinput

echo "Conversion completed. Output file: ${OUTPUT_DIR}/${BASE_NAME}.avinput"
