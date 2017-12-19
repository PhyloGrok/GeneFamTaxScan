##Import a .csv file of Assembly Metadata with RefSeq_category,contig_count,total_length data, output Box&Whisker plots.

AStats <- read.csv("AssemblyStats.csv")

library(ggplot2)

ContigCount <- ggplot(AStats, aes(RefSeq_category, contig_count)) +
geom_boxplot() + scale_y_log10()
ContigCount

AssemblyLength <- ggplot(AStats, aes(RefSeq_category, total_length)) +
geom_boxplot() + scale_y_log10()
AssemblyLength
