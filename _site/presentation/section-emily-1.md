# taxi Blah

##Introduction
Use of global positioning system (GPS) technology has become a standard method of data collection in geographical epidemiology and public health studies. However, in dense urban environments, GPS measurements are highly prone to error as signals bounce off large buildings and other structures. Formally defined as multipath error, these reflections increase the distance that the GPS signal must travel to reach the receiver—causing miscalculations in position. Multipath problems can result in locations that seemingly wander or jump as the signal is dropped and regained. Although the error associated with these split second delays may seem negligible, the multipath phenomena can substantially impact positional accuracy and tracking measurements.
In order to evaluate the associations between urban density and GPS positional accuracy we used data from the New York City (NYC) Taxi and Limousine Commission containing information on the approximately 175 million NYC yellowcab taxi trips that occurred in 2013. We hypothesized that higher building density would be positively associated with errors in accuracy. 


##Methods
The publically available taxi data were accessed using Google Big Query. The original dataset was obtained through a Freedom of Information Act Law (FOIL) request. The available variables included date, medallion, hack license, number of passengers, and GPS-based latitude and longitude of pickup and drop off locations. Data on fare information was also available but not included in this evaluation.

##Geoprocessing

##Statistical Analysis
Preliminary data analysis examined the shape and distribution of the data. Summary statistics were calculated for each variable. X census block with a distributed building of zero, typically representing large parks, beaches, and cemeteries, were excluded from analysis. Missing values were omitted from analysis. Initial analysis also explored the relationship between median/mean distributed building volume and distance to roadbed . 

The continuous data on distance to roadbed was initially dichotomized to reflect any accuracy error versus none. Logistic regression models were created to investigate associations between distributed building volume and any location outside of the roadbed. Linear regression analysis was used to examine the relationship between building volume and increasing distance from roadbed.

K means cluster analysis was used to...

Geoprocessing tasks inclding xyz were conducted using ? and data analyses were completed using R. 
