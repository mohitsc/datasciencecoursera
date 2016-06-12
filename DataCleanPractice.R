# Week 3 lectures


setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/DataCleaning")
getwd()

if(!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

#Exploring data: 
head(restData,3)
tail(restData,4)
summary(restData)
str(restData)

quantile(restData$councilDistrict, na.rm = TRUE)
quantile(restData$councilDistrict, na.rm = TRUE, probs = c(0.5, 0.75, 0.9))


table(restData$zipCode, useNA = "ifany")
# if there are any missing values, useNA = "ifany" will account for them in the code above; else R ignores

table(restData$councilDistrict, restData$zipCode)

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode>0)

colSums(is.na(restData))

table(restData$zipCode %in% c("21212", "21213"))
restData[restData$zipCode %in% c("21212", "21213"),]

data("UCBAdmissions")
DF <- as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt
ftable(xt)

print(object.size(restData), units="MB")

s1 <- seq(1,10, by = 2);s1
s2 <- seq(1,10, length = 4); s2

x <- c(1, 15, 12, 24, 11); seq(along=x)

restData$NearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$NearMe)

restData$ZipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$ZipWrong, restData$zipCode < 0)

restData$ZipGroups <- cut(restData$zipCode, quantile(restData$zipCode))
head(restData)
table(restData$ZipGroups)
table(restData$ZipGroups, restData$zipCode)

install.packages("Hmisc")
library(Hmisc)

restData$ZipGroups <- cut2(restData$zipCode, g=4)
table(restData$ZipGroups)

restData$ZCF <- factor(restData$zipCode)
restData$ZCF[1:10]


