##Command line: "python3.6 ChildTaxaByParent.py > taxids"
##Requires ete3

##Taxpull.py
from ete3 import NCBITaxa
ncbi = NCBITaxa()
descendants = ncbi.get_descendant_taxa('Mus')
print(descendants)
