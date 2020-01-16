numDivorced <- length(which(bankData$marital == "divorced"))
numMarried <- length(which(bankData$marital == "married"))
numSingle <- length(which(bankData$marital == "single"))

numDivorcedDefault <- length(bankData[bankData$marital=="divorced" & bankData$default=="yes", ]$default)
numMarriedDefault <- length(bankData[bankData$marital=="married" & bankData$default=="yes", ]$default)
numSingleDefault <- length(bankData[bankData$marital=="single" & bankData$default=="yes", ]$default)

totalNumCustomers <- c(numDivorced, numMarried, numSingle)
totalNumCustomersDefaulted <- c(numDivorcedDefault, numMarriedDefault, numSingleDefault)
percentageDefaulted <- c(numDivorcedDefault/numDivorced, numMarriedDefault/numMarried, numSingleDefault/numSingle)

frame <- as.data.frame(totalNumCustomers, c("Divorced", "Married", "Single"))
frame$totalNumCustomersDefaulted <- totalNumCustomersDefaulted
frame$percentageDefaulted <- percentageDefaulted

frame