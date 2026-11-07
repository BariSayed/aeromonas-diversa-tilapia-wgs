#!/bin/bash
# Record exact tool and database versions for the methods section.
# Usage:  bash scripts/record_versions.sh > versions.txt
set -uo pipefail
echo "# Tool versions recorded on $(date -u +%Y-%m-%dT%H:%M:%SZ)"
for tool in fastp unicycler abricate microbeannotator antismash cctyper \
            prokka mafft blastn datasets prefetch fasterq-dump; do
  printf '\n## %s\n' "$tool"
  if command -v "$tool" >/dev/null 2>&1; then
    "$tool" --version 2>&1 | head -n 3
  else
    echo "NOT FOUND"
  fi
done
printf '\n## abricate databases\n'
abricate --list 2>&1 || true
printf '\n## NCBI PGAP: run separately (containerised); record from: ./pgap.py --version\n'
