
best <- function(State, Disease) {
        
        setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/R Programming/rprog-data-ProgAssignment3-data")
        
        HospitalData <- read.csv("hospital-data.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
        
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
        
        Output <- OutcomesState[which(OutcomesState$Condition == min(OutcomesState$Condition, na.rm = TRUE)),]
        
        Output2 <- Output[order(Output$Hospital),] 
        Output3 <- Output2[1,]
        
        print(Output3$Hospital)
        
} 


