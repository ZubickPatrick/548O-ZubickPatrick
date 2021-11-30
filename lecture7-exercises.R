# lecture 7 workshop 

{a = 2 
b = 3 
a + b}


calc_shrub_vol <- function(length, width, height) {
  volume <- length * width * height
  return(volume)
}

calc_shrub_vol(0.8, 1.6, 2.0)

shrub_vol <- calc_shrub_vol(0.8, 1.6, 2.0)
shrub_vol

#exercise 1

x=3.75
fact = 0.0022046
calc_grams <- function(lb, fact) {
  grams <- lb/fact
  return(grams)}

calc_grams(x,fact)

# answer = 1700.989

#exercise 2

#the below function estimates the mass in KG of an organism based on its length in meters for a set of values.

get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

length = 16

get_mass_from_length_theropoda(length)

# answer is 17150.56



# new try of this function with getmassfromlength


get_mass_from_length = function(length =1, a = 1, b = 1){
  mass = a * length^ b
return(mass)}
get_mass_from_length(26,214.44,1.46)

#done exercise 2 answer is 24955.54

#exercise 3


get_mass_from_length = function(length =1, a = 39.9, b = 2.6){
  mass = a * length^ b
  return(mass)}
get_mass_from_length(22, 214.44,1.46)

# answer is 19554.33



get_mass_from_length = function(length =1, a = 39.9, b = 2.6){
  mass = a * length^ b
  return(mass)}
get_mass_from_length(16)

# answer is 53911.93

calc_shrub_vol <- function(length = 1, width = 1, height = 1) {
  volume <- length * width * height
  return(volume)
}

#passing a and b is more useful than having them fixed due to having more control of the values when you pass them. 


# exercsie 4 
calc_lb <- function(kg=1, fact=2.205) {
  grams <- kg*fact
  return(grams)}
calc_lb(get_mass_from_length(12,10.95,2.64))

# answer = 17055.37 lb, feel like a dam wizard!!!!
