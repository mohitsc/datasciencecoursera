setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/DataCleaning/HW3")
getwd()

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "IdahoHouse.csv")

library(dplyr)
IdahoHouse <- tbl_df(read.csv("IdahoHouse.csv"))

#IdahoHouse2 <- select(IdahoHouse, ACR, AGS)

agricultureLogical <- (IdahoHouse$ACR == 3 & IdahoHouse$AGS == 6)
which(agricultureLogical)

install.packages("jpeg")
library(jpeg)

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", "test.jpg")
image <- readJPEG("test.jpg", native = TRUE)
quantile(image)
quantile(image, c(0.3,0.8))

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "gdp.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "edu.csv")

gdp <- tbl_df(read.csv("gdp.csv", header = FALSE))
edu <- tbl_df(read.csv("edu.csv"))
              
gdpFormatted <- gdp %>% slice(-(1:5)) %>% select(V1,V2,V4,V5)
names(gdpFormatted) <- c("CountryCode","GDPRank","country","GDPmillD")

gdpFormatted <- mutate(gdpFormatted, GDPRank = as.numeric(levels(GDPRank)[GDPRank]))
gdpFormatted2 <- filter(gdpFormatted, !is.na(GDPRank))

merge1 <- inner_join(gdpFormatted2, edu, by = "CountryCode") 

merge2 <- merge1  %>% arrange(desc(GDPRank))

merge2[13,]

merge2 %>% group_by(Income.Group) %>% summarize(mean(GDPRank, na.rm = TRUE))

quantile(merge2$GDPRank, c(0.2), na.rm = TRUE)

merge2$quantGroups <- cut(merge2$GDPRank, breaks = quantile(merge2$GDPRank, c(0,0.2,0.4,0.6,0.8), na.rm = TRUE))
table(merge2$quantGroups, merge2$Income.Group)



