#Sampling Distributions

#   - Create a vector containing the same population as the lecture c(5, 10, 15).
#   - Install the package "gtools" in R.
#   - Use the premutations function in gtools to list all possible outcomes when 2
#     numbers are selected with replacement. Hint: Set the argument. repeats.allowed =TRUE in the premutations function
#   - Use the rowMeans() function to calculate the mean of each possible pair of outcomes.
#   - Is the mean of the original population == the mean of the row means?
#   - Use the hist() function to draw a histogram of the pairs' means.

#Install gtools package
#install.packages("gtools")

library(gtools)

#Create the population
population <- c(5, 10, 15)

#Get all possible outcomes for 2 selected numbers
perm <- permutations(length(population), 2, population, repeats.allowed =TRUE)

#Calculate the mean of the pairs
mean_perm <- rowMeans(perm)

#Check if the mean of all pairs is equal to the mean of the population
mean(rowMeans(perm)) == mean(population)

#Draw a histogram
hist(mean_perm)

# The CLT says that if you take many repeated samples from a population,
# and calculate the averages or sum of each one, the collection of those
# averages will be normally distributed and it doesnt matter what the
# shape of the source distribution is

#Central Limit Theorem Simulation
sdm.sim <- function(n,src.dist=NULL,param1=NULL,param2=NULL) {
  r <- 10000  # Number of replications/samples - DO NOT ADJUST
  # This produces a matrix of observations with  
  # n columns and r rows. Each row is one sample:
  my.samples <- switch(src.dist,
                       "E" = matrix(rexp(n*r,param1),r),
                       "N" = matrix(rnorm(n*r,param1,param2),r),
                       "U" = matrix(runif(n*r,param1,param2),r),
                       "P" = matrix(rpois(n*r,param1),r),
                       "C" = matrix(rcauchy(n*r,param1,param2),r),
                       "B" = matrix(rbinom(n*r,param1,param2),r),
                       "G" = matrix(rgamma(n*r,param1,param2),r),
                       "X" = matrix(rchisq(n*r,param1),r),
                       "T" = matrix(rt(n*r,param1),r))
  all.sample.sums <- apply(my.samples,1,sum)
  all.sample.means <- apply(my.samples,1,mean)   
  all.sample.vars <- apply(my.samples,1,var) 
  par(mfrow=c(2,2))
  hist(my.samples[1,],col="gray",main="Distribution of One Sample")
  hist(all.sample.sums,col="gray",main="Sampling Distributionnof
       the Sum")
  hist(all.sample.means,col="gray",main="Sampling Distributionnof the Mean")
  hist(all.sample.vars,col="gray",main="Sampling Distributionnof
       the Variance")
}

#Examine the function in the script. Run the function and make sure you can see it in the memory.

# Step 2 (Normal Distribution):
# 1- On the R console: call the function as:
sdm.sim(5, src.dist="N", param1=20, param2=3)

#2- Change the sample size from 10 -20 and call the function.
sdm.sim(20,src.dist="N",param1=20,param2=3)
sdm.sim(20,src.dist="P",param1=10)

# Step 3 (Poisson distribution):
#Study the function arguments and call the function for the Poisson distribution.

#Test 1
#Set the sample mean (lambda) at 20 and sample size set 10.
#Record your findings.

par(mfrow=c(1,2))
set.seed(25)
hist(rpois(10,20))
hist(rnorm(10,20,20^0.5))

#Test 2
#Now keep lambda at 5 and start a test with a sample size equal to 2
#Increment the sample size by 1 till you reach a value of 15 and record your findings.

set.seed(25)
mean(rpois(10,5))
mean(rnorm(10,5,5^0.5))

#Part 2 - Convergence

#     Convergence of Poisson and Binomial Distribution to Normal Distribution, 
#     Prove the following statements using R
#1. When the sample set is large, Poisson distribution with lambda n converges to Normal distribution with 
#   mean n and variance n.
#2. When the sample set is large, Binomial distribution with n trials and a probability with p converges to 
#   normal distribution with mean n*p and variance n*p*(1-p).

#1 - Poisson to Normal
par(mfrow=c(1,2))
set.seed(26)
hist(rpois(10000000,50))
set.seed(26)
hist(rnorm(10000000,50,50^0.5)) 

set.seed(26)
mean(rpois(10000000,50))
set.seed(26)
mean(rnorm(10000000,50,50^0.5))

#P distribution's variance is lambda as well
set.seed(26)
sd(rpois(10000000,50))
# we claim lambda of P is the variaqnce of the N dist
set.seed(26)
sd(rnorm(10000000,50,50^0.5))

#2 - Binomial to Normal
set.seed(25)
hist(rbinom(10000000,50,0.2))
set.seed(25)
hist(rnorm(10000000,10,8^0.5)) #How did we obtain 8?

set.seed(25)
mean(rbinom(100000,50,0.2))
set.seed(25)
mean(rnorm(100000,10,8^0.5)) 

set.seed(25)
# sd of B dist is (npq)^0.5
sd(rbinom(100000,50,0.2)) 
(50*0.2*0.8)^0.5
# and we have used that value for N dist's sd
sd(rnorm(100000,10,8^0.5))
