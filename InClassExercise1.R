library(tidyverse)

bank <- read.csv("bank.csv", stringsAsFactors=FALSE)

fullBalanceModel <- lm(
  balance ~ .,
  data=bank
)
summary(fullBalanceModel)

intuitiveBalanceModel <- lm(
  balance ~ age + default + marital,
  data=bank
)
summary(intuitiveBalanceModel)

anova(intuitiveBalanceModel, fullBalanceModel)
# This ANOVA test yields an F value of 5.9, thus there are more factors that meaningfully 
# contribute to predicting balance

intuitiveBalanceModel2 <- lm(
  balance ~ age + default + marital + job + education,
  data=bank
)
summary(intuitiveBalanceModel2)

anova(intuitiveBalanceModel2, fullBalanceModel)
# This ANOVA test yields an F value of 7.4, thus we got farther from accurately 
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
# This ANOVA test yields an F value of 1.1, thus we find that this model a good 
# predictor of balance after removing meaningless variables