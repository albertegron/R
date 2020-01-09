#Note:
#  . Correlation coefficient can be computed using the functions cor() or cor.test():
#  cor() computes the correlation coefficient
#  cor.test() test for association/correlation between paired samples. It returns both the correlation coefficient and the 
#  significance level (or p-value) of the correlation

# The difference between correlation and covariance is: Covariance, indicates the 
# direction of the linear relationship between variables. Higher the covariance means 
# higher the slope. 
###########################################################################################################################
#Correlation, 

## Question 1: 
#Load the data set height_selfesteem.csv
#a. Identify the variables and find the correlation between height and self-esteem. What kind of 
#   relationship do these variables have?
#b. Based on the strength of the correlation, can we conclude there is a causal relationship between the 
#   two variables? Why or why not?
#c. Find the covariance of these variables. What is the relationship between covariance and correlation? 
#   How do they differ?

## Answer 1:
loc<-getwd()
self <- read.csv(paste(loc,"height_selfesteem.csv", sep="/"))

cor(self$Height, self$Self.Esteem) 
#cor 0.7306357 means it is a strong positive correlation.
#(between 0 - 0.3 it's a weak correlation, 0.3 - 0.7 correlation is moderate, and everything greater than 
# 0.7 it is strong correlation. Same for the negative values)

cov(self$Height, self$Self.Esteem) 
#The value is positive (1.371579) which means the datat fits.
#*************************************************************************************************************************

## Question 2:
#Load the dataset mtcars
#a. Test the correlation between mpg and weight variables.
#     i. What is the default method for cor.test()?
#     ii. How you will interpret the output of this test?

#b. Test the correlation between number of cylinders (cyl) and horsepower (hp). Is it a significant relationship?

#c. Test the correlation between number of carburetors (carb) and gear (gear). Is it a significant relationship?

#d. Create a scatterplot matrix consisting of variables horsepower, cylinder and displacement. Do you see any patterns?

#e. Run and interpret the following code: 
install.packages("lazyeval") 
install.packages("viridis") 
install.packages("corrgram") 
library(corrgram) corrgram(mtcars, order=TRUE, lower.panel=panel.shade, upper.panel=panel.pie, 
                           text.panel=panel.txt, main="Car Milage Data in PC2/PC1 Order")

## Answer 2:
attach(mtcars)

#a
cor.test(wt, mpg, method = "pearson") # or cor.test(wt, mpg, method = "pearson")
#i)The default method is pearson


#ii) Interpretation of the result
#t is the t-test statistic value (t = -9.559),
#df is the degrees of freedom (df= 30),
#p-value is the significance level of the t-test (p-value = 1.29410^{-10}), The smaller the p value is the more significant results are.
#conf.int is the confidence interval of the correlation coefficient at 95% (conf.int = [-0.9338, -0.7441]);
#sample estimates is the correlation coefficient (Cor.coeff = -0.87).
#The p-value of the test is 1.29410^{-10}, 
#which is less than the significance level alpha = 0.05. 
#We can conclude that wt and mpg are significantly correlated with a correlation 
#coefficient of -0.87 and p-value of 1.29410^{-10} .

#b
cor.test(cyl, hp) 
#based on the results, p value is highly significant which also means the correlation value going to be accordingly significant as well.

#c
cor.test(carb, gear) 
#based on the results, p value is high and notsignificant which also means the correlation value is weak as well (0.2740728).

#d
myvar <- c("disp", "hp", "cyl")
pairs(mtcars[myvar])

#e
install.packages("lazyeval")
install.packages("viridis")
install.packages("corrgram")
library(corrgram)
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
          upper.panel=panel.pie, text.panel=panel.txt,
         main="Car Milage Data in PC2/PC1 Order")
#*************************************************************************************************************************

## Question 3:
#We have a small dataset of Tourists in Toronto from different countries that includes the gender, number of children 
#and how much they spent in CAD during the visit. We are interested to find out if tourists with greater numbers of 
#children spend more based on this data?

#a. Load the data set toursit.csv
#b. Calculate the correlation between CHILDREN and SPEND and analyze the result
#c. Turn CHILDREN into a factor, using as.factor() to see how many levels it has.
#d. As you can see, CHILDREN is a discrete variable without many values, so a Spearman correlation can be a better option. 
#Run correlation test between CHILDREN and SPEND based on Spearman method. How do you interpret this result?
  
## Answer 3:

#a
tourist <- read.csv(paste(loc,"tourist.csv", sep="/"))
attach(tourist)
cor(CHILDREN, SPEND, method ="spearman")
# Spearman method is finding correlation coefficients like:  rankes, factors, ordinal values. 

#b
cor.test(CHILDREN, SPEND) 
#cor = -0.2612796, weak correlation, and it is negative.
#This means tourists with a greater number of children tend to spend less!

#c
levels(as.factor(CHILDREN))

#d
cor.test(CHILDREN, SPEND, method ="spearman")

# cor = -0.3116905
#We have obtained a similar but slightly different correlation coefficient estimate 
#because the Spearman correlation is indeed calculated differently than the Pearson.

