
x <- 2
g <- function() {
        y <- 1
        c(x, y)
}
g()

rm(x,g)

x <- 1
h <- function() {
        y <- 2
        i <- function() {
                z <- 3
                c(x, y, z)
        }
        i()
}
h()

rm(x,h)

j <- function(x) {
        y <- 2
        function() {
                c(x, y)
        }
}
k <- j(7)
k()
k<-j(5)
k()

rm(j,k)

l <- function(x) x + 1
m <- function() {
        l <- function(x) x * 2
        l(10)
}
m()

l(2)

rm(l,m)

f <- function(x) {
        f <- function(x) {
                f <- function(x) {
                        x ^ 2
                }
                f(x) + 1
        }
        f(x) * 2
}
f(10)

rm(f)

f <- function(x) (x+3)
f(10)

(function(x) x+3)(10)

library(datasets)

View(mtcars)
head(mtcars)

x <- sd(mtcars$mpg)
y <- mean(mtcars$mpg)

xxx <- function(x) {
        sd(x) / mean(x)
}

lapply(mtcars, sd)

df2<-data.frame(lapply(mtcars, function(x) sd(x)/mean(x)))


library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)

lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

mylist<-list(x=c(1,5,7), y=c(4,2,6), z=c(0,3,4))
lapply(mylist, function(x) mean(x))
sapply(mylist, function(x) mean(x))

span.func <- function(x) { (max(x) - min(x)) >5}
lapply(mylist, span.func)

list2 <- lapply(1:3, function(x) matrix(rnorm(6,10,1),nrow=2,ncol=3))
lapply(list2, colSums)

#create some data
set.seed(2000)
x=rbinom(1000,1,.6)
mydata<-data.frame(trt=x,
                   out1=x*3+rnorm(1000,0,3),
                   out2=x*5+rnorm(1000,0,3),
                   out3=rnorm(1000,5,3),
                   out4=x*1+rnorm(1000,0,8))
results<-vector("list", 4)
for(i in 1:4){
        results[[i]] <- lm(mydata[,i+1]~trt, data=mydata)
}

str(results)

results <- lapply(2:5, function(x) lm(mydata[,x]~trt, data=mydata))
head(results)
