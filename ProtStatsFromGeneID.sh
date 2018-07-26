##Retrieves relevant protein info in .csv format starting with "ortholog group ID"

#!/bin/bash

for i in `esearch -db protein -query "gene_$1[TITL] AND txid$2[Orgn]"  | esummary | xtract -pattern DocumentSummary -element Caption`; do efetch -db protein -id $i -format docsum | xtract -pattern DocumentSummary -element Caption SourceDb Slen | tr "\t" ","; done >> orthology_$1_$2.csv

##Will NOT work for inveretbrate taxa - orthology groups only for Verts.  BLAST implementation may be necessary.
