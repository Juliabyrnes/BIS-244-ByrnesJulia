# Assignment2.R
# By Julia Byrnes
# BIS224-011

# Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

library(here)
library(tidyverse)

#Import the file inside the ZIP file into an R data frame
Precinct <- read_csv(here("Data", "President_precinct_general.zip"))
summary(Precinct)
str(Precinct)

#Clean Data 
temp1 <- group_by(Precinct, state, candidate)
temp2 <- summarize(temp1, N=sum(votes))
vote_by_state <- mutate(temp2, freq = N / sum(N), pct = round((freq*100), 0))
Votes <- select(vote_by_state, candidate,state,N)
Trump_Biden <- filter(vote_by_state, candidate=="DONALD J TRUMP" | candidate=="JOSEPH R BIDEN")
Trump <- filter(Trump_Biden, candidate=="DONALD J TRUMP")
names(Trump)[3] <- "Trump"
Biden <- filter(Trump_Biden, candidate=="JOSEPH R BIDEN")
names(Biden)[3] <- "Biden"
Trump_Biden_Merged <- merge(Trump, Biden, by.x = "state", by.y = "state")

#Determine the highest vote 
Trump_Biden_Merged$Winner <- 0
for (i in 1 : 48){
  if (Trump_Biden_Merged$Trump[i] > Trump_Biden_Merged$Biden[i]){
    Trump_Biden_Merged$Winner[i] <- "Trump"
  } else {}
  if (Trump_Biden_Merged$Biden[i] > Trump_Biden_Merged$Trump[i]){
    Trump_Biden_Merged$Winner[i] <- "Biden"
  } 
   
  }

Trump_Biden_Merged$WinnerVotes <- 0
for (i in 1 : 48){
  if (Trump_Biden_Merged$Trump[i] > Trump_Biden_Merged$Biden[i]){
    Trump_Biden_Merged$WinnerVotes[i] <- Trump_Biden_Merged$Trump[i]
  } else {}
  if (Trump_Biden_Merged$Biden[i] > Trump_Biden_Merged$Trump[i]){
    Trump_Biden_Merged$WinnerVotes[i] <- Trump_Biden_Merged$Biden[i]
  } 
  
}

#Plot data
p <- ggplot(data = Trump_Biden_Merged,
            mapping = aes(x = WinnerVotes,
                          y = state,
                          color = Winner
                             ))
p + geom_point() + 
  scale_color_manual(values=c("blue", "red")) + 
  labs(x = "Votes", y = "State",
       title = "Presidential Candidate Votes by State")


