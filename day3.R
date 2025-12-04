# all this code is fucked and wrong but in a special way
# so i keep in case i need eventually
options(scipen = 9999)

df <- read.csv("day3input.csv", header = F)
format()
df <- readLines("day3testinput.txt")

df <- as.numeric(df)
df <- as.data.frame(df)

library(tidyverse)


df2 <- df %>% 
  mutate(SortedList = sort(df, decreasing = T))

df3 <- df2 %>% 
  mutate(firstdig = substr(SortedList, start = 1, stop = 1)) %>% 
  mutate(seconddig = substr(SortedList, start = 2, stop = 2))

df3$firstdig <- as.numeric(df3$firstdig)
df3$seconddig <- as.numeric(df3$seconddig)

df4 <- df3 %>% 
  mutate(sum = firstdig + seconddig)

sum(df4$sum)



###################

options(scipen = 999)

df <- readLines("day3testinput.txt")

df <- as.data.frame(df)

rearrange_digits_desc <- function(i) {
  i <- as.character(i)
  digits <- unlist(strsplit(i, split = ""))   
  sorted_digits <- sort(digits, decreasing = TRUE)
  rearranged_char_num <- paste(sorted_digits, collapse = "")
  rearranged_char_num
}


df$rearranged_number <- sapply(df$df, rearrange_digits_desc)

df2 <- df %>% 
  mutate(firstdig = substr(rearranged_number, start = 1, stop = 1)) %>% 
  mutate(seconddig = substr(rearranged_number, start = 2, stop = 2)) %>% 
  mutate(combo = substr(rearranged_number, start = 1, stop = 2))

df2$firstdig <- as.numeric(df2$firstdig)
df2$seconddig <- as.numeric(df2$seconddig)
df2$combo <- as.numeric(df2$combo)

#df3 <- df2 %>% 
 # mutate(sum = firstdig + seconddig)

#sum(df3$sum)

sum(df2$combo)

