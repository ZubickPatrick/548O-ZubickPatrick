library(tidyverse)
library(nycflights13)

airlines
airports
planes
weather
flights
view(airports)
view(weather)
view(flights)
view(planes)
# part 2
flights2 <- flights %>% select(year:day, hour, origin, dest, tailnum, carrier)
flights2
flights2 %>% select(-origin, -dest)%>% left_join(airlines, by = "carrier")

# lets do some questions.

# first things it shows is how to build a map of USA? 
airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

# first need to group the flights DF by dest
flights_grouped = group_by(flights, dest)

# then need to summarise and take teh mean of arrival delay
flights_grouped2 = summarise(flights_grouped, delay = mean(arr_delay))
# got some pesky NA in there. 
flights_grouped_nona = summarise(flights_grouped, delay = mean(arr_delay, na.rm = TRUE))

# now need to join this to the airports DF

join_airports_delay = inner_join(airports,flights_grouped_nona, by = c("faa" = "dest"))

view(join_airports_delay)

# make a map using above way and new DF. But delay variable will be a colour.
join_airports_delay %>%
  ggplot(aes(lon, lat, colour = delay)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

# next thing is to add location of origin and destination (lat and lon to flights)

airports_latlon = airports %>% select (faa, lat, lon)
# now need to join this to flights (similar technique to question 1)

flights_latlon = flights %>% left_join(airports_latlon, by = c("origin"="faa")) 
view(flights_latlon)

# can i double leftjoin to get the dest in there too??
flights_latlon = flights %>% left_join(airports_latlon, by = c("origin"="faa")) %>% left_join(airports_latlon, by = c("dest"="faa"))
view(flights_latlon)

# now I added the 4 LAt lon columns, need to rename them somehow...

# try again with suffix, foound from ?leftjoin

flights_latlon = flights %>% left_join(airports_latlon, by = c("origin"="faa"), suffix = c("origin", "dest")) %>% left_join(airports_latlon, by = c("dest"="faa"), suffix = c("origin", "dest"))
view(flights_latlon)

# it appears to have worked, yayyyy (i feel like a wizard)

#age of plane and its delays?? 

view(planes)
view(flights)

#need to know about how year is different amongst these two DF 

?planes
?flights

#planes year = year manufactured
#flights = year of flight(2013)

#lets try to join the two by the year columns? 

#learn that is a dumb way due to crashing computer. all flights occured in 2013 lets mutate year in planes and subtract by 2013

planes_age = planes %>% mutate( age_plane = 2013 - year)
view(planes_age)
