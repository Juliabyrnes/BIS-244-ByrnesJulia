# Mid Term Exam - Applied Question 
# By Julia Byrnes 
# BIS224-011

# Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

# Should already have tidyverse installed. Load it into memory
library(tidyverse)

# Read in file AMD.csv
temp <- getwd()
setwd(temp)

AMD <- read_csv("AMD.csv")
view(AMD)


# Plot the data 
p <- ggplot(data = AMD,
            mapping = aes(x = Date,
                          y = Close))

p + geom_point() +
  labs(x = "Date", y = "Adjusted Closing Price",
       title = "AMD Adjusted Closing Prices 2/24/2021 to 2/24/2022")


