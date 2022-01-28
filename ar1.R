# Simulate a white noise series

set.seed(6381)  # Different seed from white_noise.R
w <- rnorm(n=200, mean=0, sd=1)
head(w)

# Autoregression

# Simple way to simulate AR(1) data
x <- numeric(length=200)
x.1<-0
for (i in 1:length(x)) {
	x[i] <- 0.7*x.1 + w[i]
	x.1 <- x[i]
}

# Show first few observations
head(cbind(x, w))

# Do not use first 100
x <- x[101:200]

library(astsa)
dev.new(width=8, height=6)
tsplot(x, ylab=expression(x[t]), xlab="t", main=expression(paste("AR(1): ", x[t] == 0.7*x[t-1] + w[t])))

# Correlation between x_t and x_t-1 
cor(x[2:100], x[1:99])

# Simulate AR(1) using arima.sim()

set.seed(7180)
x <- arima.sim(model=list(ar=c(0.7)), n=100, rand.gen=rnorm, sd=1)

dev.new(width=8, height=6)
tsplot(x, ylab=expression(x[t]), xlab="t",  main=expression(paste("AR(1): ", x[t] == 0.7*x[t-1] + w[t])))



# Examine ACF
dev.new(width=8, height=6)
rho.x <- acf(x, type="correlation", main=expression(paste("Data simulated from AR(1): ", x[t] == 0.7*x[t-1] + w[t], " where ", w[t], "~N(0,1)")))
rho.x
names(rho.x)
rho.x$acf
rho.x$acf[1:2]

dev.new(width=8, height=6)
gamma.x <- acf(x, type="covariance", main=expression(paste("Data simulated from AR(1): ", x[t] == 0.7*x[t-1] + w[t], " where ", w[t], "~N(0,1)")))
