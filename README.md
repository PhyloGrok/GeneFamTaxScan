# GeneFamTaxScan
Scripts for evaluating annotation errors for user-selected gene families, taxonomically delimited.  Uses RefSeq Genomes, RefSeq Proteins as a "Standard Mean Reference" to identify outlying annotation parameters from orthologous non-RefSeq genes of interest.


##
![GeneFamTaxScan](https://raw.githubusercontent.com/NCBI-Hackathons/GeneFamTaxScan/master/Images/GeneFamTaxScan01.png?sanitize=true)
##

Workflow:

1. Retrieve RefSeq genome stats and .gz files for taxa of interest. (see [RefSeqGenomeByTax.md](../master/RefSeqGenomeByTax.md))
2. Retrieve DNA gene sequence .fasta given a Homologene ID by elink -> gene | elink -> Assembly | efetch -db Assembly -chr_start -chr_stop. (use [homolog2fasta.sh](../master/homolog2fasta.sh))
3. Export a .csv formatted table of Assembly stats (see [AssemblyStatsFromTaxa.md](../master/AssemblyStatsFromTaxa.md)), Import to R, calculate averages and SDs, readout box-whisker plots.
4. Retrieve Protein .fasta given GeneIDs associated with RefSeq genome. (use [ProtFastaFromGene.md](../master/ProtFastaFromGene.md))
5. Export .csv formatted table of Gene and Protein sequence stats, calculate averages and SDs, readout box-whisker plots.
6. Make BLAST databases from Gene .fastas, RefSeq Protein .fastas, RefSeq Assembly .gz.
7. Retrieve *Non-RefSeq* Genome, Protein accessions from Taxonomy subset of interest.  Compare meta-stats to "Reference" sequence SD values, find sequences outside Reference ranges, or with divergent BLAST results. 
  * Retrieve child taxa from a parent node using ETE3 (use [ChildTaxaByParent.py](../master/ChildTaxaByParent.py)).
