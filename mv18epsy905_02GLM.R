library(EPSY905R)

#LOAD INTERNAL R DATA SET
data("dataSexHeightWeight")

#ASSIGN A DIFFERENT NAME FOR THE DATA SET TO MAKE CHANGES
data01 = dataSexHeightWeight

#CREATE NEW VARIABLE WHERE FEMALE=1 (DUMMY CODED)
data01$female[data01$sex=="F"]=1
data01$female[data01$sex=="M"]=0

#Model #1: Empty model
model01 = lm(weightLB~1,data=data01)
summary(model01)
anova(model01)

#Model #2: Adding Height
model02 = lm(weightLB~heightIN,data=data01)
summary(model02)
anova(model02)

#model comparison with model #1:
anova(model01,model02)

#center height at mean height
data01$heightIN_MC = data01$heightIN - mean(data01$heightIN)

#model #2a: Adding mean-centered height
model02a = lm(weightLB~heightIN_MC,data=data01)
summary(model02a)
anova(model02a)

#model comparison with model #1:
anova(model01,model02a)

#model comparison with model #2:
anova(model02,model02a)


#model #3: adding female to empty model:
model03 = lm(weightLB~female,data=data01)

summary(model03)
anova(model03)

#model comparison with model #1:
anova(model01,model03)

#model #4: adding both MCheight and female to empty model
model04 = lm(weightLB~heightIN_MC+female,data=data01)

summary(model04)
anova(model04)

#model comparison with model #2:
anova(model02a,model04)

#model comparison with model #3:
anova(model03,model04)

#model comparison with model #1:
anova(model01,model04)

#model #5: adding interaction to model #4:
model05 = lm(weightLB~heightIN_MC+female+female*heightIN_MC,data=data01)

summary(model05)
anova(model05)

anova(model04,model05)

