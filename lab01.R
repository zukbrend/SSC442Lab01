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

# scatter2 is not a useful plot because there is no related relationship between
# the two variables. The class generally dictates what drv the vehicle can have,
# and there are far too few data points to make any reasonable conclusions

scatter3 <- ggplot(
  data=mpgData,
  mapping=aes(
    x=displ,
    y=hwy,
    
  )
) + 
  geom_point() +
  xlab("Engine Size (Liters)") + 
  ylab("Highway Fuel Efficiency (mpg)") + 
  ggtitle("Exercise 1: Engine Size Vs. Highway Fuel Efficiency")










