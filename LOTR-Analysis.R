#lets do day 3 exercise and workshop 
library(tidyverse)
library(readr)
The_Fellowship_Of_The_Ring <- read_csv("data/The_Fellowship_Of_The_Ring.csv")
The_Return_Of_The_King <- read_csv("data/The_Return_Of_The_King.csv")
The_Two_Towers <- read_csv("data/The_Two_Towers.csv")
#lets add these 3 data sets together.
lotr_untidy = bind_rows(The_Fellowship_Of_The_Ring,The_Return_Of_The_King,The_Two_Towers)
str(lotr_untidy)
lotr_untidy
#save the new untidy dataframe to computer
write_csv(lotr_untidy, "data/lotr_untidy.csv")
#still need to tidy this data frame up 
lotr_tidy = pivot_longer(lotr_untidy, cols=c(Female, Male), names_to = 'Gender', values_to = 'Words')
lotr_tidy <- arrange(lotr_tidy, Gender)
lotr_tidy
write_csv(lotr_tidy, "data/lotr_tidy.csv")
#working now with untidy word count data
Female = read_csv("data/Female.csv")
Male = read_csv("data/Male.csv")
# need to add the two together
lotr_count_untidy = bind_rows( Male, Female)
str(lotr_count_untidy)
#save the new untidy count dataframe to computer
write_csv(lotr_count_untidy, "data/lotr_count_untidy.csv")
# still need to tidy this up by adding the races to one column with word count in another.
lotr_count_tidy = pivot_longer(lotr_count_untidy, cols=c(Elf, Hobbit, Man), names_to = 'Race', values_to = 'Words')
lotr_count_tidy <- arrange(lotr_count_tidy, Race)
lotr_count_tidy
# all good now need to send over and save this.
write_csv(lotr_count_tidy, "data/lotr_count_tidy.csv")
# find total number of words by race across entire trilogy. 
# words spoken by males hobitts can be found here
lotr_tidy %>% 
  +     count(Gender, Race, wt = Words)
# words spoken by race and gender is done here
(by_race_film <- lotr_tidy %>% 
    group_by(Film, Race) %>% 
    summarize(Words = sum(Words)))
p <- ggplot(by_race_film, aes(x = Film, y = Words, fill = Race))
p + geom_bar(stat = "identity", position = "dodge") +
  coord_flip() + guides(fill = guide_legend(reverse = TRUE))
#tidy data way is pretty easy, elfs speak 2200,693 and 844, hobbit speaks 3658,2675, 2463, man speaks, 1995,2727, 3990.
#lets try to do the dirty way with untidy film specific data.
lotr_untidy_counting = mutate(lotr_untidy,words = Female + Male)
# got the answer here using one step instead of multiple like the above option using the tidy data... making me concerned that I may have messed up. Same answer was outputted so I am proceeding as if it is good for now. will ask thursday. 


  


