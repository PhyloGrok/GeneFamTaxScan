# GeneFamTaxScan
Scripts for evaluating annotation errors for user-selected gene families, taxonomically delimited.  Uses RefSeq Genomes, RefSeq Proteins as a "Standard Mean Reference" to identify outlying annotation parameters from orthologous non-RefSeq genes of interest.


##
![GeneFamTaxScan](../master/Images/GeneFamTaxScan01.png?sanitize=true)
##

# Steps:

1. Retrieve .csv formatted table of Assembly stats ([AssemblyStatsFromTaxa.sh](../master/AssemblyStatsFromTaxa.sh)) -> ([AssemblyStats.csv](../master/AssemblyStats.csv)) -> Stats analysis ([AssemblyStatsCompare.R](../master/AssemblyStatsCompare.R)) -> prelim Boxplots ([AssemblyStatsGraphs.md](../master/AssemblyStatsGraphs.md)).
2. Retrieve .csv formatted table of Protein stats ([ProtStatsFromGeneID.sh](../master/ProtStatsFromGeneID.sh)) -> ([ProtStats.csv](../master/ProtStats.csv)) -> Stats analysis ([ProtStatsCompare.R](../master/ProtStatsCompare.R)).
3. Retrieve Gene(DNA) .fasta given a Homologene ID using Assembly-associated chr_start,chr_stop positions. (use [GeneFastaFromHomlogene.sh](../master/GeneFastaFromHomologene.sh))
4. Retrieve Protein .fasta given GeneIDs associated with RefSeq genome. (use [ProtFastaFromGene.sh](../master/ProtFastaFromGene.sh))
5. Retrieve RefSeq Assembly .gz files for taxa of interest. (see [AssemblyRefseqFastasByTax.md](../master/AssemblyRefseqFastasByTax.md))
6. Make BLAST databases from Gene .fastas, RefSeq Protein .fastas, RefSeq Assembly .gz.
7. Retrieve *Non-RefSeq* Genome, Protein accessions from Taxonomy subset of interest.  Compare meta-stats to "Reference" sequence SD values, find sequences outside Reference ranges, or with divergent BLAST results. 
  * Retrieve child taxa from a parent node using ETE3 (use [ChildTaxaByParent.py](../master/ChildTaxaByParent.py)).
  * Make a comparative heuristic, Protein Slen vs Assembly quality - between and within taxon parent groups, RefSeq vs non-RefSeqs, Assembly vs. Protein stats.
