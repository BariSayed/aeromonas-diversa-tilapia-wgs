# CRISPR-Cas (CRISPRCasTyper)

CRISPR-Cas identification was performed with **CRISPRCasTyper v1.4.1** (Bari et al.
2025, Methods). Files below are the service output.

| File | Description |
|------|-------------|
| `crisprs_all.tab` | CRISPR array(s): location, consensus repeat, repeat/spacer counts, predicted subtype |
| `crispr_spacers.fa` | CRISPR spacer sequences (FASTA) |
| `cas_operons_putative.tab` | Putative cas operons |
| `crispr_cas_plot.png` | Graphical view of the CRISPR-Cas locus |

One CRISPR array was detected on **Contig4** (positions 259,745-259,895), with a
25 bp consensus repeat (`CAAAATGGTGGGTGTCCCAGAATCT`) and a predicted subtype of
**III-A** (see `crisprs_all.tab` for the exact values). Spacer sequences are in
`crispr_spacers.fa`. The publication summarises this as one CRISPR spacer site.
