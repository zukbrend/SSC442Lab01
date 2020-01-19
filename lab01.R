# Load required libraries
library(tidyverse)

########################### BEGIN EXERCISE 1 ###################################
# Save data in a data frame
mpgData <- ggplot2::mpg

DisplVHwy <- ggplot(
  data=mpgData,
  mapping=aes(
    x=displ,
    y=hwy
  )
) + 
  geom_point() +
  xlab("Engine Size (Liters)") + 
  ylab("Highway Fuel Efficiency (mpg)") + 
  ggtitle("Engine Size Vs. Highway Fuel Efficiency")

DisplVHwy

# Yes, this scatter plot of Engine Size vs. Highway Fuel Efficiency shows the intuitive 
# relationship that as engine size (disp) increases, highway fuel efficiency will decrease

ClassVDrv <- ggplot(
  data=mpgData,
  mapping=aes(
    x=class,
    y=drv
  )
) + 
  geom_point() + 
  xlab("Vehicle Class") + 
  ylab("Vehicle Drive Type") +
  ggtitle("Vehicle Class vs. Drive Type")

ClassVDrv

# scatter2 is not a useful plot because there is no related relationship between
# the two variables. The class generally dictates what drv the vehicle can have,
# and there are far too few data points to make any reasonable conclusions
################################################################################

########################### BEGIN EXERCISE 1b ##################################

DisplVHwyColor <- ggplot(
  data=mpgData,
  mapping=aes(
    x=displ,
    y=hwy,
    color=class
  )
) + 
  geom_point() +
  xlab("Engine Size (Liters)") + 
  ylab("Highway Fuel Efficiency (mpg)") + 
  ggtitle("Engine Size Vs. Highway Fuel Efficiency, Colored by Vehicle Class")

DisplVHwyColor

# Given the scatter plot generated with color coded dots according to the type
# of vehicle, it appears that 2-seat vehicles are outlyers in the sense that they
# achieve better highway fuel efficiency than other types of vehicles with the
# same size engine
################################################################################

########################### BEGIN EXERCISE 2 ###################################

# Save the bank data as a data frame
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

MaritalStatusDefaultAnalysis <- as.data.frame(totalNumCustomers, c("Divorced", "Married", "Single"))
MaritalStatusDefaultAnalysis$totalNumCustomersDefaulted <- totalNumCustomersDefaulted
MaritalStatusDefaultAnalysis$percentageDefaulted <- percentageDefaulted

MaritalStatusDefaultAnalysis

MaritalDefaultPlot <- ggplot(
  data=bankData,
  mapping=aes(
    x=marital,
    fill=default,
    color=education
  )
) +
  geom_bar(position="dodge") +
  xlab("Marital Status") + 
  ylab("Number of Customers") + 
  scale_fill_manual(
    values=c("black", "red")
  ) + 
  scale_color_manual(
    values=c("red", "yellow", "green", "blue")
  ) + 
  ggtitle("Marital Status and Default Rates with Education Levels") +
  theme(plot.title=element_text(hjust=0.5))

MaritalDefaultPlot

# MaritalStatusDefaultAnalysis shows that divorced individuals have a default rate three times larger than
# any other marital status, so now we just need a visualization of this, and see if this
# default rate among divorced individuals is attached to any other variable (maybe job or education?)
# UPDATE: graphed with education and education doesnt seem to have any effect on default rate
#         and there is no "high risk" group education-wise

numNeither <- length(bankData[bankData$housing!="yes" & bankData$loan!="yes", ]$housing)
numJustMortgage <- length(bankData[bankData$housing=="yes" & bankData$loan!="yes", ]$housing)
numJustLoan <- length(bankData[bankData$housing!="yes" & bankData$loan=="yes", ]$housing)
numBoth <- length(bankData[bankData$housing=="yes" & bankData$loan=="yes", ]$housing)
totalWithMortgageOrLoan <- numJustMortgage + numJustLoan + numBoth
total <- totalWithMortgageOrLoan + numNeither

MortgageLoanAnalysis <- as.data.frame(numNeither, "Number")
MortgageLoanAnalysis$a <- numJustMortgage
MortgageLoanAnalysis$b <- numJustLoan
MortgageLoanAnalysis$c <- numBoth

names(MortgageLoanAnalysis) <- c("Neither a Mortgage nor a Loan", "Only a Mortgage", "Only a Loan", "Both a Mortgage and a Loan")
MortgageLoanAnalysis <- rbind(
  MortgageLoanAnalysis,
  c(
    ((numNeither / total) * 100),
    ((numJustMortgage / total) * 100), 
    ((numJustLoan / total) * 100),
    ((numBoth / total) * 100)
  )
)
row.names(MortgageLoanAnalysis) <- c("Number", "Percentage")
MortgageLoanAnalysis <- t(MortgageLoanAnalysis)

MortgageLoanAnalysis

MortgagesAndLoans <- ggplot(
  data=bankData,
  mapping=aes(
    x=housing,
    fill=loan
  )
) + 
  geom_bar(
    position=position_dodge()
  ) + 
  scale_fill_manual(
    values=c("red", "blue")
  ) + 
  xlab("Has a Mortgage") +
  ylab("Number") + 
  ggtitle("Mortgages and Loans") +
  theme(plot.title=element_text(hjust=0.5))

MortgagesAndLoans

# MortgageLoanAnalysis shows the number and percentage of customers with and without mortgages and 
# loans, now we just need a visualization of this, which is meaningful because the second largest
# proportion of this bank's customer base has neither a loan or a mortgage, 
# and a very small percentage has both a loan and a mortgage, so the business can 
# focus on encouraging its customers to have loans/mortgages with the bank

################################################################################






