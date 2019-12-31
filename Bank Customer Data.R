#You are currently working in a bank and you have been asked to analyze customer
#data. You want to load the provided data in R and answer some basic questions.
  
#1) Import the data using read.csv() function. The raw data does not have any
#headers, so you have to set the headers option to False to store the data without any
#headers. Furthermore, you want the load the whole data as a string, so you have to
#set the stringsAsFactors option to False.

#Finally, the data has empty observations for some of the columns so you have to set
#the na.strings option to c("","NA") in order to fill the empty cells with NAs.

data <- read.csv("C:/SelfLearn/Stats/set1.csv", na.strings = c("","NA"), 
                 stringsAsFactors = F, header = F)
df <- data.frame(data)

#2) Give proper names to each column using the names() function. Going forward, the
#exercise will use the following names: ID, Fname, Lname, Email, Gender, Country,
#Amount, Date.

names(df) <- c('ID','Fname', 'Lname', 'Email', 'Gender', 'Country', 'Amount', 'Date')

#3) Use the summary function to see more information about each column.
#Find out how many different countries are there in the data set by using the unique function.

summary(df)

# How many different countries are out there?
unique(df$Country)

#4) Count the number of Males, Females and NAs under the Gender column.
# counting the number of Females, Males and NA (2 versions are provided)
length(which(df$Gender == 'Female'))
sum(df$Gender == 'Female', na.rm = T)

length(which(df$Gender == 'Male'))
sum(df$Gender == 'Male', na.rm = T)

length(which(is.na(df$Gender)))
sum(is.na(df$Gender))

#Clean the data by:
#    Removing clients who have NA as their country.
#    Converting the column with dollar values to numeric values.
#    Converting the Date column to data type date.

# . Identify the earliest date in the data set and calculate the number of days
# passed for each observation. Insert these values as a new column to the data
# frame.
# . Create an additional column, populate the column with an numeric indicator
# where people with "gov" and "org" get 1 and the rest get 0.
# . (Optional) After going over the data you have decided to check, if the
# calculated number of days and the mail indicator can be used to explain the amount column.

# Cleaning 
df <- df[!is.na(df$Country),]
df$Amount <- as.numeric(gsub("[$,]","", df$Amount))
df$Date <- as.Date(df$Date, "%m/%d/%Y")

# Create new data
df$days <- as.numeric(df$Date - min(df$Date))

# Identify people of interest
df$IndEmail <- 0 
df$IndEmail[grep("gov", df$Email)] <- 1
df$IndEmail[grep("org", df$Email)] <- 1

# Optional part
lma <- lm(df$Amount ~ df$days + df$IndEmail)
summary(lma)
