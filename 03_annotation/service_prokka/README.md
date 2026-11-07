# NIB service annotation (Prokka)

These files are the internal annotation produced by the *Prokaryotic Genome
Assembly and Annotation Service* of the Bioinformatics Division, National Institute
of Biotechnology (NIB), Bangladesh (Service Order 1-1-24; sample `AH3_raw`), using
**Prokka**. They were used as input to the downstream functional analyses
(metabolic pathways, AMR, CRISPR).

| File | Description |
|------|-------------|
| `annotation_summary.txt` | Feature counts (Prokka) |
| `annotation.txt` | Feature counts + contig statistics (Prokka/RAST) |
| `annotation_feature_table.tsv` | Per-feature annotation table |

**Note on counts.** Prokka reports 3,967 genes / 3,812 CDS / 88 tRNA. The
**published** annotation of the deposited genome was produced by NCBI PGAP v6.7 and
reports 3,945 genes / 3,823 CDS / 87 tRNA (Bari et al. 2025, Table 1). The two sets
differ because they are different annotation pipelines; the PGAP annotation is the
authoritative record.
