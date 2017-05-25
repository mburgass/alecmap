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


spatial_dir<- 'shapefiles'
layer_land<- 'ne_10m_land'
poly_land<- readOGR(dsn= spatial_dir, layer = layer_land, stringsAsFactors = FALSE)
poly_land<- raster::crop(poly_land, extent(40.79282, 55.07082, 25.05267, 36.29817))


plot(poly_rivers, add=T, col='blue')
layer_regions<- 'ne_10m_admin_0_boundary_lines_land'
poly_regions<- readOGR(dsn= spatial_dir, layer = layer_regions, stringsAsFactors = FALSE)
poly_regions<- raster::crop(poly_regions, extent(40.79282, 55.07082, 25.05267, 36.29817))
#poly_regions<- poly_regions[poly_regions$featurecla=='Desert',]

layer_rivers<- 'ne_10m_rivers_lake_centerlines'
poly_rivers<- readOGR(dsn= spatial_dir, layer = layer_rivers, stringsAsFactors = FALSE)
poly_rivers<- raster::crop(poly_rivers, extent(40.79282, 55.07082, 25.05267, 36.29817))
poly_rivers2<- poly_rivers[poly_rivers$name %in% c("Tigris", "Euphrates", "Shatt al Arab", "Karun"),]

spatial_dir2<- 'gulf'
layer_land2<- 'iho'
poly_gulf<- readOGR(dsn= spatial_dir2, layer = layer_land2, stringsAsFactors = FALSE)
poly_gulf<- raster::crop(poly_gulf, extent(40.79282, 55.07082, 25.05267, 36.29817))


data(World)
p4s_world <- CRS('+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0')
world <- spTransform(World, p4s_world)
poly_regions2<- raster::crop(world,extent(40.79282, 55.07082, 25.05267, 36.29817))

layer_pop<- 'ne_10m_populated_places'
poly_pop<- readOGR(dsn= spatial_dir, layer = layer_pop, stringsAsFactors = FALSE)
poly_pop<- raster::crop(poly_pop, extent(40.79282, 55.07082, 25.05267, 36.29817))
poly_pop2<- poly_pop[poly_pop$NAME %in% c("Baghdad", "Umm Qasr", "Basra", "Ahvaz", "Abadan", "Kuwait"),]


base<-tm_shape(mymap, is.master=T)+tm_raster()
base<- base + tm_shape(poly_regions)+tm_lines(col = 'grey30', lwd = 2)+tm_shape(poly_regions2) +tm_text('name', size=2)
#base<- base + tm_shape(poly_regions) + ### is.master so this layer will drive extents, etc
  #tm_fill(col = '#e17133') +
  #tm_borders(col = 'grey30', lwd = 1)+
  #tm_text('name', size = 0.5, 
          #legend.size.show = FALSE)
base<- base + tm_shape(poly_rivers)+tm_lines(col="dodgerblue3") +
  tm_add_legend(type="line", col="dodgerblue3")
base<- base + tm_shape(poly_rivers2) +tm_lines(col="dodgerblue3") + tm_text('name', size=0.75, col = "dodgerblue3", auto.placement = TRUE)
base2<- base + tm_shape(poly_pop2) + tm_text('NAME', size=0.5)
#base<- base + tm_shape(poly_gulf)
print(base2)

