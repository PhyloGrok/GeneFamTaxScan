##Thanks to Jan Buchmann for helping with bash script.

#!/bin/bash
outf="drosha.fasta"
echo -n "" > $outf
geneids=$(esearch -db homologene -query "8293" | esummary | xtract -pattern DocumentSummary -element GeneID | tr "\t" ",")

for i in $(esearch -db gene -query "$geneids" | efetch -format docsum | xtract -pattern DocumentSummary -element GenomicInfoType/ChrAccVer GenomicInfoType/ChrStart GenomicInfoType/ChrStop | tr "\t" ",");
        do
                data=($(echo $i | tr "," "\n"))
                if [[ ${#data[@]} == 3 ]]
                        then
                                efetch -db nuccore -id ${data[0]} -seq_start=${data[1]} -seq_stop=${data[2]} -format fasta >> $outf
                fi
        done;
