library("ggplot2")
library("grid")
source("~/_dev/themes/theme_cram/theme_cram.R")
df <- read.csv("~/_dev/tmp/results.csv")
names(df) <-  c("date", "year", "score") # column names

df <- df[grep("1966-08", df$date),] # date range; like yyyy-mm or yyyy

df <- data.frame(df, df$date, dif = as.numeric(as.character(df$score))) # cast as numeric

dat1 <- subset(df,df$dif >= 0) # grab winning diff
dat2 <- subset(df,df$dif < 0) # grab losing diff

ggplot() + 
  geom_bar(data = dat1, aes(x=date, y=dif),stat = "identity") +
  geom_bar(data = dat2, aes(x=date, y=dif),stat = "identity") +
  theme_cram()
