```
> summary(total.mod1)

Call:
lm(formula = Slen ~ Tax, data = total.df)

Residuals:
    Min      1Q  Median      3Q     Max 
-786.80   -3.80    5.46   32.45   72.20 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 1340.800      8.393 159.758   <2e-16 ***
TaxRodent     26.740     13.291   2.012    0.046 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 81.8 on 156 degrees of freedom
Multiple R-squared:  0.02529,	Adjusted R-squared:  0.01904 
F-statistic: 4.048 on 1 and 156 DF,  p-value: 0.04596

> anova(total.mod1)

Analysis of Variance Table

Response: Slen
           Df  Sum Sq Mean Sq F value  Pr(>F)  
Tax         1   27084 27084.4  4.0476 0.04596 *
Residuals 156 1043879  6691.5                  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1



> confint(total.mod1)
                   2.5 %     97.5 %
(Intercept) 1324.2220332 1357.37797
TaxRodent      0.4860421   52.99332
```

|Primates vs. Rodent Drosha Protein Slen| Fitted ANOVA Results|
|--------|--------|
| ![Drosha_PrimVsRod.png](../master/Images/Drosha_PrimVsRod.png?sanitize=true) | ![Drosha_PrimVsRod_Fitted.png](../master/Images/Drosha_PrimVsRod_Fitted.png?sanitize=true) | 
