bankData <- read.csv("bank.csv")

numDivorced <- length(which(bankData$marital == "divorced"))
numMarried <- length(which(bankData$marital == "married"))
numSingle <- length(which(bankData$marital == "single"))

numDivorcedDefault <- length(bankData[bankData$marital=="divorced" & bankData$default=="yes", ]$default)
numMarriedDefault <- length(bankData[bankData$marital=="married" & bankData$default=="yes", ]$default)
numSingleDefault <- length(bankData[bankData$marital=="single" & bankData$default=="yes", ]$default)

totalNumCustomers <- c(numDivorced, numMarried, numSingle)
totalNumCustomersDefaulted <- c(numDivorcedDefault, numMarriedDefault, numSingleDefault)
percentageDefaulted <- c(
  ((numDivorcedDefault  /numDivorced) * 100), 
  ((numMarriedDefault / numMarried) * 100), 
  ((numSingleDefault / numSingle) * 100)
)

frame <- as.data.frame(totalNumCustomers, c("Divorced", "Married", "Single"))
frame$totalNumCustomersDefaulted <- totalNumCustomersDefaulted
frame$percentageDefaulted <- percentageDefaulted

frame

numNeither <- length(bankData[bankData$housing!="yes" & bankData$loan!="yes", ]$housing)
numJustMortgage <- length(bankData[bankData$housing=="yes" & bankData$loan!="yes", ]$housing)
numJustLoan <- length(bankData[bankData$housing!="yes" & bankData$loan=="yes", ]$housing)
numBoth <- length(bankData[bankData$housing=="yes" & bankData$loan=="yes", ]$housing)
totalWithMortgageOrLoan <- numJustMortgage + numJustLoan + numBoth
total <- totalWithMortgageOrLoan + numNeither

dataFrame <- as.data.frame(numNeither, "Number")
dataFrame$a <- numJustMortgage
dataFrame$b <- numJustLoan
dataFrame$c <- numBoth

names(dataFrame) <- c("Neither a Mortgage nor a Loan", "Only a Mortgage", "Only a Loan", "Both a Mortgage and a Loan")
dataFrame <- rbind(
  dataFrame,
  c(
    ((numNeither / total) * 100),
    ((numJustMortgage / total) * 100), 
    ((numJustLoan / total) * 100),
    ((numBoth / total) * 100)
  )
)
row.names(dataFrame) <- c("Number", "Percentage")
dataFrame <- t(dataFrame)

dataFrame
