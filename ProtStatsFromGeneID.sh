##Retrieves relevant protein info in .csv format starting with "ortholog group ID"
##"Title" has a lot of "," and tabs, don't retrieve those
#!/bin/bash

for i in `esearch -db gene -query "ortholog_gene_$1[group] AND txid$2[Orgn]"  | elink -target protein | esummary | xtract -pattern DocumentSummary -element Caption`; do efetch -db protein -id $i -format docsum | xtract -pattern DocumentSummary -element Caption SourceDb Slen | tr "\t" ","; done
##Get Rodent Specific Drosha ortholog data
##Will NOT work for inveretbrate taxa - orthology groups only for Verts.  BLAST implementation may be necessary.
