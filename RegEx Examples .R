#https://www.w3schools.com/jsref/jsref_obj_regexp.asp

## Regular Expressions Examples (RegEx)##

######################################################
######################################################


txt <- c("arm","foot","lefroo", "bafoobarfoo")
grep("foo", txt) #  2 4
grepl("foo", txt) # FALSE  TRUE FALSE  TRUE


# 1. Substitution
sub(pattern = 'foo', replacement = 'oof' , txt)


# 2. Global Substitution
gsub(pattern = 'foo', replacement = 'oof', txt)


# The dot/period/. wild card/operator/ (matches any character)
# 3. SELECT Only the string containing a .
txt <- c('cat', '896', '3b896', 'abc1')
grep(pattern = '.', txt) # 1 2 3 4
grep(pattern = '\\.', txt) # nothing matches: default behavior of the . is disabled by \\


# Square brackets and matching specific characters
# 4. Select only first three
txt <- c('can', 'man', 'fan', 'dan', 'ran', 'pan')
grep(pattern = '[cmf]an', txt)


# 5. Excluding characters
grep(pattern = '[^drp]an', txt)


# Characeter ranges -
# 6. Select ones starting with capital letter
txt <- c('Ana', 'Bob', 'Cpc', 'aax', 'bby', 'ccz')
grepl(pattern = '[A-Z].', txt)
grepl(pattern = '[^a-z].', txt)


# 7. matching digits
txt <- c('123', '323', '332', 'dan', 'ran', 'pan')
grepl(pattern = '\\d', txt)


# 8. matching digits. The proceeding character/expression must occur m time exp{m}
txt <- c('123', '323', '332', 'ddn', 'r22', 'p222')
grepl(pattern = '\\d{1}', txt)


# 9. The use of fixed argument
txt <- "log(M)"
gsub("log", "", txt) 
gsub("log(", "", txt)
gsub("log(", "", txt, fixed = T)

######################################################
######################################################