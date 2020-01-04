# Exercise 1
# Binomial

#Question 1a: Investigate the probability distribution of 5 coin tosses and find the 
#probability of getting at least four heads.

#Steps :
#  1)Investigate the rbinom() function and check all the possible arguments.
#  2)Use rbinom() to generate a simulation of 10,000 observations and store the outcome to variable x.
#  3)Create a histogram for x using hist() function
#  4)Create a new variable y, that stores information about 10 random tosses.
#  5)Create a histogram for y using hist() function
#  6)Repeat the steps from 2 to 5. What are the differences you can observe in these histograms?
#  7)Investigate the dbinom() function to find the

# Q1a
set.seed(100)
x <- rbinom(10000,5,0.5) #2
hist(x) #3
y <- rbinom(10,5,0.5) #4
hist(y) #5
dbinom(4,5,0.5) + dbinom(5,5,0.5)  #7

#Question 1b: Find the probability of getting at least four heads out of 5 tosses using the rbinom() function.

#Steps :
#  1)Use rbinom() to generate a simulation of 10,000 varieties and store the results in variable x.
#  2)Use the mean() function to estimate at least four heads.

# Q1b
x <- rbinom(10000,5,0.5)
mean(x >= 4)
dbinom(4,5,.5) + dbinom(5,5,.5)
1-pbinom(3,5,.5) 

#Question 2: What is the probability of having 2 successes for a random variable X with a distribution of Binomial(6, 1/3).

#   .Binomial(n,p) corresponds to a binomial distribution with n independent Bernoulli trials where probabilityof success is p.
#   .Investigate the dbinom() function and check all the possible arguments using R's help function.
#   .Investigate the function choose() try to calculate the same probability using the choose function.

# Q2
dbinom(2,6,1/3)
choose(6,2)*(1/3)^2*(2/3)^4

#Question 3: Compute the whole sample space for a random variable X with a distribution of Binomial(9, 3/4).
#   .Investigate the dbinom() function and check all the possible arguments using R's help function.

# Q3
dbinom(0:9,9,3/4)

#Question 4: For a disease known to have a complication frequency of 20%, a surgeon suggests a new procedure. 
#He tests it on 10 patients and there are no complications. 
#What is the probability of operating on 10 patients successfully with the traditional method?

# Q4
dbinom(0, size=10, prob=.2)

#Question 5: Suppose there are twelve multiple choice questions in an English class quiz. Each question has five possible answers, 
#and only one of them is correct. Find the probability of having four or less correct answers if a student attempts to answer every question at random.
#   .Investigate the pbinom() function and check all the possible arguments.

# Q5
pbinom(4, size=12, prob=0.2)
#____________________________________________________________________________________________________________________

# Exercise 2
#Question 1: If there are twelve cars crossing a bridge per minute on average, find the probability of having
#seventeen or more cars crossing the bridge in a particular minute.

#Steps :
#1) Investigate the ppois() distribution function using R's help function.
#2) From the question decide the right values to be set for x and lambda and the lower.tail
#3) Calculate the probability of having sixteen or less cars crossing the bridge in a particular minute.

# Poisson
# Q1
# The probability of having sixteen or less cars crossing the bridge in a 
# particular minute is given by the function ppois. 
ppois(16, lambda=12)   # lower tail 

# Hence the probability of having seventeen or more cars crossing the bridge
# in a minute is in the upper tail of the probability density function. 
ppois(16, lambda=12, lower=FALSE)   # upper tail 
# The probability of having seventeen or more cars crossing the bridge for 
# any given minute is 10.1%
#____________________________________________________________________________________________________________________

# Exercise 3
# Hypergeometric
#Exercise 3: The Hypergeometric distribution in R
#We are working at a forest conservation agency and our task is to tag a population of endangered deer to prevent
#illegal hunting. We know that the forest has approximately 400 deer. Last week, we have captured 100 of the deer
#and tagged, and released them into the wild. This week we have captured 125 deer. What is the probability that
#we have captured 30 deer that were captured last week. (Assume that the recaptured deer are equally likely to be
#caught and they do not learn to avoid humans)
# . You can either use the formula from videos or dhyper() function (takes 4 values)

choose(100,30) * choose(300,95)/choose(400,125)
# We have 100 successes, we want to get 30 of those "successes". 
# We have 95 failures, we want to get those from rest of the population. 
# We then divide by the total of different choices we can have 
dhyper(30, 100, 300, 125)
