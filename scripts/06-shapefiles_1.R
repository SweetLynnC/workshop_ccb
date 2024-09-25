# setup -------------------------------------------------------------------

rm(list = ls())

library(sf)
library(tidyverse)

# data --------------------------------------------------------------------

#unzip shapefiles in shapefile folder. Keep the origin names
#Shift-control-C to uncomment the following lines if needed

usa <-
  read_sf('shapefiles/cb_2018_us_state_500k.shp') |>
  st_make_valid() |>
  janitor::clean_names()

usa |>
  write_sf('shapefiles/usa.gpkg')

# plot(st_geometry(usa))

counties <-
  read_sf('shapefiles/cb_2018_us_county_500k.shp') |>
   st_make_valid() |>
   janitor::clean_names()

plot(st_geometry(counties))

counties |>
  write_sf('shapefiles/counties.gpkg')

world <-
  read_sf('shapefiles/world.geojson') |>
   st_make_valid() |>
   janitor::clean_names()

plot(st_geometry(world))

world |>
  write_sf('shapefiles/world.gpkg')
