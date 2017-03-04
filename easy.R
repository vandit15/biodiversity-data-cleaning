library(rgbif)
library(mapr)
library(ggmap)
library(ggplot2)


peacock<-occ_search(scientificName = "pavo cristatus",limit = 500)
lion<-occ_search(scientificName = "Panthera leo",limit=500)


##applyting mapping functions
print(map_ggplot(peacock))
print(map_ggmap(lion))

