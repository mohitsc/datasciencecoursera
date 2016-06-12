library(httr)
library(XML)

con <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")

htmlCode <- readLines(con)
close(con)
htmlCode

WebUrl <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(WebUrl, useInternalNodes = TRUE)
xpathSApply(html, "//title", xmlValue)

xpathSApply(html, "//td[@id='col-Citedby']", xmlValue)

install.packages("jsonlite")

