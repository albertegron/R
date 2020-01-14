# Objective:  To explore and mine the following semi-structured data sets:
#             
# https://github.com/ansymo/msr2013-bug_dataset/tree/master/data/v02
#
#-------------------------------------------------------------------------------

#------------------------------------
# PART A - Load the data
#------------------------------------

# load the curl package for supporting connection interface
library(curl)

# load the jsonlite package for parsing JSON files with R
library(jsonlite)

# read the Mozilla Project bug status file (may take a few minutes)
url <- 'https://raw.githubusercontent.com/ansymo/msr2013-bug_dataset/master/data/v02/mozilla/bug_status.json'
mBugStatus <- fromJSON (txt = url)

# read the Eclipse Project bug status file (may take a few minutes)
url <- 'https://raw.githubusercontent.com/ansymo/msr2013-bug_dataset/master/data/v02/eclipse/bug_status.json'
eBugStatus <- fromJSON (txt = url)

m <- mBugStatus[["bug_status"]]
e <- eBugStatus[["bug_status"]]


#-------------------------------------
# PART B - explore one of the tickets
#-------------------------------------

# set the current bug list to be the list of tickets from the Eclipse project
buglist <- e

# examine ticket number 3650
df <- buglist[["3650"]]
df

#------------------------------------
# PART C - summarize the data
#------------------------------------

# find the total number of tickets in a buglist
length(buglist)

# tabulate the number of operations performed in a buglist
table(unlist(sapply (buglist, function (x) x$what)))

# find the total number of operations performed across all tickets in a buglist
length(unlist(sapply (buglist, function (x) x$what)))

# find the number of unique users performing operations in a buglist
length(unique(unlist(sapply (buglist, function (x) x$who))))

# draw a histogram of when new tickets in a buglist were created by year
v <- unlist(sapply (buglist, function (x) x$when[x$what == "NEW"]))
hist(as.POSIXct(v, origin = "1970-01-01"), breaks = "years")

# find the number of times tickets were re-opened
length(unlist(sapply (buglist, function (x) x$when[x$what == "REOPENED"])))

# draw histogram of ticket time to resolution for tickets resolved once only
v <- unlist(sapply (buglist, function (x) if (length(which(x$what == "RESOLVED")) == 1) {x$when[x$what == "RESOLVED"] - x$when[x$what == "NEW"]}))
hist(v / (3600 * 24 * 7), main="Histogram of Weeks to Resolution", breaks = 800, xlim = c(0,20), xlab="Weeks to Resolution")



