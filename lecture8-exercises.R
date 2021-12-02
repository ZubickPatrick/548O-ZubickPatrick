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

age_class = "sapling"
if (age_class=="sapling"){y = 10
  
}
y
