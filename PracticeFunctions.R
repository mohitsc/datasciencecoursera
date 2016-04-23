add2 <- function(x,y) {
  x+y
}

add2(3,7)

getwd()
setwd("C:/Users/Mohit Singh-Chhabra/Google Drive/Mohit/Data Science/R Programming/quiz1_data")
hw <-read.csv("hw1_data.csv",nrows=155)

hw

above10 <-  function(x) {
  use <- x > 10
  x[use]
}

x <- c(1:20)
x

above10(x)

above <- function(x,n =13) {
  use<- x>n
  x[use]
}

above(x)

columnmean <- function(y) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i])
  }
  means
}


columnmean(hw)

columnmean <- function(y, removeNA=TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm= removeNA)
  }
  means
}


columnmean(hw)

f <- function(a,b=4) {
  a^2- b
}
f(7)

paste ("a","b", sep ="XOXO")

make.power <- function(n) {
  pow<- function(x) {
    x^n
  }
pow
  }

cube <- make.power(3)

cube(2)

x <- list(1:3,4:6,7:9)
x
lapply(x, mean)

rbind(x)

do.call(rbind,x)

y <- numeric(4)
y