# Whole-Genome Sequence of *Aeromonas diversa* SAU1 from Nile Tilapia (*Oreochromis niloticus*)

[![DOI](https://img.shields.io/badge/DOI-10.1016%2Fj.dib.2025.111396-blue.svg)](https://doi.org/10.1016/j.dib.2025.111396)
[![Data: NCBI](https://img.shields.io/badge/NCBI-GCA__040790265.1-1f6feb.svg)](https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_040790265.1/)
[![Code License: MIT](https://img.shields.io/badge/Code%20License-MIT-green.svg)](LICENSE)
[![Article License: CC BY 4.0](https://img.shields.io/badge/Article%20License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

This repository provides the analysis documentation, workflow, and curated output
files supporting the published draft whole-genome sequence of *Aeromonas diversa*
strain **SAU1**, isolated from a diseased Nile tilapia (*Oreochromis niloticus*)
reared in a Recirculating Aquaculture System (RAS) in Bangladesh.

**Associated publication**

> Bari, S.M., Ahammad, I., Bhattacharjee, A., & Shahabuddin, A.M. (2025).
> *Whole genome sequence data of Aeromonas diversa SAU1, isolated from Tilapia
> (Oreochromis niloticus).* **Data in Brief**, 59, 111396.
> https://doi.org/10.1016/j.dib.2025.111396 (open access, CC BY 4.0)

---

## Contents

- [1. Data provenance](#1-data-provenance)
- [2. Strain and sample metadata](#2-strain-and-sample-metadata)
- [3. Data availability (NCBI)](#3-data-availability-ncbi)
- [4. Genome assembly and annotation statistics](#4-genome-assembly-and-annotation-statistics)
- [5. Species identification (ANI)](#5-species-identification-ani)
- [6. Antimicrobial resistance and virulence](#6-antimicrobial-resistance-and-virulence)
- [7. Functional genomics](#7-functional-genomics)
- [8. Phylogeny](#8-phylogeny)
- [9. Bioinformatics workflow and software](#9-bioinformatics-workflow-and-software)
- [10. Reproducing the analysis](#10-reproducing-the-analysis)
- [11. Repository structure](#11-repository-structure)
- [12. Citation](#12-citation)
- [13. License](#13-license)
- [14. Acknowledgements](#14-acknowledgements)

---

## 1. Data provenance

This repository distinguishes three sources, each labelled where it is used:

1. **Published article (authoritative record).** All headline genome statistics
   (Section 4) are quoted from Bari et al. (2025), Tables 1–2.
2. **NCBI deposit.** The genome assembly was deposited at NCBI and **annotated by
   the NCBI Prokaryotic Genome Annotation Pipeline (PGAP) v6.7**; the gene counts
   reported in the publication and in this README correspond to the PGAP
   annotation of assembly `GCA_040790265.1`.
3. **Comprehensive genome analysis service.** Read trimming, assembly, and the
   downstream functional characterisation (metabolic pathways, antimicrobial
   resistance, biosynthetic gene clusters, CRISPR) were produced by the
   *Prokaryotic Genome Assembly and Annotation Service* of the **Bioinformatics
   Division, National Institute of Biotechnology (NIB), Bangladesh** (Service Order
   1-1-24; sample ID `AH3_raw`). The service report is archived at
   [`docs/AH3_SAU_Annotation_Service_Report.pdf`](docs/AH3_SAU_Annotation_Service_Report.pdf).
   This service used **Prokka** for its internal annotation; the resulting files
   are kept, clearly labelled, under
   [`03_annotation/service_prokka/`](03_annotation/service_prokka/) and report
   slightly different counts from the PGAP deposit because they come from a
   different annotation pipeline.

Full details and a per-file provenance table are given in
[`docs/PROVENANCE.md`](docs/PROVENANCE.md).

> **Large files are not stored here.** Raw reads, the assembly FASTA, assembly
> graphs, and full PGAP sequence files are available from NCBI (Section 3) and on
> the authors' storage. Only documentation and small summary outputs are version
> controlled (see [`.gitignore`](.gitignore) and
> [`scripts/download_data.sh`](scripts/download_data.sh)).

---

## 2. Strain and sample metadata

| Field | Value | Source |
|-------|-------|--------|
| Strain | SAU1 (service sample ID `AH3_raw`) | Paper / service report |
| Organism | *Aeromonas diversa* (confirmed by ANI) | Paper |
| Host | Nile tilapia (*Oreochromis niloticus*), diseased | Paper |
| Isolation source | Recirculating Aquaculture System (RAS) | Paper |
| Institution | Dept. of Aquatic Animal Health Management, Sher-e-Bangla Agricultural University | Paper |
| Location | Dhaka, Bangladesh (23°46′18.8″N, 90°22′19.3″E) | Paper |
| Year of isolation | 2023 | Paper |
| Clinical signs | Skin/fin haemorrhages, exophthalmia, abdominal distension | Paper |
| DNA extraction | Qiagen DNeasy Blood & Tissue kit | Paper |
| Sequencing provider | Wuhan Tianyi Huayu Gene Technology Co., Ltd., China | Paper |
| Platform / layout | Illumina MiSeq, paired-end 2 × 150 bp | Paper |

---

## 3. Data availability (NCBI)

| Resource | Accession |
|----------|-----------|
| BioProject | [PRJNA1135548](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJNA1135548) |
| BioSample | [SAMN42485447](https://www.ncbi.nlm.nih.gov/biosample/?term=SAMN42485447) |
| WGS assembly (GenBank) | JBFMMD000000000 — [GCA_040790265.1](https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_040790265.1/) |
| SRA raw reads (run) | [SRR29825452](https://www.ncbi.nlm.nih.gov/sra/?term=SRR29825452) |

Retrieve the deposited assembly and reads with
[`scripts/download_data.sh`](scripts/download_data.sh).

---

## 4. Genome assembly and annotation statistics

Values below are quoted from Bari et al. (2025), **Table 1** (annotation by NCBI
PGAP v6.7).

| Metric | Value |
|--------|-------|
| No. of Illumina reads | 25,609,650 |
| Total bases | 3,841,447,500 bp |
| Read length | 150 bp |
| Average coverage | 945.5× |
| Genome completeness | 99.5% |
| Assembly size | 4,105,655 bp (~4.1 Mb) |
| Contigs | 33 |
| N50 / L50 | 384,764 bp / 4 |
| Longest / shortest contig | 729,309 / 1,235 bp |
| Mean / median contig size | 124,413.8 / 60,577 bp |
| GC content | 61.63% |
| Total genes (PGAP) | 3,945 |
| Protein-coding genes (PGAP) | 3,823 |
| rRNA / tRNA (PGAP) | 3 / 87 |
| ncRNA (total) | 122 |
| Pseudogenes | 25 |

> The NIB service's internal **Prokka** annotation reported 3,967 genes / 3,812
> CDS / 88 tRNA (see [`03_annotation/service_prokka/`](03_annotation/service_prokka/));
> these differ from the PGAP counts above and are provided for completeness only.

---

## 5. Species identification (ANI)

Taxonomic assignment was performed by Average Nucleotide Identity (ANI) using
**JSpeciesWS** (Bari et al. 2025, Table 2; reproduced in
[`04_species_id/SAU1_ANI_matrix.tsv`](04_species_id/SAU1_ANI_matrix.tsv)).

Strain SAU1 shares **98.83% ANI** with the *A. diversa* type strain CDC 2478-85 —
above the 95–96% species-delineation threshold and clearly separated from the
next-closest species *A. schubertii* (~88.8%) — confirming the isolate as
***Aeromonas diversa***.

---

## 6. Antimicrobial resistance and virulence

**Antimicrobial resistance** — Abricate against the ResFinder database. Values are
read directly from the service output file
[`05_amr_virulence/amr_abricate_resfinder.tsv`](05_amr_virulence/amr_abricate_resfinder.tsv):

| Gene | %Coverage | %Identity | ResFinder accession | Predicted resistance |
|------|-----------|-----------|---------------------|----------------------|
| `ampH_1` | 94.09 | 80.68 | AJ276031 | Beta-lactam |
| `sul2_2` | 100.00 | 100.00 | GQ421466 | Sulfonamide |
| `tet(A)_4` | 100.00 | 100.00 | AJ517790 | Tetracycline |

**Virulence** — the publication reports a single virulence gene, `pscR` (type III
secretion system translocation protein), identified with the VFDB. VFDB screening
was performed separately by the authors and is **not** part of the service output;
no VFDB result file is included in this repository. See the publication for
details.

See [`05_amr_virulence/INTERPRETATION.md`](05_amr_virulence/INTERPRETATION.md).
All findings are genotype-based and indicate the presence of genes predicted to
confer the listed activities, not phenotypic resistance confirmed by MIC testing.

---

## 7. Functional genomics

| Analysis | Tool | Result | File |
|----------|------|--------|------|
| Metabolic pathway completeness | MicrobeAnnotator | **8 KEGG modules at 100% completeness** (of 394 assessed) | [`06_functional/metabolic_module_completeness.tab`](06_functional/metabolic_module_completeness.tab) |
| Secondary metabolite BGCs | antiSMASH | **0 clusters detected** | service report |
| CRISPR–Cas | CRISPRCasTyper | **1 CRISPR array** (predicted subtype III-A) | [`06_functional/crispr/`](06_functional/crispr/) |

The 8 fully complete (100%) KEGG modules are: M00844 (arginine biosynthesis),
M00022 (shikimate pathway), M00024 (phenylalanine biosynthesis), M00025 (tyrosine
biosynthesis), M00579 (phosphate acetyltransferase–acetate kinase pathway), M00005
(PRPP biosynthesis), M00127 (thiamine biosynthesis), and M00851 (carbapenem
resistance). See [`06_functional/README.md`](06_functional/README.md).

---

## 8. Phylogeny

A 16S rRNA gene phylogeny (Bari et al. 2025, Fig. 2) was constructed by retrieving
related sequences with NCBI-BLAST (v2.16.0), aligning with MAFFT (v7.525),
inferring a tree by the UPGMA method, and visualising it in iTOL (v6). No sequence
or tree file for this step is included; see
[`07_phylogeny/README.md`](07_phylogeny/README.md) and the publication (Fig. 2).

---

## 9. Bioinformatics workflow and software

The workflow follows the Methods of Bari et al. (2025) and the NIB service report.
Software versions are those stated in the publication; where the publication did
not state a version, none is asserted here.

| Stage | Software | Version (as published) | Output folder |
|-------|----------|------------------------|---------------|
| Read trimming | Fastp | 0.23.2 | `01_trimming/` |
| De novo assembly | Unicycler | 0.4.8 | `02_assembly/` |
| Genome annotation (deposited) | NCBI PGAP | 6.7 | `03_annotation/` |
| Genome annotation (service) | Prokka | not stated | `03_annotation/service_prokka/` |
| Species identification (ANI) | JSpeciesWS | web service | `04_species_id/` |
| AMR | Abricate (ResFinder 4.5) | 0.5 | `05_amr_virulence/` |
| Virulence | VFDB | not stated | (published result only) |
| Metabolic pathways | MicrobeAnnotator | 2.0.5 | `06_functional/` |
| Biosynthetic gene clusters | antiSMASH | 6 | `06_functional/` |
| CRISPR–Cas | CRISPRCasTyper | 1.4.1 | `06_functional/crispr/` |
| 16S phylogeny | BLAST / MAFFT / iTOL | 2.16.0 / 7.525 / 6 | `07_phylogeny/` |
| Circular genome plot | Proksee | 1.0.0a6 | `08_visualization/` |

Per the publication, all command-line tools were run with default parameters. The
documented, runnable workflow is in
[`scripts/01_full_pipeline.sh`](scripts/01_full_pipeline.sh); record exact resolved
versions at run time with
[`scripts/record_versions.sh`](scripts/record_versions.sh).

---

## 10. Reproducing the analysis

```bash
# 1. Create the software environment (conda/mamba)
conda env create -f environment.yml
conda activate adiversa-sau1-wgs

# 2. Download the deposited assembly and raw reads from NCBI
bash scripts/download_data.sh

# 3. Record exact tool and database versions (for the methods section)
bash scripts/record_versions.sh > versions.txt

# 4. Run the documented workflow
bash scripts/01_full_pipeline.sh
```

NCBI PGAP is run through its own containerised pipeline
(https://github.com/ncbi/pgap) and is not installed by `environment.yml`. ANI
(JSpeciesWS), the circular plot (Proksee), and the tree view (iTOL) are web
services.

---

## 11. Repository structure

```
.
├── 01_trimming/          # Read QC / trimming summary (Fastp); quality_control_summary.html
├── 02_assembly/          # Assembly statistics (Unicycler)
├── 03_annotation/        # PGAP-annotation description (published)
│   └── service_prokka/   # NIB-service Prokka annotation files (labelled; counts differ)
├── 04_species_id/        # ANI matrix (JSpeciesWS; paper Table 2)
├── 05_amr_virulence/     # AMR table (Abricate/ResFinder) + interpretation
├── 06_functional/        # Metabolic pathways, BGC, CRISPR
│   └── crispr/           # CRISPRCasTyper output
├── 07_phylogeny/         # 16S rRNA phylogeny (documentation)
├── 08_visualization/     # Circular genome plot (Proksee) documentation
├── docs/                 # Analysis report, provenance, NIB service report (PDF)
├── scripts/              # Workflow, data-download, version-recording scripts
├── environment.yml       # Conda environment specification
├── CITATION.cff          # Citation metadata
└── LICENSE               # MIT (code and documentation)
```

---

## 12. Citation

If you use this genome or repository, please cite:

> Bari, S.M., Ahammad, I., Bhattacharjee, A., & Shahabuddin, A.M. (2025). Whole
> genome sequence data of *Aeromonas diversa* SAU1, isolated from Tilapia
> (*Oreochromis niloticus*). *Data in Brief*, 59, 111396.
> https://doi.org/10.1016/j.dib.2025.111396

Machine-readable metadata is in [`CITATION.cff`](CITATION.cff).

---

## 13. License

Code and documentation in this repository are released under the **MIT License**
([`LICENSE`](LICENSE)). The associated article is open access under **CC BY 4.0**.
Sequence data deposited at NCBI are subject to NCBI's terms of use.

---

## 14. Acknowledgements

Comprehensive genome assembly and analysis were performed by the Bioinformatics
Division, National Institute of Biotechnology (NIB), Bangladesh (Prokaryotic
Genome Assembly and Annotation Service, Order 1-1-24). Genome annotation of the
deposited assembly was performed by the NCBI Prokaryotic Genome Annotation
Pipeline (PGAP).
