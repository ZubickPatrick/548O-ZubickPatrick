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

# this was inefficient because of doing this in this way is a 3 step process. involving creating 3 different objects.pipes would make it better i believe

# lets do exercise 2

survey_year_month_day = select(surveys, year, month, day, species_id)
view(survey_year_month_day)

# weight of each individual in KG
weight_kg = select(surveys,year, species_id, weight)
weight_kg = na.omit(weight_kg)
weight_kg = mutate(weight_kg, weight = weight / 1000)
weight_kg

# data frame rows only SH 
df_filter_SH = filter(surveys,species_id == "SH")
view(df_filter_SH)

# count of individuals in each species.
survey_countspp= group_by(surveys,species_id)
survey_countspp = summarize(survey_countspp, abundance = n())
view(survey_countspp)

#count species id by year
surveys_spp_yr = group_by(surveys, year, species_id)
surveys_spp_yr = summarize(surveys_spp_yr, abundance = n())
view(surveys_spp_yr)

# mean mass of DO by year
surveys_mass = group_by(surveys, species_id)
surveys_mass = filter(surveys_mass, species_id =="DO")
surveys_mass = na.omit(surveys_mass)
surveys_mass
surveys_mass = group_by(surveys_mass,year)
surveys_mass = summarize(surveys_mass, year, mean_weight = mean(weight))
surveys_mass_year_DO = dplyr::distinct(surveys_mass)
view(surveys_mass_year_DO)

#continue exercise 2

x = c(1, 2, 3)
mean(x)

x %>% mean()

x = c(1, 2, 3, NA)
mean(x, na.rm = TRUE)
x %>% mean(na.rm = TRUE)

surveys %>%
  filter(species_id == "DS", !is.na(weight))

ds_weight_by_year <- surveys %>%
  filter(species_id == "DS") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))

# exercise 3 
library(tidyverse)

# df with year, species id and weight in KG 
weight_kg_piped = surveys %>% select(year, species_id, weight) %>% na.omit(weight_kg_piped) %>% mutate(weight = weight/1000)
weight_kg_piped

# df with yr, month, day and species id for SH. 
sh_piped = surveys %>% select (year, month,day, species_id) %>% filter(species_id == "SH")
sh_piped

# countof each species ID 
count_id= surveys %>% group_by(species_id) %>% summarize(abundance = n())

# count id by year 

count_id_year= surveys %>% group_by(species_id,year) %>% summarize(abundance = n())
count_id_year

#mean mass DO by year
Mean_mass_DO = surveys %>% group_by(species_id) %>% filter(species_id == "DO") %>% na.omit() %>% group_by(year)%>% summarise(year, mean_weight = mean(weight))
Mean_mass_DO

#why is it duplicating?!?!?! 

filter(surveys, species_id == "DS", year > 1995)

filter(surveys, species_id == "DS" & year > 1995)

filter(surveys, species_id == "DS" | species_id == "DM" | species_id == "DO")

species_weights <- surveys %>%
  group_by(species_id) %>%
  filter(n() > 100) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))
species_weights

# all done, need to ask Rachel a few questions. line 159



