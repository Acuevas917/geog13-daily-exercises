# Anisah Calvin Cuevas
# July 11, 2021
# Daily Exercise 10

library(ggplot2)
library(tidyverse)
library(ggthemes)
library(USAboundaries)
library(sf)

conus = USAboundaries::us_states() %>%
  dplyr::filter(!state_abbr %in% c("AK", "HI", "PR"))

us_c_ml = conus %>%
  st_combine() %>%
  st_cast("MULTILINESTRING")

us_u_ml = conus %>%
  st_union() %>%
  st_cast("MULTILINESTRING")

plot(us_u_ml)
