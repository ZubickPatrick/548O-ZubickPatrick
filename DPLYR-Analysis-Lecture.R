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

#starting exercise 2

#learning about aggregation

group_by(surveys, species_id)

surveys_by_species = group_by(surveys, species_id)

# calculate some values for each group 

summarize(surveys_by_species, abundance = n())

# group by multiple columns

surveys_by_species_plot <- group_by(surveys, species_id, plot_id)
summarize(surveys_by_species_plot, abundance = n())

species_weight = summarize(surveys_by_species, avg_weight = mean(weight))

view(species_weight)

#remove na
species_weight = summarize(surveys_by_species, avg_weight = mean(weight, na.rm = TRUE))

#na didnt go away, need to omit it

na.omit(species_weight)

ds_data = filter(surveys, species_id == "DS")

ds_data_by_year = group_by (ds_data, year)

ds_weight_by_year = summarize(ds_data_by_year, avg_weight = mean(weight, na.rm = TRUE))

# this was inefficient because of doing this in this way is a 3 step process. involving creating 3 different objects.

# lets do exercise 2

survey_year_month_day = select(surveys, year, month, day, species_id)
view(survey_year_month_day)

weight_kg = na.omit(surveys)
weight_kg = select(weight_kg,year, species_id, weight)
weight_kg = mutate(weight_kg, weight = weight / 1000)

df_filter_SH = filter(surveys,species_id == "SH")
view(df_filter_SH)

survey_countspp= group_by(surveys,species_id)
survey_countspp = summarize(survey_countspp, abundance = n())
view(survey_countspp)

surveys_spp_yr = group_by(surveys, year, species_id)
surveys_spp_yr = summarize(surveys_spp_yr, abundance = n())
view(surveys_spp_yr)

surveys_mass = group_by(surveys, species_id)
surveys_mass = filter(surveys_mass, species_id =="DO")
surveys_mass = na.omit(surveys_mass)
surveys_mass = summarize(surveys_mass, mean_weight = mean(weight))



