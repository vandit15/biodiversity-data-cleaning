library(rgbif)
library(geosphere)
library(ggmap)
library(maps)
library(ggplot2)


centroidfunction<-function(country){
  dataset<-occ_data(country = country, hasCoordinate = T,limit = 5000)
  data <- dataset$data
  
  # distm function requires x in form (long,lat) and y is the centroid point of the country as extracted from file
  dist_centroid<- distm(data[,c(4,3)],centroids[centroids$country==country,c(3,2)]) 
  data$dist_centroid<-dist_centroid[,1]
  
  #slicing records closer to centroid
  ##dist has to be given in metres since the output is in metres
  data<-data[data$dist_centroid<250000,] 


  ## printing map
  base <- get_map(country,zoom=5)
  coord <- data.frame(long = data$decimalLongitude,lat = data$decimalLatitude)
  map <- ggmap(base) + geom_point(data = coord,aes(x = long,y = lat))
  print(map)
  return(data)
}


##read centroids of countries data
centroids<-read.csv("centroids.csv")
result<-centroidfunction("IN")
print(head(result[,1:4]))

