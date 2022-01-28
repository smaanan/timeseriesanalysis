# Simulate a white noise series

set.seed(8128)
w <- rnorm(n=100, mean=0, sd=1)
head(w)

library(astsa)
dev.new(width=8, height=6)
tsplot(w, ylab=expression(w[t]), xlab="t", col="red", main=expression(paste("White noise where ", w[t], " ~ ind. N(0, 1)")))

# Simulate a second series

set.seed(1298)
w.new <- rnorm(n=100, mean=0, sd=1)
head(w.new)

dev.new(width=8, height=6)
tsplot(w, ylab=expression(w[t]), xlab="t", col="red", ylim=c(min(w.new, w), max(w.new, w)), main=expression(paste("White noise where ", w[t], " ~ ind. N(0, 1)")))
lines(w.new, col="blue")
legend("top", legend=c("Time Series 1", "Time Series 2"), lty=c(1,1), col=c("red", "blue"), bty="n")


dev.new(width=8, height=6)
par(mfrow=c(2,1))
tsplot(w, ylab=expression(w[t]), xlab="t", col="red", main=expression(paste("White noise where ", w[t], " ~ ind. N(0, 1)")))
tsplot(w.new, ylab=expression(w.new[t]), xlab="t", col=c("blue"), main=expression(paste("White noise where ", w.new[t], " ~ ind. N(0, 1)")))



