######Functions for Advanced Data Handling in R######

#In this section, we will discuss some functions in R which are frequently used for advanced data handling. 
#The commands that we will be using at this section ca be very helpful for practical analysis as well as data cleaning.

library("ISwR")
attach(thuesen)

## 1. -> The CUT function
#The "cut" function divides the range of parameter into intervals and codes the values in that parameter according to which interval they fall.

#Let's create a factor in which the "blood.glucose" variable in the "thuesen" data set will be divided into four intervals: 
                                                          #(4, 7], (7, 9], (9, 12], and (12, 20]. 

#The related code will be:

int <- cut(blood.glucose, c(4, 7, 9, 12, 20))
levels(int) <- c("low", "intermediate", "high", "very high")

## 2. -> The SUB function
#The SUB function replaces the first match of a string, if the parameter is a string vector, replaces the first match of 
#all elements. 

#Let's use the SUB and replace the "Data Analytics: Basic Methods" to "Data Analytics: Advanced Methods"

x <- "Data Analytics: Basic Methods"
y <- sub("Basic", "Advanced", x)
y

## 3. -> The GSUB function
#The GSUB function replaces all matches of a string, if the parameter is a string vector, returns a string vector of the 
#same length and with the same attributes. Elements of string vectors which are not substituted will be returned unchanged.

x <- c("MATH 750: Fall Term", "MATH 819: Fall Term")
gsub("Fall", "Winter", x)
x 

## 4. -> The SPLIT function:
# The SPLIT function divides the data in the vector x into the groups defined by f. The replacement forms replace values 
#corresponding to such a division. The UNSPLIT function reverses the effect of SPLIT. 

#Let's split the "energy" data set by the "statue" column.

split(energy, energy$stature)
split(energy$expend, energy$stature)

## 5. -> The MERGE function
# The MERGE function will merge two data frames by common columns or row names.

#Let's create two data frames with one common column indicating "ID".

data.frame.Z <- data.frame(ID = 1:4, Gender = c("F", "F", "M", "M"), Age = c
                           (30, 24, 26, 18))
data.frame.Y <- data.frame(ID = 1:4, Weight = c(60, 54, 70, 76), 
                           Height = c(160, 170, 172, 186))
total <- merge(data.frame.Z, data.frame.Y, by = "ID")
total
