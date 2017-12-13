##Retrieves relevant protein info in .csv format starting with "ortholog group ID"
##"Title" entries can be flaky - some sequences say "Drosha, partial".  Semi-colon delimiters were used instead, but a couple prots still needed manual revision
#!/bin/bash

for i in `esearch -db gene -query "ortholog_gene_29102[group]"  | elink -target protein | esummary | xtract -pattern DocumentSummary -element Caption`; do efetch -db protein -id $i -format docsum | xtract -pattern DocumentSummary -element Caption Title SourceDb Slen | tr "\t" ";"; done

##Get Rodent Specific Drosha ortholog data
#for i in `esearch -db gene -query "ortholog_gene_29102[group] AND txid9989[Orgn]"  | elink -target protein | esummary | xtract -pattern DocumentSummary -element Caption`; do efetch -db protein -id $i -format docsum | xtract -pattern DocumentSummary -element Caption Title SourceDb Slen | tr "\t" ";"; done

##Will NOT work for inveretbrate taxa - orthology groups only for Inverts.  BLAST implementation may be necessary.
