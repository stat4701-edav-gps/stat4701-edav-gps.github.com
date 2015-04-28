#Two Analytic Approaches
* Individual geographical points 
    * latitude and longitude of each pickup and dropoff
* Aerial units 
    * In this case census blocks
    * Polygons




#Aerial data are subject to many analytic difficulties 
* Weird geographic categorizations (i.e. congressional districts)
* Spatial autocorrelation
    * Idea that things next to each other are likely to be more similar than things far apart from each other
    * A tall building on block is likely to be surrounded by other tall buildings 





#How can we overcome this problem?
* If we are considering lat/long points then we can weight them by decreasing levels of distance
* If we are considering blocks then we can think about them as neighbors, applying a few different definitions 




#Point based analysis
347 million latitude and longitude points is perhaps too complex for this anlaysis
But, we can take a random sample
Big Query random sample code



#Block based analysis
Examining block-level data makes sense because distributed building height and distance to roadbed were calculated for each census block



#How do you define a neighbor?
* Do the polygons share a border?
* How many degrees are they away from each other (six degrees of Kevin Bacon)?


#How do you actually do this in R?
Step 1: Read in census block (or zip code) shapefile from the NYC Department of City Planning [link](http://www.nyc.gov/html/dcp/html/bytes/districts_download_metadata.shtml)
      
      
    library(maptools)
        block <- readShapePoly('/Users/emiliebruzelius/Desktop/git/taxi/taxi/nycb2010_15a/nycb2010.shp')
        zips <- readShapePoly('/Users/emiliebruzelius/Desktop/git/taxi/taxi/nyc2010/nyc2010.shp')
    
---
#Step 2: Create neighbors using spdep package in R
* poly2nb() function in spdep takes spatial polygons and returns a list of neighbors 

        library(sp)
        library(spdep)
        
        length(block)
        block.nb <- poly2nb(block)
        head(block.nb)
        
        plot(block.nb, coordinates(block), 
            col = "red", pch = ".")
        plot(block, add = T)

        coords <- coordinates(block)
        IDs <- row.names(coords)

        block.nb3 <- graph2nb(gabrielneigh(coords), 
                      row.names = IDs)
        plot(block.nb3, coords, pch = ".", col = "red")
        plot(block.nb3, add = T)




![gps](http://images.amazon.com/images/G/01/electronics/detail-page/B001VEJEGK-1.jpg)



    code code
    if:
      do something
    elif:
      print
  

---


![gps](http://images.amazon.com/images/G/01/electronics/detail-page/B001VEJEGK-1.jpg)

[link](http://images.amazon.com/images/G/01/electronics/detail-page/B001VEJEGK-1.jpg) 

##Section 2, more content



---


#This is a list

* Item 1
    * item a
    * subitems
        * item b
* Item 2




