
Scripts and framework for evaluating annotation errors for user-selected gene families, taxonomically delimited.  Uses RefSeq Genomes, RefSeq Proteins as a "Standard Mean Reference" to identify outlying annotation parameters from orthologous non-RefSeq genes of interest.


##
![GeneFamTaxScan](../master/Images/GeneFamTaxScan01.png?sanitize=true)
##

# Steps:

### 1. Retrieve table (.csv) of Assembly stats from a specified Higher Taxa: ([AssemblyStatsFromTaxa.sh](../master/AssemblyStatsFromTaxa.sh))

```bash AssemblyStatsFromTaxa.sh <NCBI tax id>``` 

Example taxid 9443 -- primates

Output Example: ([AssemblyStats.csv](../master/AssemblyStats.csv))

### 2.  Assembly Stats analysis ([AssemblyStatsCompare.R](../master/AssemblyStatsCompare.R)) 

``` Rscript AssemblyStatsCompare.R ```

Output Example:  ([AssemblyStatsGraphs.md](../master/AssemblyStatsGraphs.md))

### 3. Retrieve table (.csv) of Protein stats for a specified gene ortholog group: ([ProtStatsFromGeneID.sh](../master/ProtStatsFromGeneID.sh))

```bash ProtStatsFromGeneID.sh```

Example 

-> ([ProtStats.csv](../master/ProtStats.csv)) -> Stats analysis (ANOVA) ([ProtStatsCompare.R](../master/ProtStatsCompare.R)) -> ANOVA Results ([ProtStatsResults.md](../master/ProtStatsResults.md)), and identification of irregular Protein seqs ([Prot_Abnormals.csv](../master/Prot_Abnormals.csv)).
### 4. Retrieve Gene .fastas for a given HomologeneID, by retreiving sequence using chr_start,chr_stop positions. (use [GeneFastaFromHomlogene.sh](../master/GeneFastaFromHomologene.sh))
### 5. Retrieve Protein .fastas of given GeneIDs with associated RefSeq genomes. (use [ProtFastaFromGene.sh](../master/ProtFastaFromGene.sh))
### 6. Retrieve RefSeq Assembly .gz files for taxa of interest. (see [AssemblyRefseqFastasByTax.sh](../master/AssemblyRefseqFastasByTax.sh))
### 7. Make BLAST databases from Gene .fastas, RefSeq Protein .fastas, RefSeq Assembly .gz.
### 8. Retrieve *Non-RefSeq* Genome, Protein accessions from Taxonomy subset of interest.  Compare meta-stats to "Reference" sequence SD values, find sequences outside Reference ranges, or with divergent BLAST results. 
  * Retrieve child taxa from a parent node using ETE3 (use [ChildTaxaByParent.py](../master/ChildTaxaByParent.py)).
  * Make a comparative heuristic, Protein Slen vs Assembly quality - between and within taxon parent groups, RefSeq vs non-RefSeqs, Assembly vs. Protein stats.
### 9. Visualize sequence comparisons ([NCBI Genome Workbench](https://www.ncbi.nlm.nih.gov/tools/gbench/)).
