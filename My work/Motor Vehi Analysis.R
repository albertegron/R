#  Part (I)

#You are out in the market to buy a new car and you have found a list of all of 
#the cars in the market. First you want to get a feeling of the data. So you decide to 
#look at the outputs of the summary function. When you run the data, you see that the 
#horse power column is classified as character.

cars <- as.data.frame(read.table("C:/CIND123/lab5/dataset.txt", stringsAsFactors = F))
names(cars) <- c('mpg', 'cyl', 'displacement', 'hp', 'weight', 'acc', 'year', 'origin', 'name')

#   ??? Use the as.numeric() function to correct this column.

summary(cars)
cars$hp <- as.numeric(cars$hp)

#Now that all columns are numeric, you want to plot graphs to start your exploratory 
#analysis.
#   ??? Create a scatter plot using car weights in the x axis and acceleration in the y axis.

plot(cars$weight, cars$acc)

#After your initial findings, you want to tackle your main issue; What car should you buy? You do not 
#want to spend too much time for this pursuit. So, you have decided to introduce a rule based approach 
#to narrow down the list to two cars. These rules are:
#   ??? Pick the cars that have the median acceleration and find the lightest (in terms of weight) one.

p1 <- which(cars$acc == median(cars$acc))
p1.5 <- which.min(cars$weight[p1])
cars$name[p1][p1.5]

#   ??? Pick the car whose weight is closest to the mean.

cars$wdiff <- cars$weight - mean(cars$weight)
p2 <- which.min(abs(cars$wdiff))
cars$name[p2]


#part (II)

#Write an R function that reads a set of numbers as student marks and determines the 
#correspondent grades.

#There are several ways to write this function.  This is one of them

GraderFun <- function(marks)
{
  for (i in 1:length(marks)) { 
    if(marks[i] <= 60) {print("Grade = F")}
    else if (marks[i] <= 70) {print("Grade = D")}
    else if (marks[i] <= 80) {print("Grade = C")}
    else if (marks[i] <= 90) {print("Grade = B")}
    else if (marks[i] > 90) {print("Grade = A")}
  }
}

#Example on how to use the GraderFun function
GraderFun(c(20, 50, 45, 89, 90, 100))
