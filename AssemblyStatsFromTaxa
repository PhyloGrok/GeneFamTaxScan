Script retrieves .csv file (no headers) assembly stats for taxa of interest.
```
$ esearch -db genome -query txid9443[Orgn] |elink -target assembly | esummary | xtract -pattern DocumentSummary -element Id Organism SpeciesTaxid AssemblyAccession RefSeq_category AssemblyStatus -block Meta -element Stat | tr "\t" "," > Primates.csv > Primates.csv
```

(see [PrimateStats.csv](../master/PrimateAssemblyStats.csv))
