# Stage 6 - Functional genomics

| Analysis | Tool | Result |
|----------|------|--------|
| Metabolic pathway completeness | MicrobeAnnotator v2.0.5 | 8 KEGG modules at 100% completeness (of 394 assessed) |
| Secondary metabolite BGCs | antiSMASH v6 | 0 biosynthetic gene clusters detected |
| CRISPR-Cas | CRISPRCasTyper v1.4.1 | 1 CRISPR array (predicted subtype III-A) |

## Metabolic pathways

[`metabolic_module_completeness.tab`](metabolic_module_completeness.tab) lists all
394 assessed KEGG modules and their percent completeness; a heatmap is in
[`metabolic_summary_heatmap.pdf`](metabolic_summary_heatmap.pdf). The **8 modules at
100% completeness** are:

| KEGG module | Name | Category |
|-------------|------|----------|
| M00844 | Arginine biosynthesis, ornithine => arginine | Arginine and proline metabolism |
| M00022 | Shikimate pathway, PEP + erythrose-4P => chorismate | Aromatic amino acid metabolism |
| M00024 | Phenylalanine biosynthesis, chorismate => phenylalanine | Aromatic amino acid metabolism |
| M00025 | Tyrosine biosynthesis, chorismate => tyrosine | Aromatic amino acid metabolism |
| M00579 | Phosphate acetyltransferase-acetate kinase pathway | Carbon fixation |
| M00005 | PRPP biosynthesis, ribose 5P => PRPP | Central carbohydrate metabolism |
| M00127 | Thiamine biosynthesis, AIR => thiamine-P => thiamine-2P | Cofactor and vitamin metabolism |
| M00851 | Carbapenem resistance | Drug resistance |

## Biosynthetic gene clusters

antiSMASH detected **no** secondary-metabolite biosynthetic gene clusters (NIB
service report). No BGC output file is therefore included.

## CRISPR-Cas

See [`crispr/`](crispr/). One CRISPR array was identified on Contig4 by
CRISPRCasTyper (predicted subtype III-A); the array, consensus repeat, and spacer
sequences are in the files there.
