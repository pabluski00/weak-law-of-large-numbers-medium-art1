### P. KOWALSKI KUTZ
### 2021 / 07 / 15
### ART1
### WEAK LAW OF LARGE NUMBERS 

################################################################################
set.seed(123)
##### Generating 5000 random uniform observations 
uniform_observations <- runif(5000, 0, 1)

##### Plotting the random uniform observations
plot(1:5000, uniform_observations, 
     main="Uniform observations", ylab="Observations' values",
     pch=19, col="navy blue", cex=0.5)

################################################################################
##########################     WEIBULL(1,1)     ################################

##### F^(-1)(x) of Weibull(1,1)
inversefunction_weibull11 <- function(x) {
  return (-log(1-x))
}
xi <- sapply(uniform_observations, inversefunction_weibull11)
i <- 1:5000

##### Plotting a simulation of the 5000 observations from Weibull(1,1)
plot(i, xi, 
     main="Simulation of 5000 observations from Weibull(1,1)",
     xlab="i", ylab=expression('x'["i"]), pch=19, col="navy blue", cex=0.5)

##### Calculating Xbar
calculating_average <- function(list1, n) {
  return (mean(list1[1:n]))
}
sample_means <- c(rep(0,length(i)))
for (j in i) {
  sample_means[j] <- calculating_average(xi, j)
}

##### Plotting the sample means of 5000 observations from Weibull(1,1)
plot(i, sample_means, 
     main="Sample means of 5000 observations from Weibull(1,1)",
     xlab="n", ylab="Sample means", pch=19, col="navy blue", cex=0.5)
abline(h=1, col="red")

##### Plotting the difference of 5000 observations from Weibull(1,1)
difference <- abs(sample_means - 1) ### 1 is the mean of Weibull(1,1)
plot(i, difference, 
     main="Difference of 5000 observations from Weibull(1,1)",
     xlab="n", ylab="Difference", pch=19, col="navy blue", cex=0.25)
abline(h=0, col="red")


################################################################################
#######################     RAYLEIGH(sigma=1)      #############################

##### F^(-1)(x) of Rayleigh(1)
inversefunction_rayleigh1 <- function(x) {
  return (sqrt(-2*log(1-x)))
}
xi <- sapply(uniform_observations, inversefunction_rayleigh1)
i <- 1:5000

##### Plotting a simulation of the 5000 observations from Rayleigh(1)
plot(i, xi, 
     main=expression(paste("Simulation of 500 observations from Rayleigh(",
                           sigma, " = 1)")),
     xlab="i", ylab=expression('x'["i"]), pch=19, col="navy blue", cex=0.5)

##### Calculating Xbar
calculating_average <- function(list1, n) {
  return (mean(list1[1:n]))
}
sample_means <- c(rep(0,length(i)))
for (j in i) {
  sample_means[j] <- calculating_average(xi, j)
}

##### Plotting the sample means of 5000 observations from Rayleigh(1)
plot(i, sample_means, 
     main=expression(paste("Sample means of 5000 observations from Rayleigh(", 
                           sigma, " = 1)")),
     xlab="n", ylab="Sample means", pch=19, col="navy blue", cex=0.5)
abline(h=sqrt(pi/2), col="red") ### sqrt(pi/2) is the mean of Rayleigh(1)

##### Plotting the Difference of 5000 observations from Rayleigh(1)
difference <- abs(sample_means - sqrt(pi/2))
plot(i, difference, 
     main="Difference of 5000 observations from Rayleigh(1)",
     xlab="n", ylab="Difference", pch=19, col="navy blue", cex=0.25)
abline(h=0, col="red")


################################################################################
##########################     Cauchy(1,1)      ################################

set.seed(123)

##### F^(-1)(x) of Cauchy(1,1)
inversefunction_cauchy11 <- function(x) {
  return (1 + tan(pi*(x-0.5)))
}
xi <- sapply(uniform_observations, inversefunction_cauchy11)
i <- 1:5000

##### Plotting a simulation of the 5000 observations from Cauchy(1,1)
plot(i, xi, 
     main="Simulation of 500 observations from Cauchy(1,1)",
     xlab="i", ylab=expression('x'["i"]), pch=19, col="navy blue", cex=0.5)

##### Calculating Xbar
calculating_average <- function(list1, n) {
  return (mean(list1[1:n]))
}
sample_means <- c(rep(0,length(i)))
for (j in i) {
  sample_means[j] <- calculating_average(xi, j)
}

##### Plotting the sample means of 5000 observations from Cauchy(1,1)
plot(i, sample_means, 
     main="Sample means of 500 observations from Cauchy(1,1)",
     xlab="n", ylab="Sample means", pch=19, col="navy blue", cex=0.5)

