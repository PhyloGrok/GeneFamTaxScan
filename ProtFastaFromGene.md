

```
##Retrieves RefSeq Protein fastas from a GeneId input.

$ for i in esearch -db gene -query "14000" | elink -target protein | esummary | xtract -pattern DocumentSummary -if SourceDb -equals "refseq" -element Caption; do efetch -db protein -id $i -format fasta; done
```
