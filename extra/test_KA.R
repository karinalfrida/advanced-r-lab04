# KA test lines

data(iris)

### linreg
linreg_testobj <- linreg(formula =Petal.Length~Species, data = iris)

print.linreg(linreg_testobj)
resid.linreg(linreg_testobj)
pred.linreg(linreg_testobj)
coef(linreg_testobj)

### lm
lm_testobj <- lm(Petal.Length~Species, data = iris)

print(lm_testobj)
resid(lm_testobj)
predict.lm(lm_testobj)
coef(lm_testobj)


resid_compare <-
  cbind(resid(lm_testobj), resid.linreg(linreg_testobj), resid(lm_testobj)-resid.linreg(linreg_testobj))
max(resid_compare[,3])


predict_compare <-
  cbind(predict(lm_testobj), pred.linreg(linreg_testobj), predict(lm_testobj)-pred.linreg(linreg_testobj))
max(predict_compare[,3])


coef_compare <-
  rbind(coef(lm_testobj), coef.linreg(linreg_testobj), coef(lm_testobj)-coef.linreg(linreg_testobj))
max(coef_compare[3,])
