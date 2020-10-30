Pulicat <- leaflet() %>% 
  addTiles(urlTemplate = "https://mts1.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s=G", attribution = 'Google', group = "Google Earth") %>% 
  addProviderTiles(provider = providers$OpenStreetMap, group = "OSM") %>% 
  addMarkers(data = Villages, 
             lng = ~long, 
             lat = ~lat,
             label = ~`Village Name`,
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
              label = paste(shrimpfarm$Hectares,"ha"),
              highlightOptions = highlightOptions(
                weight = 5,
                bringToFront = TRUE
              ) 
  ) %>% 
  addPolylines(data= Ecosensitiveline, 
               weight = 3, 
               color = "black", 
               label = paste("Ecosensitive line was released only by Sullurpeta Wildlife Division (AP) while the Pulicat Wildlife Division (TN) had not as of 2018 August"),
               group = "Ecosensitive line-AP") %>% 
  addMarkers(data= Day1, 
             lat = ~lat, 
             lng =~lng, 
             group = "Images", 
             label= paste(Day1$Comment),
             popup = paste("<h3>", Day1$Comment, "</h3>", "<img src =" ,Day1$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day2, 
             lat = ~lat, 
             lng =~lng, 
             group = "Images", 
             label= paste(Day2$Comment),
             popup = paste("<h3>", Day2$Comment, "</h3>", "<img src =" ,Day2$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day3, 
             lat = ~lat, 
             lng =~lng, 
             group = "Images",
             label= paste(Day3$comment),
             popup = paste("<h3>", Day3$comment, "</h3>", "<img src =" ,Day3$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day4, 
             lat = ~lat, 
             lng =~lng, 
             group = "Images", 
             label= paste(Day4$comment),
             popup = paste("<h3>", Day4$comment, "</h3>", "<img src =" ,Day4$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day5, 
             lat = ~lat, 
             lng =~lng, 
             group = "Images",
             label= paste(Day5$comment),
             popup = paste("<h3>", Day5$comment, "</h3>", "<img src =" ,Day5$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day6, 
             lat = ~lat, 
             lng =~lng, 
             group = "Images",
             label= paste(Day6$comment),
             popup = paste("<h3>", Day6$comment, "</h3>", "<img src =" ,Day6$link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addMarkers(data= Day7, 
             lat = ~`a$GPSLatitude`, 
             lng =~`a$GPSLongitude`, 
             group = "Images",
             label= paste(Day7$Comment),
             popup = paste("<h3>", Day7$Comment, "</h3>", "<img src =" ,Day7$Link, ">"),
             clusterOptions = markerClusterOptions()) %>% 
  addLayersControl(
    baseGroups = c("Google Earth", "OSM"),
    overlayGroups = c("Pulicat", "CRZ","Villages", "Shrimp farm", "Ecosensitive line-AP", "Images"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>% 
  hideGroup(c("Villages", "Images", "Ecosensitive line-AP")) %>% 
  addControl(title, position = "bottomright", className="map-title")


title = paste("<b>", "Prepared by Jeffrey Immanuel","</b>")


