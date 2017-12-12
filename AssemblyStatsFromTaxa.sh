##Retrieves .csv file (no headers) assembly stats for taxa of interest.

for i in `esearch -db genome -query txid9443[Orgn] | elink -target assembly | esummary | xtract -pattern DocumentSummary -element Id`; do efetch -db assembly -id $i -format docsum | xtract -pattern DocumentSummary -element Organism SpeciesTaxid AssemblyAccession RefSeq_category AssemblyStatus -block Meta -element Stat | tr "\t" ","; done

##(Output: see [AssemblyStats.csv](../master/AssemblyStats.csv))  *Note column headers entered manually*
