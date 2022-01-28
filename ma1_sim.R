# Simulate MA(1) using arima.sim()

set.seed(8199)
x <- arima.sim(model=list(ma=c(0.7)), n=100, rand.gen=rnorm, sd=10)

library(astsa)
dev.new(width=8, height=6)
tsplot(x, ylab=expression(x[t]), xlab="t", type="l", main=expression(paste(x[t] == w[t] + 0.7*w[t-1], " where ", w[t], " ~ ind. N(0,100)")))

dev.new(width=8, height=6)
par(mfrow=c(2,1))
tsplot(ARMAacf(ma=c(0.7), lag.max=20), x=0:20, type="h", ylim=c(-1,1), xlab="h", ylab=expression(rho(h)), main=expression(paste("ACF for MA(1) with ", theta[1]==0.7)))
abline(h=0)

tsplot(ARMAacf(ma=c(-0.7), lag.max=20), x=0:20, type="h", ylim=c(-1,1), xlab="h", ylab=expression(rho(h)), main=expression(paste("ACF for MA(1) with ", theta[1]==-0.7)))
abline(h=0)


# PACF
dev.new(width=8, height=6)
par(mfrow=c(2,1))
tsplot(ARMAacf(ma=c(0.7), lag.max=20, pacf=TRUE), type="h", ylim=c(-1,1), xlab="h", ylab=expression(phi[hh]), main=expression(paste("PACF for MA(1) with ", theta[1]==0.7)))
abline(h=0)

tsplot(ARMAacf(ma=c(-0.7), lag.max=20, pacf=TRUE), type="h", ylim=c(-1,1), xlab="h", ylab=expression(phi[hh]), main=expression(paste("PACF for MA(1) with ", theta[1]==-0.7)))
abline(h=0)

