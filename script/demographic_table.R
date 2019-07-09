
### Tasks
#1. Run the source for the script above in the console, you will have a new dataframe in your environment (df). If you are interested in seeing what commands are being executed, view the import.R script.

#2. Included are the variables important in our analysis, our goal is to create a kable table that will be used in our manuscript. Before we can create a kable table, we need to define what will be in that table. Create a summary table with the following columns:
#
#Column1: Variable names 
#Column2: Count/mean (prop/sd)

demographics <- as.data.frame(matrix(NA, ncol = 2, nrow = 4))

colnames(demographics) <- c("Count/Mean", "Prop/SD")
rownames(demographics) <- c("Female", "Smoked", "Health", "Age")
demographics[,1] <- c(length(which(df$gender == "Female")),
                      length(which(df$cig_ever == "Yes")),
                      round(mean(df$overall_health), digits = 0),
                      round(mean(df$age), digits = 0))
demographics[,2] <- c(round(length(which(df$gender == "Female"))/length(df[,1]), digits = 4),
                      round(length(which(df$cig_ever == "Yes"))/length(df[,1]), digits = 4),
                      round(sd(df$overall_health), digits = 4),
                      round(sd(df$overall_health), digits = 4))

library(kableExtra)

table1 <- kable(demographics, format = "latex") 
