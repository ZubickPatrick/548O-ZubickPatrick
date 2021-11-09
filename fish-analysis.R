fish_data = read.csv("Gaeta_etal_CLC_data.csv") 
#chANGE
library(dplyr)
#create new categorical size column for dataframe fish_data
fish_data_cat = fish_data %>% mutate(length_cat = ifelse(length > 200, "big", "small"))
#change the size of the category cutoff from > 200 to >300
fish_data_cat = fish_data %>% mutate(length_cat = ifelse(length > 300, "big", "small"))