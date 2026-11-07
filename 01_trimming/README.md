# Stage 1 - Read quality control and trimming (Fastp)

Raw paired-end Illumina MiSeq reads (2 x 150 bp) were quality-trimmed with **Fastp
v0.23.2** to remove low-quality bases and adapter sequences (default parameters;
Bari et al. 2025, Methods).

| File | Description |
|------|-------------|
| `SAU1_quality_control_summary.html` | Quality-control (trimming) summary; open in any web browser. From the NIB service output. |

Raw reads are not committed here; they are deposited at the SRA (run
**SRR29825452**) and retrievable via `../scripts/download_data.sh`.

Reported sequencing totals (Bari et al. 2025, Table 1): 25,609,650 reads /
3,841,447,500 bp; read length 150 bp.
