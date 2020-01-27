library(tidyverse)

bank <- read.csv("bank.csv", stringsAsFactors=FALSE)

fullBalanceModel <- lm(
  balance ~ age + job + marital + education + default + housing + loan + contact + day + month + duration + campaign + previous,
  data=bank
)
summary(fullBalanceModel)

intuitiveBalanceModel <- lm(
  balance ~ age + default + marital,
  data=bank
)
summary(intuitiveBalanceModel)

anova(intuitiveBalanceModel, fullBalanceModel)
# This ANOVA test yields an F value of 6.1, thus there are more factors that meaningfully 
# contribute to predicting balance

intuitiveBalanceModel2 <- lm(
  balance ~ age + default + marital + job + education,
  data=bank
)
summary(intuitiveBalanceModel2)

anova(intuitiveBalanceModel2, fullBalanceModel)
# This ANOVA test yields an F value of 7.8, thus we got farther from accurately 
# predicting balance by adding job and education, so at least one of these factors 
# is irrelevant in predicting balance

# looking at the t value column of the summary of fullBalanceModel, I chose all 
# categories with a t value > 2
intuitiveBalanceModel3 <- lm(
  balance ~ age + default + marital + job + loan + month,
  data=bank
)
summary(intuitiveBalanceModel3)

anova(intuitiveBalanceModel3, fullBalanceModel)
# This ANOVA test yields an F value of 1.2, thus we find that this model is a good 
# predictor of balance after removing meaningless variables

goodPredictor <- intuitiveBalanceModel3

# The resulting final model demonstrates that the age of the customer, whether the 
# customer has any credit in default, the marital status of the customer, what job 
# the customer holds, whether the customer holds a loan or not, and what month the 
# customer joined the bank in, all hold meaningful correlations when attempting to 
# predict the balance a customer has in an account with the bank. Which further leads
# to a model which can also be useful in predicting any of the aforementioned variables, 
# as correlations work in both directions. 