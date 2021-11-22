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

# first need to group the flights DF by dest
flights_grouped = group_by(flights, dest)

# then need to summarise and take teh mean of arrival delay
flights_grouped2 = summarise(flights_grouped, delay = mean(arr_delay))
# got some pesky NA in there. 
flights_grouped_nona = summarise(flights_grouped, delay = mean(arr_delay, na.rm = TRUE))

# now need to join this to the airports DF

join_airports_delay = inner_join(airports,flights_grouped_nona, by = c("faa" = "dest"))

view(join_airports_delay)


