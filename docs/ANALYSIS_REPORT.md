# Analysis Report - Aeromonas diversa SAU1

Draft whole-genome sequence of *Aeromonas diversa* strain SAU1, isolated from a
diseased Nile tilapia (*Oreochromis niloticus*) in a Recirculating Aquaculture
System at Sher-e-Bangla Agricultural University, Dhaka, Bangladesh. This report
summarises the results reported in Bari et al. (2025), Data in Brief 59:111396
(https://doi.org/10.1016/j.dib.2025.111396), and their provenance (see
[`PROVENANCE.md`](PROVENANCE.md)).

## 1. Sequencing

Genomic DNA (Qiagen DNeasy Blood & Tissue kit) was sequenced on the Illumina MiSeq
platform (paired-end, 2 x 150 bp) at Wuhan Tianyi Huayu Gene Technology Co., Ltd.,
China. Reads were trimmed with Fastp v0.23.2.

| Metric | Value |
|--------|-------|
| No. of Illumina reads | 25,609,650 |
| Total bases | 3,841,447,500 bp |
| Read length | 150 bp |
| Average coverage | 945.5x |

## 2. Assembly and annotation

De novo assembly with Unicycler v0.4.8; the deposited genome was annotated with NCBI
PGAP v6.7.

| Metric | Value |
|--------|-------|
| Assembly size | 4,105,655 bp (~4.1 Mb) |
| Contigs | 33 |
| N50 / L50 | 384,764 bp / 4 |
| Longest / shortest contig | 729,309 / 1,235 bp |
| GC content | 61.63% |
| Completeness | 99.5% |
| Total genes (PGAP) | 3,945 |
| Protein-coding genes (PGAP) | 3,823 |
| rRNA / tRNA (PGAP) | 3 / 87 |
| ncRNA (total) | 122 |
| Pseudogenes | 25 |

## 3. Species identification

ANI (JSpeciesWS) placed the isolate within *A. diversa* at **98.83%** against the
type strain CDC 2478-85 - above the species threshold and clearly separated from
*A. schubertii* (~88.8%). Full matrix: `04_species_id/SAU1_ANI_matrix.tsv`.

## 4. Antimicrobial resistance and virulence

Abricate/ResFinder identified three AMR gene homologs: `ampH_1` (beta-lactam;
94.09% coverage, 80.68% identity), `sul2_2` (sulfonamide; 100%/100%), and
`tet(A)_4` (tetracycline; 100%/100%). The publication additionally reports one
virulence gene, `pscR` (type III secretion system), identified with VFDB (no local
file). Findings are genotype-based; see `05_amr_virulence/INTERPRETATION.md`.

## 5. Functional genomics

- Metabolic pathways (MicrobeAnnotator v2.0.5): 8 KEGG modules at 100% completeness
  of 394 assessed (M00844, M00022, M00024, M00025, M00579, M00005, M00127, M00851).
- Biosynthetic gene clusters (antiSMASH v6): none detected.
- CRISPR-Cas (CRISPRCasTyper v1.4.1): one CRISPR array on Contig4 (predicted subtype
  III-A).

## 6. Phylogeny

A 16S rRNA gene tree (BLAST v2.16.0 -> MAFFT v7.525 -> UPGMA -> iTOL v6) placed SAU1
among related *Aeromonas* species (publication, Fig. 2).

## 7. Data availability

| Resource | Accession |
|----------|-----------|
| BioProject | PRJNA1135548 |
| BioSample | SAMN42485447 |
| WGS assembly (GenBank) | JBFMMD000000000 / GCA_040790265.1 |
| SRA raw reads | SRR29825452 |
