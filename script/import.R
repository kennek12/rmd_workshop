#Libraries Used

#Import data from file
load("data/ICPSR_32722/DS0001/32722-0001-Data.rda")

#Change the reference name to df, which means data frame. Remove extra variable from environment
df <- da32722.0001
rm(da32722.0001)

df <- df[which(df$YOTMTNOW == 1),]

useful_cols <- c("IRSEX",
                 "CIGEVER",
                 "HEALTH2",
                 "AGE2",
                 "SOMHANGR")

#These are the columns we are interested in analyzing for our paper.
df <- df[,useful_cols]
rm(useful_cols)

#Recoding
df$IRSEX <- as.factor(df$IRSEX)
levels(df$IRSEX) <- c("Male", "Female")
df$CIGEVER <- as.factor(df$CIGEVER)
levels(df$CIGEVER) <- c("Yes", "No")
df$AGE2 <- as.factor(df$AGE2)
levels(df$AGE2) <- c(12,13,14,15,16,17)
df$AGE2 <- as.numeric(as.character(df$AGE2))
df$HEALTH2 <- as.factor(df$HEALTH2)
levels(df$HEALTH2) <- c(4, 3, 2, 1)
df$HEALTH2 <- as.numeric(as.character(df$HEALTH2))
df$SOMHANGR <- as.factor(df$SOMHANGR)
df$SOMHANGR[which(is.na(df$SOMHANGR) == TRUE)] <- 0
levels(df$SOMHANGR) <- c("No", "Yes")
df$health_categories <- as.factor(df$HEALTH2)
levels(df$health_categories) <- c("Poor/fair", "Good", "Very good", "Excellent") 

#Rename column names
colnames(df)[1:5] <- c("gender","cig_ever","overall_health","age","anger")