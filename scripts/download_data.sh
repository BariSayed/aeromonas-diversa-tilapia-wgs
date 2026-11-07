#!/bin/bash
# Download the deposited Aeromonas diversa SAU1 data from NCBI.
# Requires: ncbi-datasets-cli and sra-tools (see environment.yml).
set -euo pipefail

mkdir -p 00_raw_data 02_assembly

# --- Genome assembly (GenBank JBFMMD000000000 / GCA_040790265.1) --------------
datasets download genome accession GCA_040790265.1 \
  --include genome,gff3,protein,gbff \
  --filename 02_assembly/GCA_040790265.1.zip
unzip -o 02_assembly/GCA_040790265.1.zip -d 02_assembly/

# --- Raw Illumina reads (SRA run SRR29825452) --------------------------------
prefetch SRR29825452 -O 00_raw_data/
fasterq-dump SRR29825452 -O 00_raw_data/ --split-files
gzip -f 00_raw_data/SRR29825452_1.fastq 00_raw_data/SRR29825452_2.fastq

echo "Download complete."
echo "BioProject PRJNA1135548 | BioSample SAMN42485447 | SRA SRR29825452 | Assembly GCA_040790265.1"
