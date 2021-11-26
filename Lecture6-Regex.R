library(stringr)
install.packages("gapminder")
gDat <- gapminder::gapminder
str(gDat)
view(gDat)
gDat
library(dplyr)
library(tidyverse)
view(gDat)

# lets start this lecture 

grep('\'', levels(gDat$country), value = TRUE)

print("a\nb")
cat("a\nb")

(strings <- c("a", "ab", "acb", "accb", "acccb", "accccb"))

grep("ac*b", strings, value = TRUE)

grep("ac+b", strings, value = TRUE)

grep("ac?b", strings, value = TRUE)

grep("ac{2}b", strings, value = TRUE)

grep("ac{2,}b", strings, value = TRUE)

grep("ac{2,3}b", strings, value = TRUE)

#Exercise 1:

grep("ee+", gDat$country, value = TRUE) 
# greece

(strings <- c("abcd", "cdab", "cabd", "c abd"))

grep("ab", strings, value = TRUE)

grep("^ab", strings, value = TRUE)

grep("ab$", strings, value = TRUE)

grep("\\bab", strings, value = TRUE) 

grep(".R$", dir(), value = TRUE)


(strings <- c("abcd", "cdab", "cabd", "c abd"))
grep("ab", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("ab$", strings, value = TRUE)
grep("\\bab", strings, value = TRUE)


