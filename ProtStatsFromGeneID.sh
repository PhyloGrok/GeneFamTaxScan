##!/bin/bash
##Retrieves relevant protein info in .csv format starting with "ortholog group ID"
for i in `esearch -db gene -query "ortholog_gene_29102[group]"  | elink -target protein | esummary | xtract -pattern DocumentSummary -element Caption`; do efetch -db protein -id $i -format docsum | xtract -pattern DocumentSummary -element Caption Title SourceDb Slen | tr "\t" ","; done
