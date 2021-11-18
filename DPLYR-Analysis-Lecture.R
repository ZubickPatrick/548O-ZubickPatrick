# lets get to work on this DPLYR lecture. Love to LEARN. 

#load full tidyverse 
library(tidyverse)

# load in survey data file. 

surveys <- read_csv("data/surveys.csv")

select(surveys, month, day, year)

filter(surveys, species_id == "DS")

mutate(surveys, hindfoot_length_cm = hindfoot_length/10)

surveys_plus = mutate(surveys,hindfoot_length_cm = hindfoot_length/10)

surveys <- mutate(surveys,hindfoot_length_cm = hindfoot_length / 10)

#Exercise 1

#lets read in a new data frame about shrubs

shrub_data = read.csv("data/shrub-volume-data.csv")

#do some checking of my data frame, structure and headings etc

names(shrub_data)

str(shrub_data)

select(shrub_data,length)

# lets turn all the new edited data to their own data frames. 

lengthdata = select(shrub_data, length)
view(lengthdata)

siteexpdata = select(shrub_data, site,experiment)
view(siteexpdata)

filtered_shrub = filter(shrub_data, height > 5)
view(filtered_shrub)

shrub_data_w_vols = mutate(shrub_data, volume = length * width * height)
view(shrub_data_w_vols)

