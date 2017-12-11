

```
##Retrieves protein sequence length.

$ esearch -db gene -query "14000" | elink -target protein | esummary | xtract -pattern DocumentSummary -if SourceDb -equals "refseq" -element Caption Title Slen | tr "\t" "," > ProtSlen.csv
```
