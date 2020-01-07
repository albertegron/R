#Let's take a look at the error
bwt.df <- data.frame(Bwt= cats$Bwt)
predict.bwt <- data.frame(predict = predict(model,bwt.df))
predicted.cat <- cbind(cats,predict.bwt)
error.df <- data.frame(error=(predicted.cat$Hwt-predicted.cat$predict))
predicted.cat <- cbind(predicted.cat, error.df)
summary(predicted.cat$error)
summary(model)
boxplot(predicted.cat$error)
error.pdf <- data.frame(percent_error=(100*abs(predicted.cat$error)/predicted.cat$Hwt))
predicted.cat <- cbind(predicted.cat, error.pdf)

boxplot(predicted.cat$percent_error)
hist(predicted.cat$percent_error)

rmse <- function(error)
{
  sqrt(mean(error^2))
}
rmse(predicted.cat$error)

mae <- function(error)
{
  mean(abs(error))
}

mae(predicted.cat$error)

rmse2 <- function(error)
{
  sqrt(mean(error^2))
}