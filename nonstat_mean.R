nonstat_mean <- read.table("nonstat_mean.txt", header=TRUE)

attach(nonstat_mean)

library(astsa)
dev.new(width=8, height=6)
tsplot(x, ylab=expression(x[t]), xlab="t (time)", main="Nonstationary time series")

dev.new(width=8, height=6)
nonstat_acf <- acf(x, main="Plot of the ACF")
nonstat_acf[1:10]


# Find first differences
first_diff <- diff(x, lag=1, differences=1) 
first_diff[1:5]
x[2] - x[1]
x[3] - x[2]

dev.new(width=8, height=6)
tsplot(first_diff, ylab=expression(x[t]-x[t-1]), xlab="t (time)", type="o", main="First differences")

dev.new(width=8, height=6)
stat_acf <- acf(first_diff, main="Plot of the ACF for first differences")
head(stat_acf)

