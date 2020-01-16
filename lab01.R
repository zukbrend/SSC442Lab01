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

View1 <- ggplot(
  data=bankData,
  mapping=aes(
    x=job,
    # color=education,
    fill=default
  )
) + 
  geom_bar(
    position=position_dodge()
  ) + 
  scale_fill_manual(
    values=c("black", "red")
  ) +
  # scale_color_manual(
    # values=c("red", "yellow", "green", "blue")
  # ) + 
  xlab("Occupation") +
  ylab("Number") + 
  ggtitle("Number of Defaulted Accounts Based on Occupation") +
  theme(axis.text.x=element_text(angle=90, hjust=1))

View1

View2 <- ggplot(
  data=bankData,
  mapping=aes(
    x=education,
    fill=default
  )
) + 
  geom_bar(
    position=position_dodge()
  ) + 
  scale_fill_manual(
    values=c("black", "red")
  ) +
  xlab("Education Level") +
  ylab("Number") + 
  ggtitle("Number of Defaulted Accounts Based on Education Level") +
  theme(axis.text.x=element_text(angle=90, hjust=1))

View2

View3 <- ggplot(
  data=bankData,
  mapping=aes(
    x=housing,
    color=loan,
    fill=education
  )
) + 
  geom_bar(
    position=position_dodge()
  ) + 
  # scale_fill_manual(
    # values=c("black", "red")
  # ) +
  scale_color_manual(
    values=c("black", "white")
  ) + 
  xlab("Has a Mortgage") +
  ylab("Number") + 
  ggtitle("Occupations as They Relate to Mortgages and Loans")

View3





