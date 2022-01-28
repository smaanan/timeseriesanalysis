set.seed(8128)
w <- rnorm(n=100, mean=0, sd=1)
head(w)

# moving average

m <- filter(w, filter=rep(x=1/3, times=3), method="convolution", sides=1)
head(m)
tail(m)
(w[1]+w[2]+w[3])/3
(w[98]+w[99]+w[100])/3

# This is what the book does
# m <- filter(w, filter=rep(x =1/3, times=3), method="convolution", sides=2)

library(astsa)
dev.new(width=8, height=6)
tsplot(m, ylab=expression(m[t]), xlab="t", col="brown", main=expression(paste("Moving average where ", m[t] == (w[t] + w[t-1] + w[t-2])/3)))


dev.new(width=8, height=6)
tsplot(m, ylab=expression(paste(m[t], " or ", w[t])), xlab="t", col="brown", lwd=4, ylim=c(min(w), max(w)), main=expression(paste("Moving average where ", m[t] == (w[t] + w[t-1] + w[t-2])/3)))
lines(w, col="red", lty="dotted")
legend("top", legend=c("Moving average", "White noise"), lty=c("solid","dotted"), col=c("brown","red"), lwd=c(4,1), bty="n")

# 7-point moving average
m7 <- filter(w, filter=rep(x=1/7, times=7), method="convolution", sides=1)

dev.new(width=8, height=6)
tsplot(m, ylab=expression(paste(m[t], " or ", w[t])), xlab="t", col="brown", lwd=2, ylim=c(min(w), max(w)), main="Compare moving averages")
lines(w, col="red", lty="dotted")
lines(m7, col="lightgreen", lty="solid", lwd=4)
legend("top", legend=c("3-pt Moving average", "White noise", "7-pt Moving average"), lty=c("solid", "dotted", "solid"), col=c("brown", "red", "lightgreen"), lwd=c(2,1,4), bty="n")

