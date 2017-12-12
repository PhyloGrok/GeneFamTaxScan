##From a .csv file, make box&whisker plots and ANOVA for taxa between RefSeq categories and Slen

PStats <- read.csv("DroshaProtStats.csv")

library(ggplot2)

ProtSlen <- ggplot(PStats, aes(SourceDb, Slen)) +
  geom_boxplot()
ProtSlen
