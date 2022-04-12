# Assignment4.R
# By Julia Byrnes
# BIS224-011

library(here)
library(tidyverse)
library(ggrepel)

#Import the data
Movies <- read_csv(here("Data", "Top_10000_Popular_Movies.csv"))

#Clean data 
Movies_clean <- select(Movies, original_title, popularity, release_date)
Movies_releasedate <- filter(Movies_clean, release_date>"2020-01-01" & release_date<"2022-01-01")


#Plot data
p <- ggplot(data = Movies_releasedate,
            mapping = aes(x = release_date, y = popularity))
p + geom_point() +
  scale_y_continuous(labels = scales::scientific) +
  geom_text_repel(mapping = aes(label = original_title)) +
  labs(x = "Release Date", y = "Popularity Score",
       title = "Top 10,000 Most Popular Movies")
