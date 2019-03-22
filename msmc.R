mu <- 1.25e-8
gen <- 30
afrDat<-read.table("AFR.msmc2.final.txt", header=TRUE)
eurDat<-read.table("EUR.msmc2.final.txt", header=TRUE)
plot(afrDat$left_time_boundary/mu*gen, (1/afrDat$lambda)/(2*mu), log="x",ylim=c(0,100000),
     type="n", xlab="Years ago", ylab="effective population size")
lines(afrDat$left_time_boundary/mu*gen, (1/afrDat$lambda)/(2*mu), type="s", col="red")
lines(eurDat$left_time_boundary/mu*gen, (1/eurDat$lambda)/(2*mu), type="s", col="blue")
legend("topright",legend=c("African", "European"), col=c("red", "blue"), lty=c(1,1))

mu <- 1.25e-8
gen <- 30
crossPopDat<-read.table("EUR_AFR.combined.msmc2.final.txt", header=TRUE)
plot(crossPopDat$left_time_boundary/mu*gen, 2 * crossPopDat$lambda_01 / (crossPopDat$lambda_00 + crossPopDat$lambda_11),
     xlim=c(1000,500000),ylim=c(0,1), type="n", xlab="Years ago", ylab="relative cross-coalescence rate")
lines(crossPopDat$left_time_boundary/mu*gen, 2 * crossPopDat$lambda_01 / (crossPopDat$lambda_00 + crossPopDat$lambda_11), type="s")

