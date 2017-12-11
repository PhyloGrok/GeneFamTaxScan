```
$ esearch -db gene -query "14000" | elink -target protein | esummary | xtract -pattern DocumentSummary -if SourceDb -equals "refseq" -element Caption Title Slen | tr "\t" "," > ProtSlen.csv

##Gives Caption, Title, and Sequence Length (Slen) .csv for a given GeneID:

NP_001123621,ribonuclease 3 [Mus musculus],1373
NP_081075,ribonuclease 3 [Mus musculus],1373
XP_006520084,PREDICTED: ribonuclease 3 isoform X1 [Mus musculus],1393
```
