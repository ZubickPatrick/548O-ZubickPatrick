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

#exercise 2

#the below function estimates the mass in KG of an organism based on its length in meters for a set of values.

get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

length = 16

get_mass_from_length_theropoda(length)


# new try of this function with getmassfromlength

a=214.44
b=1.46
length = 26


get_mass_from_length = function(length){
  mass = a * length^ b
return(mass)}
get_mass_from_length(length)

#done exercise 2