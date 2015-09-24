data<- read.csv("grant_sched.csv", header=TRUE, sep=",")

fit<- lm(dependent.var~ predictor1+predictor2... data=data)

summary(fit) #observe the regression results

confint(fit) #95% confident that the resulting intervals contain the true change in dependent variable per change in predictor variable

#evaluate the Ordinal Least Squares assumptions to verify model accuracy
plot(fit)

#evaluate each of the 4 resulting graphs for:

# Independence dependend and independent variables should be logically independent
# If the dependent variable has linear relationship with dependent, there should be no residual structure in residuals (plot #1)
# Normal distribution (plot #2)
# Homoschedasticity; dependent variables should all be consistently and normally distributed (plot #3 consistent width;no cone shape)
# Individual observations are identified as outliers in plot 4, residuals vs leverage.  May wish to research or understand these.

#drop individual observations
fit2<- lm(dependent.var~ predictor1+predictor2... data=data[-c(9,10),])
#OR create a dummy variable to describe the outliers, and add that variable as a predictor variable!