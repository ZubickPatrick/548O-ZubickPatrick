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

(strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12"))
grep("ab.", strings, value = TRUE)
grep("ab[c-e]", strings, value = TRUE)
grep("ab[^c]", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("\\^ab", strings, value = TRUE)
grep("abc|abd", strings, value = TRUE)
gsub("(ab) 12", "\\1 34", strings)


#Exercise 3 countries with i or t and ends with land.

itcountries = grep("i|t", gDat$country, value = TRUE)
itcountries

view(itcountries)
landcountries = grep("land$", itcountries, value = TRUE)
itLANDcountries = gsub("land", "LAND",landcountries)
view(itLANDcountries)
