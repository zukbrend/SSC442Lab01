# Load required libraries
library(tidyverse)

# Save data in a data frame
mpgData <- ggplot2::mpg

### EXERCISE 1 ###
scatter <- ggplot(
  data=mpgData,
  mapping=aes(
    x=displ,
    y=hwy
  )
) + 
  geom_point() +
  xlab("Engine Size (Liters)") + 
  ylab("Highway Fuel Efficiency (mpg)") + 
  ggtitle("Exercise 1: Engine Size Vs. Highway Fuel Efficiency")

scatter

# Yes, scatter shows the intuitive relationship that as engine size (disp) increases, 
# highway fuel efficiency will decrease

scatter2 <- ggplot(
  data=mpgData,
  mapping=aes(
    x=class,
    y=drv
  )
) + geom_point()

scatter2

# scatter2 is not a useful plot because there is no related relationship between
# the two variables. The class generally dictates what drv the vehicle can have,
# and there are far too few data points to make any reasonable conclusions

### Exercise 1b ###

scatter3 <- ggplot(
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
  ggtitle("Exercise 1: Engine Size Vs. Highway Fuel Efficiency")

scatter3

# Given the scatter plot generated with color coded dots according to the type
# of vehicle, it appears that 2-seat vehicles are outlyers in the sense that they
# achieve better highway fuel efficiency than other types of vehicles with the
# same size engine

### Exercise 2 ###

# Save the bank data as a data frame
bankData <- read.csv("bank.csv")
head(bankData)

scatter4 <- ggplot(
  data=bankData,
  mapping=aes(
    x=marital,
    color=education,
    fill=default
  )
) + 
  geom_bar(
    position=position_dodge()
  ) + 
  scale_color_manual(
    values=c("red", "orange", "yellow", "green")
  ) + 
  scale_fill_manual(
    values=c("white", "black")
  ) +
  xlab("Marital Status") +
  ylab("Number")

scatter4

numDivorced <- length(which(bankData$marital == "divorced"))
numMarried <- length(which(bankData$marital == "married"))
numSingle <- length(which(bankData$marital == "single"))

numDivorcedDefault <- length(which((bankData$marital == "divorced") && (bankData$default == "yes")))
numMarriedDefault <- length(which((bankData$marital == "married") && (bankData$default == "yes")))
numSingleDefault <- length(which((bankData$marital == "single") && (bankData$default == "yes")))

total <- c(numDivorced, numMarried, numSingle)
default <- c(numDivorcedDefault, numMarriedDefault, numSingleDefault)
percentage <- c(numDivorcedDefault/numDivorced, numMarriedDefault/numMarried, numSingleDefault/numSingle)

total
default
percentage

which





