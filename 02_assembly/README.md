# Stage 2 - De novo assembly (Unicycler)

Trimmed reads were assembled with **Unicycler v0.4.8** (default parameters; Bari et
al. 2025, Methods). Assembly statistics ([`SAU1_assembly_stats.txt`](SAU1_assembly_stats.txt))
are quoted from the publication (Table 1) and are consistent with the NIB service
report.

| Metric | Value |
|--------|-------|
| Assembly size | 4,105,655 bp |
| Contigs | 33 |
| N50 / L50 | 384,764 bp / 4 |
| Longest / shortest contig | 729,309 / 1,235 bp |
| GC content | 61.63% |
| Average coverage | 945.5x |
| Completeness | 99.5% |

The assembly FASTA and Unicycler assembly graphs (`.gfa`) are not committed here;
the final assembly is deposited at GenBank (**JBFMMD000000000** /
**GCA_040790265.1**) and retrievable via `../scripts/download_data.sh`.
