```
$ esearch -db gene -query "14000" | elink -target protein | esummary | xtract -pattern DocumentSummary -if SourceDb -equals "refseq" -element Caption Title Slen | tr "\t" "," > ProtSlen.csv

##Gives Caption, Title, and Sequence Length (Slen) .csv for a given GeneID:

NP_001123621,ribonuclease 3 [Mus musculus],1373
NP_081075,ribonuclease 3 [Mus musculus],1373
XP_006520084,PREDICTED: ribonuclease 3 isoform X1 [Mus musculus],1393
```
Or from homologeneID

```
$ esearch -db homologene -query "8293" | elink -target protein -batch | esummary | xtract -pattern DocumentSummary -if SourceDb -equals "refseq" -element Caption Title Slen | tr "\t" "," > ProtSlen.csv

NP_001123621,ribonuclease 3 [Mus musculus],1373
NP_037367,ribonuclease 3 isoform 1 [Homo sapiens],1374
NP_492599,Ribonuclease 3 [Caenorhabditis elegans],1086
NP_001101125,ribonuclease 3 [Rattus norvegicus],1373
NP_001107152,ribonuclease 3 [Xenopus tropicalis],1325
NP_477436,drosha [Drosophila melanogaster],1327
NP_001103942,ribonuclease 3 [Danio rerio],1289
...etc.
```
