# Stage 3 - Genome annotation

## Published annotation (NCBI PGAP)

The genome annotation reported in the publication was produced by the **NCBI
Prokaryotic Genome Annotation Pipeline (PGAP) v6.7**. It is the annotation attached
to the deposited assembly **GCA_040790265.1** (GenBank **JBFMMD000000000**).

Summary counts (Bari et al. 2025, Table 1) are in
[`SAU1_annotation_summary.txt`](SAU1_annotation_summary.txt):

| Feature | Count |
|---------|-------|
| Total genes | 3,945 |
| Protein-coding genes | 3,823 |
| rRNA | 3 |
| tRNA | 87 |
| ncRNA (total) | 122 |
| Pseudogenes | 25 |

The full PGAP annotation files (`.gbff`, `.gff`, `.faa`) are not committed here
(see repository `.gitignore`); download them from NCBI with
[`../scripts/download_data.sh`](../scripts/download_data.sh).

## Service annotation (Prokka)

The NIB comprehensive-analysis service (see `docs/PROVENANCE.md`) additionally
produced a **Prokka** annotation, used internally for the downstream functional
analyses. Those files are kept, clearly labelled, in
[`service_prokka/`](service_prokka/). Their counts (3,967 genes / 3,812 CDS / 88
tRNA) differ slightly from the PGAP counts above because they come from a different
annotation pipeline; the **PGAP annotation is the published, authoritative record.**
