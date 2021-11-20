#this code takes gaeta et al fish data and adds a new categorical variable for length greater 200 = big or small, then alters that cataegory.


fish_data = read.csv("data/Gaeta_etal_CLC_data_1.csv")
library(dplyr)

#create new categorical size column for dataframe fish_data

fish_data_cat = fish_data %>% mutate(length_cat = ifelse(length > 200, "big", "small"))
fish_data_cat

#change the size of the category cutoff from > 200 to >300

fish_data_cat = fish_data %>% mutate(length_cat = ifelse(length > 300, "big", "small"))

fish_data = read.csv("data/Gaeta_etal_CLC_data_1.csv")

#used R as a time machine and deleted + reverted a few different things.

fish_data_cat = fish_data %>% mutate(length_cat = ifelse(length > 300, "large", "small"))
fish_data_cat

#did the partenr exercise with Elsa and i made changes to the md file of mslein
