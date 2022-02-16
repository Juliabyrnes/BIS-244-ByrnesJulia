# Assignment2.R
# By Julia Byrnes
# BIS224-011

# Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

library(tidyverse)

# Switching the working directory to the covid-19-data subfolder
setwd("./covid-19-data/")


# Reading the us.states.csv in as a data frame
STATES <- read_csv("us-states.csv")

View(STATES)

# Using filter()to get just Pennsylvania 
PENNSYLVANIA <- filter(STATES, state=="Pennsylvania")

View(PENNSYLVANIA)

# Set n to length of data set to show how many rows in a column
n <- length(PENNSYLVANIA$date)

# Initialize new variable in data frame for incr_cases
PENNSYLVANIA$incr_cases <- 2

#Calculate values for other than first row using FOR loop
for (i in 2:n){
  PENNSYLVANIA$incr_cases[i] <- (PENNSYLVANIA$cases[i] - PENNSYLVANIA$cases[i-1])
}

# Initialize new variable in data frame for incr_deaths
PENNSYLVANIA$incr_deaths <- 0

# Calculate values for other than first row using FOR loop
for (i in 2:n){
  PENNSYLVANIA$incr_deaths[i] <- (PENNSYLVANIA$deaths[i] - PENNSYLVANIA$deaths[i-1])
}

# Standard deviation of all incr_cases in PA
sd(PENNSYLVANIA$incr_cases)

