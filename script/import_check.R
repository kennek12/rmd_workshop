#Libraries Used

#Import data from file
load("data/ICPSR_32722/DS0001/32722-0001-Data.rda")

#Change the reference name to df, which means data frame. Remove extra variable from environment
df <- da32722.0001
rm(da32722.0001)

#Cigever, ALCTRY (age first used alcohol), HALNOLST (use hallucinogen)- HALNEWA (specify what hallucinogen was used), HALLAGE (age when first used hallucinogens) #LIFANXD (ever had anxiety), LIFDEPRS (ever had depression), # DSTEFF30 (how often felt everything took effort in past 30 days), DSTNGD30 (how often felt down/whorthloss/no good past 30 days)

#These are the columns we are interested in analyzing for our paper. 10 Variables
df <- df[,c("CASEID","CIGEVER", "ALCTRY", "HALNOLST", "HALNEWA", "HALLAGE", "LIFANXD", "LIFDEPRS", "DSTEFF30", "DSTNGD30")]

