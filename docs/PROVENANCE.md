# Data Provenance and Verification

This repository is built from three clearly separated sources. Every value in the
README and the per-stage files is traceable to one of them.

## Sources

1. **Publication (authoritative).** Bari S.M., Ahammad I., Bhattacharjee A.,
   Shahabuddin A.M. (2025) *Whole genome sequence data of Aeromonas diversa SAU1,
   isolated from Tilapia (Oreochromis niloticus).* Data in Brief 59:111396.
   https://doi.org/10.1016/j.dib.2025.111396 (CC BY 4.0). All headline genome
   statistics and the ANI matrix are quoted from Tables 1-2 and the Data
   Description.

2. **NCBI deposit.** Assembly `GCA_040790265.1` (GenBank `JBFMMD000000000`),
   BioProject `PRJNA1135548`, BioSample `SAMN42485447`, SRA run `SRR29825452`.
   The deposited assembly is annotated by **NCBI PGAP v6.7**; the gene counts
   reported in the publication correspond to this PGAP annotation.

3. **NIB comprehensive-analysis service.** *Prokaryotic Genome Assembly and
   Annotation Service*, Bioinformatics Division, National Institute of
   Biotechnology (NIB), Bangladesh - Service Order 1-1-24, sample ID `AH3_raw`,
   client Sayed Mashequl Bari. Report:
   [`AH3_SAU_Annotation_Service_Report.pdf`](AH3_SAU_Annotation_Service_Report.pdf).
   Methodology (service report): Fastp (trimming), Unicycler (assembly), Prokka
   (annotation), MicrobeAnnotator (metabolic pathways), antiSMASH (BGCs), Abricate
   (AMR), CRISPRCasTyper (CRISPR).

## Annotation: PGAP vs Prokka

The **published** annotation is from NCBI PGAP v6.7 (3,945 genes / 3,823 CDS /
87 tRNA; Table 1). The NIB service additionally produced a **Prokka** annotation
(3,967 genes / 3,812 CDS / 88 tRNA), used internally for the functional analyses
and retained under [`../03_annotation/service_prokka/`](../03_annotation/service_prokka/).
The two differ because they are different pipelines; the PGAP annotation is the
authoritative record.

## Per-file provenance

| File | Source | Notes |
|------|--------|-------|
| `01_trimming/SAU1_quality_control_summary.html` | NIB service | QC/trimming summary (Fastp) |
| `02_assembly/SAU1_assembly_stats.txt` | Publication (Table 1) | consistent with service report |
| `03_annotation/SAU1_annotation_summary.txt` | Publication (Table 1) | PGAP counts |
| `03_annotation/service_prokka/*` | NIB service | Prokka annotation files |
| `04_species_id/SAU1_ANI_matrix.tsv` | Publication (Table 2) | JSpeciesWS |
| `05_amr_virulence/amr_abricate_resfinder.tsv` | NIB service | Abricate/ResFinder raw output |
| `06_functional/metabolic_module_completeness.tab` | NIB service | MicrobeAnnotator; 8 modules at 100% |
| `06_functional/metabolic_summary_heatmap.pdf` | NIB service | MicrobeAnnotator heatmap |
| `06_functional/crispr/*` | NIB service | CRISPRCasTyper output |
| `docs/AH3_SAU_Annotation_Service_Report.pdf` | NIB service | original service report |

## Verification performed

- Metabolic modules at 100% completeness counted directly from
  `metabolic_module_completeness.tab`: **8** (consistent with the service report and
  the publication).
- AMR gene set (`ampH_1`, `sul2_2`, `tet(A)_4`) and their coverage/identity read
  directly from `amr_abricate_resfinder.tsv` (consistent with the service report
  and the publication).
- BGCs: 0 (service report; folder `6.biosynthetic_gene_clusters` contains no
  cluster files).
- Assembly totals (33 contigs, 4,105,655 bp) agree between the publication, the
  service report, and the deposited assembly size.

## Not included (by design)

- Raw reads, assembly FASTA/graphs, and full PGAP/Prokka sequence files
  (`.gbff/.gff/.faa/.sqn`) - available from NCBI and the authors' storage.
- A VFDB virulence result file - the `pscR` virulence hit is reported in the
  publication but was not part of the service output; no local file exists.
