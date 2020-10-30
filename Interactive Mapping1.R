
library(leaflet)
library(rgdal)
library(raster)
library(leafpop)

m <- leaflet() %>% 
  addProviderTiles(providers$Stamen.Toner) %>% 
  setView(lng = 80.2707, lat = 13.0827, zoom = 8)

PulicatRiver <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/Pulicat", layer = "Pulicat River" )

m <- m %>% 
  addPolygons(data = PulicatRiver, color = "#6600000", weight = 1 )


#LHKuppam

MGNREGA <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/LH Kuppam/MGNREGA plantation", layer = "MGNREGA" )
Residential <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/LH Kuppam/Residential area clip", layer = "1" )
Roads <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/LH Kuppam/Roads", layer = "Road" )

commons <- read_csv("Maps/HH survey/Village Important Places/Commons.csv")
DWS <- read_csv("Maps/HH survey/Village Important Places/Drinking Water Sources.csv")
VIP <- read_excel("Maps/HH survey/Village Important Places/Village Important Places.xlsx")
Govt <- read_csv("Maps/HH survey/Village Important Places/Govt institutions and Schools.csv")

LHKuppam <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/HH Survey", layer = "LH Kuppam" )

# addProviderTiles(providers$Esri.WorldImagery, group = "BaseMap") 
# addTiles(urlTemplate = "https://mts1.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s=G", attribution = 'Google') %>% 



leaflet() %>% 
  addPolygons(data = MGNREGA, group = "MGNREGA") %>% 
  addPolygons(data= Roads, group = "Roads") %>% 
  addMarkers(data = commons, lng = ~Longtitude, lat = ~Latitude, popup = ~Place, group = "Commons") %>% 
  addMarkers(data = DWS, lng = ~Longtitude, lat = ~Latitude, popup = ~Place, group = "Drinking Water") %>% 
  addMarkers(data = VIP, lng = ~Longtitude, lat = ~Latitude, popup = ~...1, group = "Important Places") %>% 
  addMarkers(data = Govt, lng = ~Longtitude, lat = ~Latitude, popup = ~Place, group = "Govt Institutions and Schools") %>% 
  addPolygons(data= LHKuppam, group = "LH Kuppam", color = 'black') %>% 
  addLayersControl(
    baseGroups = c("BaseMap"),
    overlayGroups = c("MGNREGA","Roads" ,"Commons", "Drinking Water Sources", "Important Places", "Govt Institutions and Schools"),
    options = layersControlOptions(collapsed = TRUE)
  ) %>% 
  hideGroup(c("MGNREGA","Roads" ,"Commons", "Drinking Water Sources", "Important Places", "Govt Institutions and Schools"))

#shrimp farm
PulicatRiver <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/Pulicat", layer = "Pulicat River" )
CRZ <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/Pulicat", layer = "CRZ areas" )
Villages <- read_csv("Maps/DR/OSM tracker/Villages.csv")
shrimpfarm <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/DR/Shrimp farms", layer = "Prawn aquacultures" )
Ecosensitiveline <- readOGR(dsn ="F:/Jeffrey/TAPESTRY/Interactive Mapping/Pulicat Lake/Maps/DR/OSM tracker/Ecosensitive line", layer = "ecosensitive line" )


Pulicat <- leaflet() %>% 
  addTiles(urlTemplate = "https://mts1.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s=G", attribution = 'Google') %>% 
  addMarkers(data = Villages, 
             lng = ~long, 
             lat = ~lat,
             popup = ~`Village Name`,
             group = "Villages",
             clusterOptions = markerClusterOptions()
  ) %>% 
  addPolygons(data= PulicatRiver, 
              group = "Pulicat", 
              color = 'blue', 
              weight = 2,
              fillOpacity = 0.5,
              highlightOptions = highlightOptions(
                weight = 5,
                bringToFront = TRUE
              )) %>% 
  addPolygons(data = CRZ, 
              group = "CRZ", 
              color = 'green',
              weight = 2,
              fillOpacity = 0.5,
              highlightOptions = highlightOptions(
                weight = 5,
                bringToFront = TRUE
              )) %>% 
  addPolygons(data = shrimpfarm, 
              popup = ~Hectares,
              group = "Shrimp farm", 
              color = 'red', 
              weight = 2,
              fillOpacity = 2,
              highlightOptions = highlightOptions(
                weight = 5,
                bringToFront = TRUE
              ) 
  ) %>% 
  addPolylines(data= Ecosensitiveline, weight = 3, color = "black", group = "Ecosensitive line-AP") %>% 
  addLayersControl(
    baseGroups = c("BaseMap"),
    overlayGroups = c("Pulicat", "CRZ","Villages", "Shrimp farm", "Ecosensitive line-AP"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>% 
  hideGroup(c("Pulicat", "CRZ", "Shrimp farm", "Villages", "Ecosensitive line-AP"))

Day1 <- read_csv("Maps/DR/OSM tracker/2018-05-30_08-54-53/1.csv")
Day2 <- read_csv("Maps/DR/OSM tracker/2018-05-31_05-12-39/2.csv")  
Day3 <- read_csv("Maps/DR/OSM tracker/2018-06-04_09-23-02/3.csv")  
Day4 <- read_csv("Maps/DR/OSM tracker/2018-06-05_08-57-14/4.csv")  
Day5 <- read_csv("Maps/DR/OSM tracker/2018-06-11_08-00-01/5.csv")  
Day6 <- read_csv("Maps/DR/OSM tracker/2018-06-12_08-27-49/6.csv")  




Pulicat %>% 
  addMarkers(data= Day1, lat = ~lat, lng =~lng, group = "Images", popup = paste("<h3>", Day1$Comment, "</h3>", "<img src =" ,Day1$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day2, lat = ~lat, lng =~lng, group = "Images", popup = paste("<h3>", Day2$Comment, "</h3>", "<img src =" ,Day2$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day3, lat = ~lat, lng =~lng, group = "Images", popup = paste("<h3>", Day3$comment, "</h3>", "<img src =" ,Day3$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day4, lat = ~lat, lng =~lng, group = "Images", popup = paste("<h3>", Day4$comment, "</h3>", "<img src =" ,Day4$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day5, lat = ~lat, lng =~lng, group = "Images", popup = paste("<h3>", Day5$comment, "</h3>", "<img src =" ,Day5$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day6, lat = ~lat, lng =~lng, group = "Images", popup = paste("<h3>", Day6$comment, "</h3>", "<img src =" ,Day6$link, ">"),
             clusterOptions = markerClusterOptions()) 


