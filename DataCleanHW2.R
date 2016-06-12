library(httr)
#install.packages("httpuv")
library(httpuv)
# Find OAuth settings for Github
# details are at http://developer.github.com/v3/oauth/

oauth_endpoints("github")

myapp <- oauth_app("github", key = "3fdbb5b38c6e87f39fbb", secret = "e945eae41ddd9d19c5d7e35fdb700ae63fdc890e")

# Get oAuth credentials

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# USe API

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
result1 <- content(req, as = "text")


library(jsonlite)

table1 <- fromJSON(result1)
#names(table1)
#table1$created_at
#datasharing is the 8th row

table1[8,46]

install.packages("sqldf")
library(sqldf)

setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/DataCleaning/HW1")

getwd()

link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(url = link, destfile = "CommunityHW2.csv")

install.packages("dplyr")

library(dplyr)
#library(tidyr)

acs<- tbl_df(read.table("CommunityHW2.csv", header = TRUE, sep = ","))

install.packages("sqldf")
library(sqldf)

check <- sqldf("select pwgtp1 from acs where AGEP < 50")

check3 <- data.frame(unique(acs$AGEP))
check3b <- data.frame(sqldf("select distinct AGEP from acs"))
check3$sql <- check3b

url <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- GET(url = url)
content2 <- content(html, as = "text")

install.packages("XML")
library(XML)
html2 <- htmlTreeParse(url, useInternalNodes = TRUE)
xpathSApply(html2, "//title", xmlValue)

con <- "http://biostat.jhsph.edu/~jleek/contact.html"
html3 <- readLines(con)
close(con)

x <- html3[c(10, 20, 30, 100)]
nchar(x)

url5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url = url5, destfile = "cpc.for")
Q5 <- tbl_df(read.fwf("cpc.for", skip=4,widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4)))
sum(Q5$V4)
