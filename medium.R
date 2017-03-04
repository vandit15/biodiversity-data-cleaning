library(rgbif)

flag<-function(data){
  
  data$flag <- "good"
  naindexes <- which(is.na(data$day)|is.na(data$month)|is.na(data$year))
  
  if(length(naindexes)>0){
  data[naindexes,]$flag <- "bad"
  }
  print(head(data[, c("day", "month", "year", "flag")]))
}

##read 10,000+ records of species
peacock<-occ_data(scientificName = "pavo cristatus",limit = 10000)

#extracting occurence records data frame
data <- peacock$data
print(dim(data))
flag(data)

