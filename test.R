library(readr)
library(tmap)

### Sorting Shape Files ####
library('dplyr'); library('tidyr'); library('stringr')

### We will do some visualization of maps toward the end with `ggplot2` and `tmap` packages.
library('ggplot2')
library('tmap')
library('RColorBrewer') ### to go along with ggplot - getting better color selection into your plots

### Spatial packages: If you did Jamie's raster workshop, you probably have most of these already, but can't hurt to update.
library('sp')       ### spatial classes and basic spatial functionality
library('rgdal')    ### GDAL functionality in
library('rgeos')    ### vector spatial analysis tools
library('raster')   ### raster stuff, but some handy tools that work great for vector spatial data as well
library('maptools') ### an alternate package with good spatial analysis tools
library('spatstat')
library('tiff')
library('maps')
library('mapdata')
library('OpenStreetMap')
library('RgoogleMaps')
library('dismo')

spatial_dir<- 'gulf'
layer_land<- 'iho'
poly_gulf<- readOGR(dsn= spatial_dir, layer = layer_land, stringsAsFactors = FALSE)

mymap <- gmap("Oxford", type="hybrid", zoom= 10, lonlat=TRUE)
plot(mymap2)

select.area <- drawExtent()
mymap2 <- gmap(select.area, lonlat=TRUE, type="roadmap")
writeRaster(mymap, filename="study_area_satellite2.tif", overwrite=TRUE)
poly_land<- raster::crop(World, mymap)
plot(mymap)
plot(poly_land, add=TRUE)



spatial_dir<- 'iraq'
layer_land<- 'iraq_admbnda_adm0'
poly_iraq<- readOGR(dsn= spatial_dir, layer = layer_land, stringsAsFactors = FALSE)
poly_iraq<- raster::crop(poly_iraq, extent(40.79282, 55.07082, 25.05267, 36.29817))
spatial_dir<- 'kuwait'
layer_land<- 'kuwait_administrative'
poly_kuwait<- readOGR(dsn= spatial_dir, layer = layer_land, stringsAsFactors = FALSE)
poly_iraq<- raster::crop(poly_iraq, extent(40.79282, 55.07082, 25.05267, 36.29817))

print(base)

spatial_dir<- 'shapefiles'
layer_land<- 'ne_10m_coastline'
poly_coast<- readOGR(dsn= spatial_dir, layer = layer_land, stringsAsFactors = FALSE)
poly_coast<- raster::crop(poly_coast, extent(40.79282, 55.07082, 25.05267, 36.29817))

layer_country<- 'ne_10m_admin_0_countries'
poly_country<- readOGR(dsn= spatial_dir, layer = layer_country, stringsAsFactors = FALSE)
poly_country<- raster::crop(poly_country, extent(44.2069, 51.3459, 28.20232, 32.79988))