# Antimicrobial Resistance and Virulence

## Antimicrobial resistance (Abricate / ResFinder)

Antibiotic-resistance gene homologs were identified with **Abricate** against the
**ResFinder** database. The values below are read directly from
[`amr_abricate_resfinder.tsv`](amr_abricate_resfinder.tsv) (NIB service output):

| Gene | %Coverage | %Identity | ResFinder accession | Predicted resistance |
|------|-----------|-----------|---------------------|----------------------|
| `ampH_1` | 94.09 | 80.68 | AJ276031 | Beta-lactam |
| `sul2_2` | 100.00 | 100.00 | GQ421466 | Sulfonamide |
| `tet(A)_4` | 100.00 | 100.00 | AJ517790 | Tetracycline |

As reported in Bari et al. (2025): `ampH_1` is associated with beta-lactam
resistance, `sul2_2` with sulfonamide resistance, and `tet(A)_4` with tetracycline
resistance.

**Interpretation note.** These are **genotype-based** predictions. The genomic
presence of a resistance determinant indicates a gene **predicted to confer** the
listed activity; it does not, by itself, establish phenotypic resistance in the
absence of minimum inhibitory concentration (MIC) testing.

## Virulence (VFDB)

The publication reports a single virulence gene, **`pscR`**, encoding a type III
secretion system translocation protein, identified with the Virulence Factor
Database (VFDB). This screen was performed separately by the authors and is **not**
part of the NIB service output; accordingly, **no VFDB result file is included in
this repository**. Refer to the publication for details.
