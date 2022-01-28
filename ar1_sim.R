# Simulate AR(1) using arima.sim()

set.seed(7181)
x <- arima.sim(model=list(ar=c(0.7)), n=100, rand.gen=rnorm, sd=10)
# Use -0.7 for second plot

library(astsa)
dev.new(width=8, height=6)
tsplot(x, ylab=expression(x[t]), xlab="t", main = expression(paste(x[t] == 0.7*x[t-1] + w[t], " where ", w[t], "~ ind. N(0,100)")))

# Using ARMAacf() function.

ARMAacf(ar=c(0.7), lag.max=20)

dev.new(width=8, height=6)
par(mfrow=c(2,1))
tsplot(ARMAacf(ar=c(0.7), lag.max=20), x=0:20, type="h", ylim=c(-1,1), xlab="h", ylab=expression(rho(h)), main=expression(paste("ACF for AR(1) with ", phi[1]==0.7)))
abline(h=0)

tsplot(ARMAacf(ar=c(-0.7), lag.max=20), x=0:20, type="h", ylim=c(-1,1), xlab="h", ylab=expression(rho(h)), main=expression(paste("ACF for AR(1) with ", phi[1]==-0.7)))
abline(h=0)



# PACF for AR(1)
ARMAacf(ar=c(0.7), lag.max=20, pacf=TRUE)

dev.new(width=8, height=6)
par(mfrow=c(2,1))
tsplot(ARMAacf(ar=c(0.7), lag.max=20, pacf=TRUE), type="h", ylim=c(-1,1), xlab="h", ylab=expression(phi[hh]), main=expression(paste("PACF for AR(1) with ", phi[1]==0.7)))
abline(h=0)

tsplot(ARMAacf(ar=c(-0.7), lag.max=20, pacf=TRUE), type="h", ylim=c(-1,1), xlab="h", ylab=expression(phi[hh]), main=expression(paste("PACF for AR(1) with ", phi[1]==-0.7)))
abline(h=0)

