source("script/import.R", local = TRUE)

# 1. Use the aov() function in the base library to compute the analysis of variance of overall_health by gender and having had a cigarette. See if there is an interaction term!
res.aov <- aov(overall_health ~ gender*cig_ever, data = df2)
# Summary of the analysis
summary(res.aov)

#2. Navigate the results of the anova, and create variables to store the useful results to your study.

#3. Run a TukeyHSD() on your anova results to locate your effect, store the p values important for reporting in the manuscript.

#Reviewer 2 comment, please address children with violent mood disorders, may play a role in self-reported health and accounting for "badassery"
df2 <- df[-which(df$anger == "Yes"),]