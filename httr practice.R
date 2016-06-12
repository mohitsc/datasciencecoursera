
getwd()

setwd("C:/Users/Mohit/Google Drive/Mohit/Data Science/DataCleaning")

if(!file.exists("data")){
  dir.create("data")
}

fileurl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"

download.file(fileurl, "./data/cameras.xlsx")
datedownloaded <- date()
datedownloaded

CameraData <- read.table("./data/cameras.csv", sep = ",", header= TRUE, quote ="")

head(CameraData)

install.packages("xlsx")

library(xlsx)


library(httr)

install.packages("httr")
install.packages("jsonlite")

library(httr)
library(jsonlite)


key <- "gOaaA76HxIPESOMRVJugLfnXNf8WhkR7k0wsXhpb"
add1 <- "101, Broadway, Oakland, CA"

sample2 <- GET("http://api.data.gov/nrel/utility_rates/v3.json", query = list(api_key = key, address=add1))
result2 <- content(sample2)

result2 <- content(sample2)

result2$outputs$utility_info[[1]]$utility_name
result2$outputs$residential


add1 <- "101 Broadway, Oakland, CA"
sample1<- GET("https://maps.googleapis.com/maps/api/geocode/json", query = list(address = add1))

result1 <- content(sample1)
result1$results[[1]]$geometry$location$lat
result1$results[[1]]$geometry$location$lng

# combine above two calls into a function

library(httr)
google_url <- "https://maps.googleapis.com/maps/api/geocode/json"
gov_url <- "http://api.data.gov/nrel/utility_rates/v3.json"

geoCode <- function(address, verbose = FALSE) {
        r <- GET(google_url, query = list(address = address))
        stop_for_status(r)
        result1 <- content(r)
        if(!identical(result1$status, "OK")) {
                warning("Please input valid US address", call. = FALSE)
                return(c(NA,NA,NA,NA,NA,NA))
        }
        s <- GET(gov_url, query = list(api_key = "gOaaA76HxIPESOMRVJugLfnXNf8WhkR7k0wsXhpb", lat = result1$results[[1]]$geometry$location$lat, lon = result1$results[[1]]$geometry$location$lng))
        stop_for_status(s)
        result2 <- content(s)
        if (result2$outputs$utility_name == "no data") {
                warning("Please input a valid US address.", call. = FALSE)
                return(c(NA,NA,NA,NA,NA,NA))
        }
        first <- result1$results[[1]]
        second <- result2$outputs
        list(
                lat = first$geometry$location$lat,
                lon = first$geometry$location$lng,
                type = first$geometry$location_type,
                address = first$formatted_address,
                utility = second$utility_info[[1]]$utility_name,
                residential_rate_kwh = second$residential
        )
}

geoCode("San Francisco, CA")
geoCode("Seattle, WA")




