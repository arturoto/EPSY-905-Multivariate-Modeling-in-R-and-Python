library(EPSY905R)

#LOAD INTERNAL R DATA SET
data("dataSexHeightWeight")

#ASSIGN A DIFFERENT NAME FOR THE DATA SET TO MAKE CHANGES
data01 = dataSexHeightWeight

#CREATE NEW VARIABLE WHERE FEMALE=1 (DUMMY CODED)
data01$female[data01$sex=="F"]=1
data01$female[data01$sex=="M"]=0

#SCATTER PLOT MATRIX:
pairs(~female+heightIN+weightLB,data=data01)

#HISTOGRAM OF DATA FOR EACH QUANTITATIVE VARIABLE:
par(mfrow=c(1,2)) #SET PLOT TO SHOW TWO PICTURES IN ONE ROW
hist(data01$weightLB,main="Weight",xlab="Pounds")
hist(data01$heightIN,main="Height",xlab="Inches")
par(mfrow=c(1,1)) #SET PLOT TO SHOW ONE PICTURE

#DESCRIPTIVE STATISTICS
summary(data01$heightIN)
summary(data01$weightLB)
summary(data01$female)

#COVARIANCE MATRIX (USING N-1)
var(cbind(data01$heightIN,data01$weightLB,data01$female))

#CORRELATION MATRIX (USING N-1 IN THE COVARIANCE)
correlationmatix = cor(cbind(data01$heightIN,data01$weightLB,data01$female))
correlationmatix
