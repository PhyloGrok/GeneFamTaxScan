##Retrieves .csv file with assembly stats for taxa of interest.

echo "Id,Organism,SpeciesTaxid,AssemblyAccession,RefSeq_category,AssemblyStatus,alt_loci_count,chromosome_count,contig_count,contig_l50,contig_n50,non_chromosome_replicon_count,replicon_count,scaffold_count(all),scaffold_count(placed),scaffold_count(unlocalized),scaffold_count(unplaced),scaffold_l50,scaffold_n50,total_length,ungapped_length" > AssemblyStats.csv

for i in `esearch -db genome -query txid$1[Orgn] | elink -target assembly | esummary | xtract -pattern DocumentSummary -element Id`; do efetch -db assembly -id $i -format docsum | xtract -pattern DocumentSummary -element Id Organism SpeciesTaxid AssemblyAccession RefSeq_category AssemblyStatus -block Meta -element Stat | tr "\t" ","; done >> AssemblyStats.csv

#To Exclude selected child taxa: esearch -db genome -query "txid33208[Orgn] NOT txid6960[Orgn] NOT txid7742[Orgn]"
#$ for i in `esearch -db genome -query "txid33208[Orgn] NOT txid6960[Orgn] NOT txid7742[Orgn]" | elink -target assembly | esummary | xtract -pattern DocumentSummary -element Id`; do efetch -db assembly -Id $i -format docsum | xtract -pattern DocumentSummary -element Id Organism SpeciesTaxid AssemblyAccession RefSeq_category AssemblyStatus -block Meta -element Stat | tr "\t" ","; done
##(Output: see [AssemblyStats.csv](../master/AssemblyStats.csv))  *Note column headers entered manually*
