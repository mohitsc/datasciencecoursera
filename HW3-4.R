rankall <- function(Disease, rank = "best") {
        
        setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/R Programming/rprog-data-ProgAssignment3-data")
        
        OutcomesData <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
        
        OutcomesData[, 11] <- as.numeric(OutcomesData[, 11])
        
        options <- c("heart attack", "heart failure", "pneumonia")
        if (Disease %in% options == FALSE) stop("Invalid Condition")
        
        if (Disease == "heart attack") {
                Outcomes <- OutcomesData[,c(2,7,11)]
        } else if (Disease == "heart failure") { 
                Outcomes <- OutcomesData[,c(2,7,17)]
        } else Outcomes <- OutcomesData[,c(2,7,23)]
        
        names(Outcomes) <- c("Hospital", "State", "Condition")
        
        Outcomes <- Outcomes[complete.cases(Outcomes$Condition),]
        Outcomes <- Outcomes[order(Outcomes$State, Outcomes$Hospital),]
        
        SplitData <- split(Outcomes, Outcomes$State)
        
        rankfunc <- function(x) {
                x$HospRank<- rank(x[,3], ties.method="first")
                x
        }       
        
        rankfunc2 <- function (x) {
                if (rank=="best") { 
                        rank <- 1
                } else if (rank == "worst") {
                        rank <- max(x[,4])
                } else {
                        rank <- rank
                }
                x <-  x[which(x[,4] == rank),]
                x[1,]
        }
        
        SplitData2 <- lapply(lapply(SplitData, rankfunc), rankfunc2)
        
        Output <- do.call("rbind",SplitData2)
        Output[,c(1,2)]
} 



