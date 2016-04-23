
rankhospital <- function(State, Disease, rank = "best") {
        
        setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/R Programming/rprog-data-ProgAssignment3-data")
        
        OutcomesData <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
        
        OutcomesData[, 11] <- as.numeric(OutcomesData[, 11])
        
        options <- c("heart attack", "heart failure", "pneumonia")
        if (Disease %in% options == FALSE) stop("Invalid Condition")
        
        States <- unique(OutcomesData$State)
        if (State %in% States == FALSE) stop("Invalid State")
        
        if (Disease == "heart attack") {
                Outcomes <- OutcomesData[,c(2,7,11)]
        } else if (Disease == "heart failure") { 
                Outcomes <- OutcomesData[,c(2,7,17)]
        } else Outcomes <- OutcomesData[,c(2,7,23)]
        
        names(Outcomes) <- c("Hospital", "State", "Condition")
        
        OutcomesState <- Outcomes[which(Outcomes$State == State),]
        OutcomesState <- OutcomesState[order(OutcomesState$Hospital),]
        OutcomesState$HospRank<- rank(OutcomesState$Condition, ties.method="first")
        OutcomesState <- OutcomesState[complete.cases(OutcomesState$Condition),]
        min(OutcomesState$HospRank)
       
        
         if (rank=="best") { 
                rank <- 1
        } else if (rank == "worst") {
                       rank <- max(OutcomesState$HospRank)
        } else {
                        rank <- rank
               }
        
        Output <-  OutcomesState[which(OutcomesState$HospRank == rank),]
        print(Output[1,1])
} 

