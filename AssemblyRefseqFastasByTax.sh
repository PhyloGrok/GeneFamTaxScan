#!/bin/bash
#esearch -db genome -query txidXXX[Organism:exp] | elink -target assembly | esummary | xtract -pattern DocumentSummary -element #Organism FtpPath_RefSeq

#Return RefSeq .gz files:
wget `esearch -db genome -query txid$1[Organism:exp] | elink -target assembly | esummary | xtract -pattern DocumentSummary -element FtpPath_RefSeq | awk -F"/" '{print $0"/"$NF"_genomic.fna.gz"}'`
