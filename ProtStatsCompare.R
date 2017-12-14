##ReadOut ANOVA stats between taxa for a given geneID

PStats <- read.csv("DroshaPrimateStats.txt")
PStats1 <- read.csv("DroshaRodentStats.txt")

library(ggplot2)

Primate1 <- subset(PStats, SourceDb == "refseq", select = c("Caption","Slen"))
Primate1$Tax <- "Primate"

Rodent1 <- subset(PStats1, SourceDb == "refseq", select = c("Caption","Slen"))
Rodent1$Tax <- "Rodent"

total <- rbind(Primate1,Rodent1)

total.df = total

total.df$Tax = factor(total.df$Tax, labels = c("Primate","Rodent"))

ggplot(total.df, aes(x = Tax, y = Slen)) +
  geom_boxplot(fill = "grey80", colour = "blue") +
  scale_y_continuous() + xlab("Taxa") +
  ylab("GenPept Seq Length")

total.mod1 = lm(Slen ~ Tax, data = total.df)

summary(total.mod1)

anova(total.mod1)

confint(total.mod1)

total.mod = data.frame(Fitted = fitted(total.mod1), Residuals = resid(total.mod1), Treatment = total$Tax)

ggplot(total.mod, aes(Fitted, Residuals, colour = Treatment)) + geom_point()

trimmed_stats <- ddply(subset(total.df, abs(Slen - mean(Slen)) > sd(Slen)), .(Caption))

write.csv(trimmed_stats, file = "Abnormal_Droshas.csv",row.names=FALSE)


