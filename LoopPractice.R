# Practice looping

a <- 1:10
x <- 10:30

start <- length(a) + 1
end <- start + length(x) -1

a[start:end] <- x

a

a <- 1:10
b <- 11:15
c <- numeric()

a
b
c

vectors <- list(a = a, b=b, c=c)

vectors

vectors[[3]]

start <- end <- 0

results <- numeric()

for(index in seq_along(vectors)) {
        values <- vectors[[index]]
        size <- length(values)
        if (size>0) { 
                start <- end +1
                end <- start +size -1
                results[start:end] <- values
        }
}

results

data.frame (a=1:10,b=21:30)

frames <- list(data.frame(a=1:10, b=21:30), data.frame(a=11:15, b=31:35))

results <- list(a=numeric(), b=numeric())

# initialize start and end indices

start.a <- start.b <- end.a <- end.b <- 0

for (index in seq_along(frames)) {
        values <- frames[[index]]
        size.a <- length(values$a)
        size.b <- length(values$b)
        if (size.a>0) {
                start.a <- end.a +1
                end.a <- start.a + size.a -1
                results$a[start.a:end.a] <- values$a
        }
        if (size.b >0) {
                start.b <- end.b +1
                end.b <- start.b + size.b - 1
                results$b[start.b:end.b] <- values$b
        }
        
}

results

frames

results <- data.frame(a = unlist(results$a), b = unlist(results$b))

results

summary(results)

values <- numeric ()

for (index in seq_along(frames)) {
        frame <- frames[[index]]
        value <- mean(frame$a)
        valueb <- mean(frame$b)
        values <- c(values, value, valueb) 
}

values





