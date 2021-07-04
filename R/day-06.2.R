#Anisah Calvin Cuevas
#July 4 2021
#Daily Exercise 6

library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties-recent.csv'
covid = read_csv(url)
covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 5)
covid %>%
  group_by(date) %>%
  summarize(cases = sum(cases)) %>%
  ggplot(aes(x = date, y = cases)) +
  geom_col(fill = "darkred", color = "darkred", alpha = .25) +
  geom_line(color = "darkred", size = 3) +
  ggthemes::theme_gdocs() +
  labs(title = "National Cummulative Case Counts",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")

