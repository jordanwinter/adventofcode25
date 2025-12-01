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

df2 <- df1 %>% 
  mutate(test = ifelse())

zeroto99 <- function(x) {
  x <- max(0, x)
}