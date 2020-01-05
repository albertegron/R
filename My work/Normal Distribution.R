# The Normal Distribution in R

#Question 1:
#   1. Generate a sample of size 100 from a standard normal distribution and save it in A. Recommended function: rnorm()
#   2. Estimate mean and standard deviation of A.
#   3. Draw a sample of size 100 from a normal distribution with mean 2 and standard deviation 5 and save it in B.
#   4. Estimate mean and standard deviation of B.
#   5. Find the height of the normal distribution for 1.96. Recommended function: dnorm()

# Answers
#1
A=rnorm(100)

#2
mean(A)
sd(A)

#3
set.seed()
B <- rnorm(100, 2, 5)

#4
mean(B)
sd(B)

#5
dnorm(1.96)

# Question 2
#Assume that the test scores of a college entrance exam fits a normal distribution. Furthermore, the mean test score is 62, 
#and the standard deviation is 14.2. What is the percentage of students scoring 86 or more in the exam?

pnorm(86, mean=62, sd=14.2, lower.tail=FALSE)

# Question 3
#Joe and Jenn often travel to University from their job in Mississauga. Jenn tends to drive from the highway, so her arrival to 
#the University has a Normal distribution with a mean of 30 minutes and a standard deviation 3 minutes. Joe tends to prefer side roads 
#so he sometimes get stuck behind school buses but makes up for the lost time by driving faster. His arrival time has a normal 
#distribution with a mean of 27 minutes with a standard deviation of 7 minutes. Their travel times are independent from each other.

#   1. On Joe's probability distribution curve, find the height of the curve, in case arriving in 28.5 minutes.
#   2. How does Joe's arrival time distribution look like, plot the period from 15 to 45 minutes?
#   3. Create a normally distributed sample set for Joe with a size of 200. Plot a histogram for this dataset.
#   4. Find Jenn's arrival time corresponding to the 80th percentile i.e (what is the time of arrival corresponding to 80% of times).
#   5. Find the probability that Joe arrives to the University in 20 minutes or less.
##      Using the same pnorm() function, find the probability that Joe arrives to the University in 1 or less minutes, 5 or less 
##      minutes, 10 or less minutes, 15 or less minutes.

#1
dnorm(28.5, mean=27, sd= 7)

#2 
# split.screen( figs = c( 1, 1 ) ) 
curve(dnorm(x, mean=27, sd= 7), from=0, to=50) #Wrong mean and sd on answer key!
# Alternative
x <- 10:50
plot(x,dnorm(x, mean=27, sd= 7),type="h")
plot(dnorm(10:50, mean=27, sd= 7), type = "h")

#3
set.seed(25)
hist(rnorm(200, 27,7), breaks = 100)

#4
qnorm(0.8, mean =30, sd = 3)
# 80% of the values in the distribution are LESS then this value

#5
pnorm(20, mean = 27, sd = 7)
pnorm(15, mean = 27, sd = 7)
pnorm(10, mean = 27, sd = 7)
pnorm(5, mean = 27, sd = 7)
pnorm(1, mean = 27, sd = 7)