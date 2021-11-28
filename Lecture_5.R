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

1# then need to summarise and take the mean of arrival delay
flights_grouped2 = summarise(flights_grouped, delay = mean(arr_delay))
# got some pesky NA in there. 
flights_grouped_nona = summarise(flights_grouped, delay = mean(arr_delay, na.rm = TRUE))
view(flights_grouped_nona)
# now need to join this to the airports DF

join_airports_delay = inner_join(airports,flights_grouped_nona, by = c("faa" = "dest"))

view(join_airports_delay)

# make a map using above way and new DF. But delay variable will be a colour.
map = join_airports_delay %>%
  ggplot(aes(lon, lat, colour = delay)) +
  borders("state") +
  geom_point() +
  coord_quickmap()
map
# next thing is to add location of origin and destination (lat and lon to flights)

airports_latlon = airports %>% select (faa, lat, lon)
# now need to join this to flights (similar technique to question 1)

flights_latlon = flights %>% left_join(airports_latlon, by = c("origin"="faa")) 
view(flights_latlon)

# can i double leftjoin to get the dest in there too??
flights_latlon = flights %>% left_join(airports_latlon, by = c("origin"="faa")) %>% left_join(airports_latlon, by = c("dest"="faa"))
view(flights_latlon)

# now I added the 4 LAt lon columns, need to rename them somehow...

# try again with suffix, found from ?leftjoin

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

#remeber rachel tip using avg delay.

# first need to group the flights DF by dest
flights_grouped = group_by(flights, tailnum)

view(flights_grouped)

flights_grouped2 = mutate(flights_grouped, delay = mean(arr_delay))
view(flights_grouped2)

# got some pesky NA in there. 
flights_grouped_nona = mutate(flights_grouped, delay = mean(arr_delay, na.rm = TRUE))
view(flights_grouped_nona)

join_d= left_join(flights_grouped_nona,flights, by = "dest")
view(join_d)

# now have avg delay, lets add this column to the planes age DF using tailnum
view(flights_grouped_nona)
view(planes_age)

planeage_delay = dplyr::left_join(planes_age,join_d, by = "tailnum", na.rm=TRUE)
view(planeage_delay)

# should be good to go, lets make a scatter plot

ggplot(planeage_delay, aes(x=age_plane, y = delay))+geom_point()

# looks allright, there does not appear to be any relationship between the age of the plane and its delays. 

# exercise 3
# filter for planes with atleast 100 flights

flights100 = flights %>% drop_na(tailnum) %>% group_by(tailnum)%>% summarise(count=n())%>% filter(count >= 100) 

flights100
view(flights100)


# appears to be good

#5 what do these lines of code tell me? 
anti_join(flights, airports, by = c("dest" = "faa"))


anti_join(airports, flights, by = c("faa" = "dest"))

# these two lines of code do the same function but in a different order on each DF. Firstly in the first line of code it starts with the flights data frame and upon anti joining with airports it removes all nonmatches between dest and FAA columns so these flights were not going to an airport in the dest list. 
# the second  line tells a similar story but reversed and these flights were not coming to a airport in the FAA list.