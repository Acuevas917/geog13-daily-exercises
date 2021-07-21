# Anisah Calvin Cuevas
# Geography 13
# July 21, 2021
# Daily Exercise 12

library(USAboundaries)
library(USAboundariesData)

Ten <- us_states(states = 'Tennessee')

Tencount = st_filter(us_states(), Ten,  .predicate = st_touches)

CONUS <- USAboundaries::us_states() %>%
  filter(!state_name %in% c( "Puerto Rico", "Alaska","Hawaii"))

ggplot() +
  geom_sf(data = CONUS, lty = 3) +
  geom_sf(data = Tencount, fill = 'red', alpha = .5) + theme() +
  labs(title = "United States Of America",
       x = "States that Touch Tennessee in red")


ggsave("States that Touch Tennessee", plot = last_plot(), device = "png")
