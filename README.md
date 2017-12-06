# GeneFamTaxScan
Scripts for evaluating annotation errors for user-selected gene families, taxonomically delimited.  Uses RefSeq Genomes, RefSeq Proteins as a "Standard Mean Reference" to identify outlying annotation parameters from non-RefSeq gene families of interest.


##
![GeneFamTaxScan](https://raw.githubusercontent.com/NCBI-Hackathons/GeneFamTaxScan/master/Images/GeneFamTaxScan01.png?sanitize=true)
##


Retrieve Records for Taxonomy of Interest with Assembly DB data, return RefSeq Genome file path if present
```
$esearch -db genome -query txidXXX[Organism:exp] | elink -target assembly | esummary | xtract -pattern DocumentSummary -element Organism FtpPath_RefSeq
```
Return RefSeq .gz files:
```
$ wget `esearch -db genome -query txidXXX[Organism:exp] | elink -target assembly | esummary | xtract -pattern DocumentSummary -element FtpPath_RefSeq | awk -F"/" '{print $0"/"$NF"_genomic.fna.gz"}'`
```

|Organism|RefSeq Assembly|
|---------|---------------|
|**Genus Mus (txid10088, excluding Mus musculus non-RefSeq assembly data)**| |
|Mus musculus (house mouse)|      ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.26_GRCm38.p6|
|Mus pahari (shrew mouse) |       ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/900/095/145/GCF_900095145.1_PAHARI_EIJ_v1.1|
|Mus caroli (Ryukyu mouse) |      ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/900/094/665/GCF_900094665.1_CAROLI_EIJ_v1.1|
|Mus musculus domesticus (western European house mouse)||
|Mus spretus (western wild mouse)||
|Mus musculus musculus (eastern European house mouse)||
|Mus musculus castaneus (southeastern Asian house mouse)||
|||
|**Hominidae (txid9604, Excluding human non-RefSeq assembly data)**||
|Gorilla gorilla gorilla (western lowland gorilla)||
|Gorilla gorilla (western gorilla)||
|Homo sapiens (human)|    ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.37_GRCh38.p11|
|Gorilla gorilla gorilla (western lowland gorilla)||
|Pan troglodytes (chimpanzee)|    ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/515/GCF_000001515.7_Pan_tro_3.0|
|Homo sapiens (human)  |  ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/306/695/GCF_000306695.2_CHM1_1.1|
|Pan troglodytes (chimpanzee)||
|Gorilla gorilla gorilla (western lowland gorilla) |      ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/151/905/GCF_000151905.2_gorGor4|
|Pan paniscus (pygmy chimpanzee)| ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/258/655/GCF_000258655.2_panpan1.1|
|Pongo abelii (Sumatran orangutan)||
|Pongo abelii (Sumatran orangutan)    |   ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/545/GCF_000001545.4_P_pygmaeus_2.0.2|
|Gorilla gorilla (western gorilla)||
|Pan troglodytes (chimpanzee)||
|Pan troglodytes verus (chimpanzee)  |    ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/002/175/GCF_000002175.1_CCYSCv1|
|Homo sapiens (human) |   ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/002/125/GCF_000002125.1_HuRef|
|||
|**Cnidaria (txid6073)**| |
|Stylophora pistillata (stony corals)|    ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/571/385/GCF_002571385.1_Stylophora_pistillata_v1 |
|Renilla reniformis (sea pansy)| |
|Orbicella faveolata (stony corals)|      ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/042/975/GCF_002042975.1_ofav_dov_v1|
|Orbicella faveolata (stony corals)||
|Acropora digitifera (stony corals) |     ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/222/465/GCF_000222465.1_Adig_1.1|
|Enteromyxum leei (myxozoans)||
|Sphaeromyxa zaharoni (myxozoans)||
|Exaiptasia pallida (sea anemones)|       ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/001/417/965/GCF_001417965.1_Aiptasia_genome_1.1|
|Kudoa iwatai (myxozoans)||
|Kudoa iwatai (myxozoans)||
|Hydra vulgaris (hydrozoans)|     ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/095/GCF_000004095.1_Hydra_RP_1.0|
|Hydra vulgaris (hydrozoans)||
|Nematostella vectensis (starlet sea anemone)| ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/209/225/GCF_000209225.1_ASM20922v1|
|Thelohanellus kitauei (myxozoans)||
|Pseudodiploria strigosa (stony corals)| |
|||
|**Porifera (txid6040)**| |
|Amphimedon queenslandica (sponges) | ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/090/795/GCF_000090795.1_v1.0 |
|**Placozoa (txid10226)**| |
Trichoplax adhaerens (placozoans)|       ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/150/275/GCF_000150275.1_v1.0|
|||
|**Ctenophora (txid10197)**| |
|Mnemiopsis leidyi (sea walnut)| |
|Pleurobrachia bachei (ctenophores)| |
