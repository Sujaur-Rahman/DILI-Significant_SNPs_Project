#!/bin/bash

# Define paths
ANNOVAR_DIR="/media/iscsi10TB/mohammad/annovar"
AVINPUT_FILE="/media/iscsi10TB/mohammad/nfe_data_filter_annotation/annotation/filtered_eur_merged_cohort.avinput" # Assuming this is the correct path to your .avinput file
OUTPUT_DIR="/media/iscsi10TB/mohammad/nfe_data_filter_annotation/annotation"
DB_DIR="${ANNOVAR_DIR}/humandb"

# Genome build
BUILD="hg38"

# Ensure output directory exists
mkdir -p ${OUTPUT_DIR}

# Annotate converted file
# Extract base name
BASE_NAME=$(basename ${AVINPUT_FILE} .avinput)

# Run ANNOVAR annotation
echo "Annotating ${BASE_NAME}..."
perl ${ANNOVAR_DIR}/table_annovar.pl ${AVINPUT_FILE} ${DB_DIR} \
    -buildver ${BUILD} \
    -out ${OUTPUT_DIR}/${BASE_NAME} \
    -remove \
    -protocol refgene,avsnp150,gnomad312_genome \
    -operation g,f,f \
    -nastring . -csvout -polish
    -includeinfo

echo "Annotation process completed."
