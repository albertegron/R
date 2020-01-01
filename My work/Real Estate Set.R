# You have just begun an illustrious career in the real estate sector. You're given a
#large dataset containing every non-commercial property for sale in the city of
#Windsor for the past 6 months. It is your job to create functions to help interpret
#and make use of this data.

# 1) Create a function that calculates the average of a set (without using R's mean function). 
# It should take a set of numbers as an input, and return the average.

#meanfunction#
average <- function(x)
{
  return(sum(x)/length(x))
}

# 2) Create a function that calculates Z scores. It should take in a single value, and a set of numbers as arguments, 
#and returns the Z-score.

#zscorefunction#
zscore <- function(x,y)
{
  return((x - average(y))/sd(y))
}

#---------------------------------------------
# Download mls_13 to your R workspace. There are no missing values in this data set, and every element is numeric.
# Loading Housing.csv file
house <- read.csv("mls_13.csv", sep=",")
str(house)

#1) Clients frequently approach you with the maximum price they're willing to spend
#on a house. With this maximum price, create a function that return a vector with 2
#elements; i) the number of houses available at/below this price, and ii) the portion
#of houses on the market that are at/below this price.

quant <- function(cost)
{
  port <- 0
  port[1] = sum(house$price <= cost)
  port[2] = port[1]/length(house$price)
  return(port)
}
summary(house$price)
#Example
quant(49120)

#2) Create a function that takes in a numeric set and plots it in a histogram, and
#returns 1 if the set is skewed right, and -1 if it is skewed left. Use this function to
#plot and determine the skewness of the prices.

skewness <- function(x)
{
  hist(x)
  return(sign(average(x) - median(x)))
}

#3) Create a function that has price as an input, and returns the z-score of
#the average number of bath-pieces (denoted 'bathp' in the data set) for houses less
#than or equal to the inputted price. Also make it display a summary for the number
#of bath-pieces for houses at or below the inputted price.

bath <- function(price)
{
  print(summary(house$bathp[house$price<=price]))
  return(zscore(average(house$bathp[house$price<=price]),house$bathp))
}
#Example
bath(49120)

#4) Create a function that takes an upper price and a lower price as an argument,
#creates a subset of houses that falls into that interval, and returns the head of that subset.

test <- function(upper,lower)
{
  sub <- 0
  sub <-house[which(house$price  >= lower & house$price <= upper),]
  return(head(sub))
}
#What is the difference between using && and &?
#Example
test(49120,25000)

#5) Finally, clients are very interested in bath-pieces. Create a function that has an input as the 
#number of bath-pieces, and returns a subset of the cheapest house(s) that have that number of bath-pieces.

bathpiece <- function(pieces)
{
  bath <- 0
  bath <-house[which(house$bathp == pieces),]
  bath = bath[bath$price == min(bath$price),]
  return(bath)
}
#Example
bathpiece(3)

