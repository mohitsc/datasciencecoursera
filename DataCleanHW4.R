setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/DataCleaning")
if(!file.exists("./HW4")) {dir.create("./HW4")}
setwd("./HW4")
getwd()

url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1, "CommSurvey.csv")
CommSurvey <- read.csv("CommSurvey.csv")

head(CommSurvey)
str(CommSurvey)

CommSurvey <- as.data.frame(CommSurvey)
namesVector <- names(CommSurvey)
namesSplit <- strsplit(namesVector, "wgtp")
namesSplit[[123]]

url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url2, "GDP.csv")

library(dplyr)
library(tidyr)

GDP <- read.csv("GDP.csv", header = FALSE)
gdpFormatted <- GDP %>% slice(-(1:5)) %>% select(V1,V2,V4,V5)
names(gdpFormatted) <- c("CountryCode","GDPRank","country","GDPmillD")

gdpFormatted$GDPmillDNum <- gsub(",","",gdpFormatted$GDPmillD)
gdpFormatted2 <- gdpFormatted %>% filter(!is.na(GDPRank)) %>% mutate(GDPmillDNum = as.numeric(GDPmillDNum))
mean(gdpFormatted2$GDPmillDNum)

grep("^United",gdpFormatted$country) 

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "edu.csv")
edu <- tbl_df(read.csv("edu.csv"))
merge1 <- inner_join(gdpFormatted2, edu, by = "CountryCode") 

str(merge1)

merge1$fiscalcheck <-  grepl("end: June", merge1$Special.Notes)
merge2 <- filter(merge1, fiscalcheck == TRUE)

install.packages("quantmod")
library(quantmod)

amzn <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn)
library(lubridate)
sampleTimes2 <- ymd(sampleTimes)
sample2012 <- sampleTimes2[year(sampleTimes2) == 2012]
sample2012Mon <- sample2012[wday(sample2012, label = TRUE) == "Mon"]
sample2012Mon