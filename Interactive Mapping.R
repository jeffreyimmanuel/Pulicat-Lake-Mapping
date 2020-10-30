library(tidyverse)
library(readxl)
library(ggmap)
library(leaflet)
library(sp)

commons <- read_csv("Maps/HH survey/Village Important Places/Commons.csv")
DWS <- read_csv("Maps/HH survey/Village Important Places/Drinking Water Sources.csv")
VIP <- read_excel("Maps/HH survey/Village Important Places/Village Important Places.xlsx")

Padu <- read_csv("Maps/HH survey/Village Important Places/Padu.csv")


commons_SP <- SpatialPointsDataFrame(commons[,c(2,3)], commons[,-c(2,3)])

a <- leaflet() %>% 
  addTiles() %>% 
  addMarkers(data = commons, lng = ~Longtitude, lat = ~Latitude, popup = ~Place)

DWS$video <- c('<iframe width="560" height="315" src="https://www.youtube.com/embed/nk-fB_60fJs" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', '<iframe width="560" height="315" src="https://www.youtube.com/embed/dx3khWsUO1Y" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')

b <- leaflet() %>% 
  addProviderTiles("Esri.WorldImagery") %>% 
  addMarkers(data = commons, lng = ~Longtitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", Place)) %>% 
  addMarkers(data = DWS, lng = ~Longtitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", Place, video)) %>% 
  addCircles(data = Padu, lng = ~Longitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", `Padu Name`))  
  

library(rgdal)
c <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/Pulicat", layer = "Pulicat River" )

library(sf)
e <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/Pulicat", layer = "CRZ areas" )



d <- leaflet(c) %>% 
  addProviderTiles("Esri.WorldImagery") %>% 
  addMarkers(data = commons, lng = ~Longtitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", Place)) %>% 
  addMarkers(data = DWS, lng = ~Longtitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", Place, video)) %>% 
  addCircles(data = Padu, lng = ~Longitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", `Padu Name`))  %>% 
  addPolygons(fillColor = "Blue")




g <- leaflet() %>% 
  addProviderTiles("Esri.WorldImagery", group = "BaseMap") %>% 
  addPolygons(data =c, fillColor = "Red", group = "Pulicat Lake") %>% 
  addPolygons(data= e, fillColor = "Blue", group = "CRZ Areas") %>% 
  addMarkers(data = commons, lng = ~Longtitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", Place), group = "Commons") %>% 
  addMarkers(data = Padu, lng = ~Longitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", `Padu Name`, group= "Padu")) %>% 
  addMarkers(data = DWS, lng = ~Longtitude, lat = ~Latitude, popup = ~paste("<b>Place:</b>", Place, video), group = "Drinking Water Sources") %>% 
  addLayersControl(
    baseGroups = c("BaseMap"),
    overlayGroups = c("Pulicat Lake", "CRZ Areas", "Padu", "Commons", "Drinking Water Sources"),
    options = layersControlOptions(collapsed = FALSE)
  )


x <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/Pulicat/HTL", layer = "HTL" )
y <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/DR/Shrimp farms", layer = "Prawn aquacultures" )


z <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/DR/OSM tracker/2018-05-30_08-54-53/1.geojson")



h <- leaflet() %>% 
  addProviderTiles("Esri.WorldImagery", group = "BaseMap") %>% 
  addPolygons(data =c, fillColor = "Blue", color = "Blue", group = "Pulicat Lake") %>% 
  addPolygons(data= e, fillColor = "Red", color = "Red", group = "CRZ Areas") %>% 
  addPolylines(data= x, fillColor = "White", color = "White", group = "HTL") %>% 
  addPolygons(data= y, fillColor = "Yellow", color = "Yellow", group = "Shrimp farms") %>% 
  addMarkers(data = Villages, lng = ~long, lat = ~lat, popup = ~`Village Name`, group = "Villages") %>% 
  addMarkers(data = DWS, lng = ~Longtitude, lat = ~Latitude, popup = ~video, group = "Drinking Water") %>% 
  addLayersControl(
    baseGroups = c("BaseMap"),
    overlayGroups = c("Pulicat Lake", "CRZ Areas", "HTL", "Shrimp farms", "Villages", "Drinking Water"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>% 
  hideGroup(c("Villages", "Drinking Water", "HTL"))

Day1 <- read_csv("Maps/DR/OSM tracker/2018-05-30_08-54-53/1.csv")

Villages <- read_csv("Maps/DR/OSM tracker/Villages.csv")

library(exifr)
