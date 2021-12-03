# starting the last lecture workshop

10 > 5
"aang" == "aang"
3 != 3
"dog" %in% c("cat", "dog", "rabbit")

5 > 2 & 6 >=10
5 > 2 | 6 >=10

c(1, 1, 2, 3, 1) == 1


site = c('a', 'b', 'c', 'd')
state = c('FL', 'FL', 'GA', 'AL')
state == 'FL'
site[state == 'FL']
site[c(TRUE, TRUE, FALSE, FALSE)]


library(tidyverse)

w <- 10.2
x <- 1.3
y <- 2.8
z <- 17.5
colors <- c("red", "blue", "green")
masses <- c(45.2, 36.1, 27.8, 81.6, 42.4)
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"


#Exercise 1
w > 10 

"green" %in% colors

x > y 

masses > 40


#exercise 2 
x <- 6
if (x > 5){
  x <- x^2
}
x

x <- 4
if (x > 5){
  x <- x^2
}
x


veg_type <- "tree"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
}
mass

# print y = 10 if age class = sapling

age_class = "sapling"
if (age_class=="sapling"){y = 10
  
}
y

veg_type <- "grass"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
} else if (veg_type == "grass") {
  mass <- 0.65 * volume^1.2
}
mass


veg_type <- "shrub"
volume <- 16.08
if (veg_type == "tree") {
  mass <- 2.65 * volume^0.9
} else if (veg_type == "grass") {
  mass <- 0.65 * volume^1.2
} else {
  mass <- NA
}
mass


age_class <- "seedling"
if (age_class == "sapling"){y = 10
  
} else if (age_class == "seedling"){y = 5}
y

#gives y = 5

age_class <- "sapling"
if (age_class == "sapling"){y = 10

} else if (age_class == "seedling"){y = 5}
y

# gives y = 10

age_class = "adult"
if (age_class == "sapling"){y = 10
} else if (age_class == "seedling") {y = 5
} else {
  y = NA
  }
y

#exercise 3 complete

#exercise 4 start

x <- 5
if (x > 2){
  x * 2
}
if (x > 4){
  x * 4
}


x <- 5
if (x > 2){
  x * 2
} else if (x > 4){
  x * 4
}


est_mass <- function(volume, veg_type){
  if (veg_type == "tree") {
    mass <- 2.65 * volume^0.9
  } else if (veg_type == "grass") {
    mass <- 0.65 * volume^1.2
  } else {
    print("I don't know how to convert volume to mass for that vegetation type")
    mass <- NA
  }
  return(mass)
}

est_mass(1.6, "tree")
est_mass(1.6, "grass")
est_mass(1.6, "shrub")


get_mass_from_length_by_name <- function(names,length){
if ( names == "Stegosauria") {
    mass = 10.95* length ^2.64
} else if ( names == "Theropoda") {
      mass = 0.73* length^3.63
} else if ( names == "Sauropoda") {
mass = 214.44 * length^ 1.46
} else {mass = NA

}
return(mass)
}

get_mass_from_length_by_name ("Stegosauria", 10)
get_mass_from_length_by_name ("Theropoda", 8)
get_mass_from_length_by_name ("Sauropoda", 12)
get_mass_from_length_by_name ("Anklyosauria", 13)
