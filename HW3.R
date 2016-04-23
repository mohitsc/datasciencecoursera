getwd()

setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/R Programming/rprog-data-ProgAssignment3-data")

HospitalData <- read.csv("hospital-data.csv", na.strings = "Not Available", stringsAsFactors = FALSE)

summary(HospitalData)

head(HospitalData)

str(HospitalData)

OutcomesData <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)

str(OutcomesData)

OutcomesData[, 11] <- as.numeric(OutcomesData[, 11])

OutcomesData[, 19] <- as.numeric(OutcomesData[, 19])

hist(OutcomesData[,11], breaks=20, xlab="30-Day Death (Mortality) Rates from Heart Attack", main= paste("Histogram of 30-Day Death (Mortality) Rates from Heart Attack"), col="pink", border="red", ylim = c(0,400))

hist(OutcomesData[,19])

## Renaming columns

Outcomes <- OutcomesData[,c(2,7,11,17,23)]

head(Outcomes)

names(Outcomes) <- c("Hospital", "State", "HeartAttack", "HeartFailure", "Pneumonia")

OutcomesState <- Outcomes[which(Outcomes$State == "CA"),]

best <- OutcomesState[which(OutcomesState$HeartAttack == min(OutcomesState$HeartAttack, na.rm = TRUE)),]




