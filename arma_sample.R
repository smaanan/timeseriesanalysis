ar.model <- c(0.8)
ma.model <- c(0.5)
plot.title <- "AR=0.8, MA=0.5"

# ar.model <- c(0.8)
# ma.model <- c(0)
# plot.title <- "AR=0.8"

# ar.model <- c(0)
# ma.model <- c(0.5)
# plot.title <- "MA=0.5"

# ar.model <- c(0.7, -0.5)
# ma.model <- c(-0.5)
# plot.title <- "AR=0.7, -0.5, MA=-0.5"


# Simulate the data
set.seed(1788)
x <- arima.sim(model=list(ar=ar.model, ma=ma.model), n=1000, rand.gen=rnorm, sd=1)

# Plot of the data
library(astsa)
dev.new(width=8, height=6)  
tsplot(x, ylab=expression(x[t]), xlab="t", main=paste("ARMA model:", plot.title))

# Estimated ACF and PACF
dev.new(width=8, height=6)  
acf2(x, ylim=c(-1,1), max.lag=20, main = paste("ARMA model:", plot.title))

# True ACF and PACF
dev.new(width=8, height=6)  
par(mfrow=c(2,1))
tsplot(ARMAacf(ar=ar.model, ma=ma.model, lag.max=20)[-1], type="h", ylim=c(-1,1), xlab="h", ylab=expression(rho(h)), main=paste("True ARMA model:", plot.title))
abline(h=0)
tsplot(ARMAacf(ar=ar.model, ma=ma.model, lag.max=20, pacf=TRUE), type="h", ylim=c(-1,1), xlab="h", ylab=expression(phi[hh]), main = paste("True ARMA model:", plot.title))
abline(h=0)
