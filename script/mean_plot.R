

library(ggplot2)

#1. Plot the means of each category of the ANOVA analysis in a boxplot, using ggplot2. You should have 4 boxplots on the one plot with overall_health on the y axis.

df$group <- NA
df$group[which(df$gender == "Male" & df$cig_ever == "Yes")] <- "Male:Yes"
df$group[which(df$gender == "Male" & df$cig_ever == "No")] <- "Male:No"
df$group[which(df$gender == "Female" & df$cig_ever == "Yes")] <- "Female:Yes"
df$group[which(df$gender == "Female" & df$cig_ever == "No")] <- "Female:No"
df$group <- as.factor(df$group)

df2 <- as.data.frame(matrix(NA, nrow = 4, ncol = 5))
colnames(df2) <- c("group", "mean", "sd", "n", "se")
df2$group <- c("Male:Yes", "Male:No", "Female:Yes", "Female:No")
for(i in 1:length(df2$group)){
  df2$mean[i] <- mean(df$overall_health[which(df$group == df2$group[i])])
  df2$sd[i] <- sd(df$overall_health[which(df$group == df2$group[i])])
  df2$n[i] <- length(which(df$group == df2$group[i]))
  df2$se[i] <- df2$sd[i]/sqrt(df2$n[i])
}

p <- ggplot(df2) +
  geom_point(aes(y = mean, x = group), stat = "identity") +
  geom_errorbar(aes(ymin = mean-(1.96*se), ymax = mean+(1.96*se), x = group), width = 0.2)+
  ylim(1,4)+
  ggtitle("Mean Plot of Overall Health") +
  xlab("Gender:Ever Cigarette") +
  ylab("Perceived Overall Health")