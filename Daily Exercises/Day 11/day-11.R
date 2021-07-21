# Anisah Calvin Cuevas
# Geography 13
# July 20, 2021
# Daily Exercise 11

library(tidyverse)
library(sf)
library(units)
library(dplyr)
library(readr)

home = readr::read_csv("~/github/geog-13-labs/data/uscities.csv") %>%
  st_as_sf(coords = cols("lat", "lng"),
  crs = 4326) %>%
  filter(city %in% c("Santa Barbara", "Baldwin Park"))

st_distance(home)

st_distance(st_transform(home, 5070))
st_distance(st_transform(home, '+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs'))

(st_distance(home) %>%
    set_units("km") %>%
    drop_units())


