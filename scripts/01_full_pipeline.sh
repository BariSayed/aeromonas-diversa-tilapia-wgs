#!/bin/bash
# =============================================================================
# Reproducible whole-genome analysis workflow for Aeromonas diversa strain SAU1
# Platform: Illumina MiSeq, 2 x 150 bp paired-end
#
# This script reproduces the analysis described in:
#   Bari S.M., Ahammad I., Bhattacharjee A., Shahabuddin A.M. (2025)
#   Whole genome sequence data of Aeromonas diversa SAU1, isolated from Tilapia
#   (Oreochromis niloticus). Data in Brief 59:111396.
#   https://doi.org/10.1016/j.dib.2025.111396
#
# Per the publication, all command-line tools were run with default parameters.
# Software versions are pinned in environment.yml to those stated in the paper.
#
# Usage:
#   conda env create -f environment.yml && conda activate adiversa-sau1-wgs
#   bash scripts/download_data.sh                 # fetch reads/assembly from NCBI
#   bash scripts/record_versions.sh > versions.txt
#   bash scripts/01_full_pipeline.sh
# =============================================================================
set -euo pipefail

# ---- Inputs (edit paths as needed) ------------------------------------------
RAW_R1="00_raw_data/SRR29825452_1.fastq.gz"
RAW_R2="00_raw_data/SRR29825452_2.fastq.gz"
THREADS="${THREADS:-16}"

mkdir -p 01_trimming 02_assembly 03_annotation 04_species_id \
         05_amr_virulence 06_functional 07_phylogeny 08_visualization

# -----------------------------------------------------------------------------
# Stage 1 - Read trimming (Fastp v0.23.2)
# -----------------------------------------------------------------------------
fastp -i "$RAW_R1" -I "$RAW_R2" \
  -o 01_trimming/SAU1_R1.trimmed.fastq.gz \
  -O 01_trimming/SAU1_R2.trimmed.fastq.gz \
  --thread "$THREADS" \
  --html 01_trimming/SAU1_fastp.html --json 01_trimming/SAU1_fastp.json

# -----------------------------------------------------------------------------
# Stage 2 - De novo assembly (Unicycler v0.4.8)
# -----------------------------------------------------------------------------
unicycler -1 01_trimming/SAU1_R1.trimmed.fastq.gz \
          -2 01_trimming/SAU1_R2.trimmed.fastq.gz \
          -o 02_assembly -t "$THREADS"
ASSEMBLY="02_assembly/assembly.fasta"

# -----------------------------------------------------------------------------
# Stage 3 - Genome annotation
#   Published annotation: NCBI PGAP v6.7 (the deposited assembly GCA_040790265.1
#   is PGAP-annotated). PGAP is run via its own containerised pipeline and is NOT
#   part of environment.yml:
#       https://github.com/ncbi/pgap
#       ./pgap.py -r -o 03_annotation -g "$ASSEMBLY" -s "Aeromonas diversa"
# -----------------------------------------------------------------------------
echo "[Stage 3] Run NCBI PGAP v6.7 separately (see comments and README)."

# -----------------------------------------------------------------------------
# Stage 4 - Species identification (ANI)
#   In the publication, ANI was computed with the JSpeciesWS web service
#   (https://jspecies.ribohost.com/jspeciesws/); the matrix is in
#   04_species_id/SAU1_ANI_matrix.tsv. No command-line step is required.
# -----------------------------------------------------------------------------
echo "[Stage 4] Compute ANI via JSpeciesWS (web); matrix provided in 04_species_id/."

# -----------------------------------------------------------------------------
# Stage 5 - Antimicrobial resistance and virulence (Abricate v0.5)
#   AMR: ResFinder database; Virulence: VFDB.
# -----------------------------------------------------------------------------
abricate --db resfinder "$ASSEMBLY" > 05_amr_virulence/SAU1_amr_resfinder.tsv
abricate --db vfdb      "$ASSEMBLY" > 05_amr_virulence/SAU1_virulence_vfdb.tsv

# -----------------------------------------------------------------------------
# Stage 6 - Functional genomics
# -----------------------------------------------------------------------------
# 6a. Metabolic pathway completeness (MicrobeAnnotator v2.0.5)
#     Requires a prebuilt MicrobeAnnotator database (-d) and a protein FASTA.
microbeannotator -i 03_annotation/proteins.faa \
  -o 06_functional/microbeannotator_output \
  -d "${MICROBEANNOTATOR_DB:?set MICROBEANNOTATOR_DB to the database path}" \
  -m diamond -t "$THREADS"
# 6b. Secondary metabolite BGCs (antiSMASH v6)
antismash "$ASSEMBLY" --output-dir 06_functional/antismash_output --cpus "$THREADS"
# 6c. CRISPR-Cas (CRISPRCasTyper v1.4.1)
cctyper "$ASSEMBLY" 06_functional/cctyper_output

# -----------------------------------------------------------------------------
# Stage 7 - 16S rRNA phylogeny
#   Retrieve related 16S sequences (NCBI-BLAST v2.16.0), align (MAFFT v7.525),
#   infer a UPGMA tree, and visualise in iTOL v6.
# -----------------------------------------------------------------------------
# Example (provide 07_phylogeny/16S_sequences.fasta with the query + hits):
mafft --auto 07_phylogeny/16S_sequences.fasta > 07_phylogeny/16S_aligned.fasta

# -----------------------------------------------------------------------------
# Stage 8 - Circular genome visualisation (Proksee v1.0.0a6, web)
#   Upload the assembly + annotation to https://proksee.ca/ and export the figure.
# -----------------------------------------------------------------------------
echo "[Stage 8] Generate the circular plot at https://proksee.ca/ (web)."

echo "Workflow complete."
