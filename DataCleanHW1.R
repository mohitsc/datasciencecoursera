
setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/DataCleaning/HW1")

getwd()

link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = link, destfile = "RawData1.csv")

library(dplyr)
library(tidyr)

Data1 <- tbl_df(read.table("RawData1.csv", header = TRUE, sep = ","))

Data1 %>% filter( VAL == 24 ) %>% summarize(N=n())

NGlink <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url = NGlink, destfile = "NGAcquisition.xlsx", mode = "wb")

install.packages("xlsx")
install.packages("rJava")
library(xlsx)

rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("NGAcquisition.xlsx", sheetIndex = 1, rowIndex = rowIndex, colIndex = colIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

library(XML)
BalRestLink <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
BalRest <- xmlTreeParse("BalRest.xml", useInternalNodes = TRUE)
class(BalRest)
rootNode <- xmlRoot(BalRest)
names(rootNode)
zipcodes <- data.frame(xpathSApply(rootNode, "//zipcode", xmlValue))
names(zipcodes) <- c("zips")
zipcodes[zipcodes$zips == 21231, ]

CommSurveyLink <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url = CommSurveyLink, destfile = "CommSurvey.csv")
DT <- tbl_df(read.table("CommSurvey.csv", header = TRUE, sep = ","))

install.packages("data.table")
library(data.table)


system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2])
system.time(rowMeans(DT)[DT$SEX==2])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))



