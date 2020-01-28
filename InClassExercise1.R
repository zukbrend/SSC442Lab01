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
# This ANOVA test yields an F value of 6.1 and a p value of 2.2e-16, thus all of 
# the intuitive variables we picked well predict balance. 

updatedIntuitiveBalanceModel <- lm(
  balance ~ age + default + marital + job + education,
  data=bank
)
summary(updatedIntuitiveBalanceModel)

anova(updatedIntuitiveBalanceModel, fullBalanceModel)
# This ANOVA test yields an F value of 7.8, which tells us that this model better 
# predicts balance than the first intuitive model we created. This ANOVA test also 
# yields a p value of 2.2e-16, thus the additional variables of job and education 
# that were added to this model both help better predict balance.

# looking at the t value column of the summary of fullBalanceModel, I chose all 
# categories with a t value > 2
statisticallyImportantModel <- lm(
  balance ~ age + default + marital + loan,
  data=bank
)
summary(statisticallyImportantModel)

anova(statisticallyImportantModel, fullBalanceModel)
# This ANOVA test yields an F value of 5.7 and a p value of 2.2e-16, thus we find that 
# this model is once again, a good predictor, but not as good of a predictor. 


goodPredictor <- updatedIntuitiveBalanceModel

# The resulting final model demonstrates that the age of the customer, whether the 
# customer has any credit in default, the marital status of the customer, what job 
# the customer holds, and the education level of the customer, all hold meaningful 
# correlations when attempting to predict the balance a customer has in an account 
# with the bank. Which further leads to a model which can also be useful in predicting 
# any of the aforementioned variables, as correlations work in both directions. 