# Two ways to simulate observations from this model
# 1. Using for loop
set.seed(7328)  
w <- rnorm(n=200, mean=0, sd=1)

x <- numeric(length=200)
x_1 <- 0
x_2 <- 0
for (i in 1:length(x)) {
	x[i] <- 1.7*x_1-0.7*x_2+w[i]
	x_2 <- x_1
	x_1 <- x[i]
}

# Do not use first 100
x <- x[101:200]

library(astsa)
dev.new(width=8, height=6)
tsplot(x, ylab=expression(x[t]), xlab="t", type="o", main=expression(paste("Data simulated from ", (1-0.7*B)*(1-B)*x[t] == w[t], " where ", w[t], "~N(0,1)")))

# Find first differences
x_diff <- diff(x, lag=1, differences=1)
dev.new(width=8, height=6)
tsplot(x_diff, ylab=expression(x[t]-x[t-1]), xlab="t (time)", type="o", main=expression(paste("1st diff. for data simulated from ", (1-0.7*B)*(1-B)*x[t] == w[t], " where ", w[t], "~N(0,1)")))

# 2. Using for arima.sim() - more on this function in Chapter 3

set.seed(4782)
x <- arima.sim(model=list(order=c(1,1,0), ar=c(0.7)), n=100, rand.gen=rnorm, sd=1)

dev.new(width=8, height=6)
tsplot(x, ylab=expression(x[t]), xlab="t", type="o", main=expression(paste("Data simulated from ", (1-0.7*B)*(1-B)*x[t] == w[t], " where ", w[t], "~N(0,1)")))

# Find first differences
x_diff <- diff(x, lag=1, differences=1)
dev.new(width=8, height=6)
tsplot(x_diff, ylab=expression(x[t]-x[t-1]), xlab="t (time)", type="o", main=expression(paste("1st diff. for data simulated from ", (1-0.7*B)*(1-B)*x[t] == w[t], " where ", w[t], "~N(0,1)")))

