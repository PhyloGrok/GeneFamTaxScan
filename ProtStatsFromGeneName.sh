##Retrieves relevant protein info in .csv format starting with "ortholog group ID"

#!/bin/bash

for i in `esearch -db protein -query "$1[PROT] AND txid$2[ORGN]"  | esummary | xtract -pattern DocumentSummary -element Caption`; do efetch -db protein -id $i -format docsum | xtract -pattern DocumentSummary -element Caption SourceDb Slen | tr "\t" ","; done >> orthology_$1_$2.csv

##For obtaining "gene" from annotation name.
