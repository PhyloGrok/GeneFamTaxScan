##Retrieves relevant protein info in .csv format starting with "ortholog group ID"
##Note that "Title" entries are a bit flaky - some sequences say "Drosha, partial".  Semi-colon delimiters were used instead, but a couple prots still needed manual revision
#!/bin/bash

for i in `esearch -db gene -query "ortholog_gene_29102[group]"  | elink -target protein | esummary | xtract -pattern DocumentSummary -element Caption`; do efetch -db protein -id $i -format docsum | xtract -pattern DocumentSummary -element Caption Title SourceDb Slen | tr "\t" ";"; done
