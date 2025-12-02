# Advant of Code Day 1

#load data

df <- read.csv("day1input.csv", header = F)

#load libs

library(tidyverse)

# thought process
# values from 0 - 99 - maybe use an array or a matrix? Needs to overflow from
# one side to the other
# starts at 50
# in df if R then it's + that many
# if L then it's - that many
# if then new column positive / negative that value
# then make new column that's TRUE or FALSE if the column generates a zero
# then count number of TRUES

df1 <- df %>% 
  separate(V1, into = c("Letter", "Number"), sep = 1)

df1$Number <- as.numeric(df1$Number)

df2 <- df1 %>% 
  mutate(Number = ifelse(Letter == "L", -abs(Number), Number))

df2test <- subset(df2, select = -Letter)

df2test$Results <- NA

#set starting value idk how to make it start at 50 lmao

df2test$Results[1] <- (50 + df2test$Number[1]) %% 100

#do the %% modulus or whatever for everything

for (i in 2:nrow(df2test)) {
  df2test$Results[i] <- (df2test$Results[i-1] + df2test$Number[i]) %% 100
}

#count the zeros

count <- sum(df2test$Results == 0)

count

# it work

# wtf is part two 
# i think mod the loop to update a column for how many times it passes 0

df2test$Zeroes <- 0

county <- 0

for (i in 2:nrow(df2test)) {
  df2test$Results[i] <- (df2test$Results[i - 1] + df2test$Number[i]) %% 100
  
  prev_raw <- df2test$Results[i - 1]
  curr_raw <- df2test$Results[i]
  
  #0 check
  if (curr_raw == 0) {
    county <- county + 1
  } else {
    # check if 0 was passed between previous and current?
    step <- df2test$Number[i]
    prev_cum <- prev_raw
    curr_cum <- (prev_raw + step)
    if (floor(prev_cum / 100) != floor(curr_cum / 100)) {
      county <- county + 1
    }
  }
  
  df2test$Zeroes[i] <- county
}

# so this isnt counting multiple passes of 0 i think


