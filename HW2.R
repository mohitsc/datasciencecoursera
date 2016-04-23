getwd()


## Polutant is a character vector of length 1 indicating the location of the CSX files
##'id' is an integer vector indiating the monitor ID numbers
## Return the mean of the pollutant, no rounding, ignore NA

setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/R Programming/specdata")

pollutantmean<- function(directory, pollutant, id = 1:332) {
        
}

# brief code below not used
" imod <- function(i){ 
        if (i < 10) {
                paste(00,i, sep="")
        }
        else{
                if(i>10 & i<100) {
                        paste(0,i,sep="")
                } else{ paste(i,sep="")
                        }
        }
}

imod(23)

imod(111)
"

# Step by step code


# first step is to list all file and name them "file"
files <- list.files(pattern = "*.csv")

NID <- 1:332

files2 <- files[NID]
specdata<- do.call(rbind, lapply(files2, function(a) read.csv(a, stringsAsFactors = FALSE)))

mean(specdata$nitrate, na.rm=TRUE)


# function to count no of observations

observations <- function(x){files3 <- files[x]
        specdata2<- do.call(rbind, lapply(files3, function(a) read.csv(a, stringsAsFactors = FALSE)))
        NROW(na.omit(specdata2))
}

observations(6)
observations(10)
observations(20)
observations(34)
observations(100)
observations(200)
observations(310)

observations(54)






thresh <- do.call(rbind,lapply(1:332, observations))


thresh1 <-data.frame(thresh)
thresh2 <-thresh1[thresh>41] 

set.seed(42)

thresh <- do.call(rbind,lapply(332:1, observations))
thresh1 <-data.frame(thresh)


use<- sample(332,10)
print(thresh1[use, "thresh"])


thresh <- do.call(rbind,lapply(1:332, observations))
thresh1 <-data.frame(thresh)

ID <- c(1:332)

ID

thresh1<-cbind(ID,thresh1)


threshold <- 2000
IDlist <- subset(thresh1,thresh >= threshold)
XID <- IDlist$ID
files4 <- files[XID]
specdata3<- do.call(rbind, lapply(files4, function(a) read.csv(a, stringsAsFactors = FALSE)))


uniqueID <- unique(XID)

cr <- numeric()

for(index in seq_along(uniqueID)) {
        tempID <- uniqueID[[index]]
        temp <- specdata3[specdata3$ID==tempID,]
        tests <- cor(temp$sulfate,temp$nitrate,use="pairwise.complete.obs")
        cr <- c(cr,tests)
}



### below is a loop for the homework!

"n <- length(cr)  
threshold <- 1000
IDlist <- subset(thresh1,thresh >= threshold)
XID <- IDlist$ID
files4 <- files[XID]
specdata3<- do.call(rbind, lapply(files4, function(a) read.csv(a, stringsAsFactors = FALSE)))


uniqueID <- unique(XID)

cr <- numeric()

for(index in seq_along(uniqueID)) {
        tempID <- uniqueID[[index]]
        temp <- specdata3[specdata3$ID==tempID,]
        tests <- cor(temp$sulfate,temp$nitrate,use="pairwise.complete.obs")
        cr <- c(cr,tests)
}

cr <- sort(cr)
print(c(n, round(cr, 4)))"
