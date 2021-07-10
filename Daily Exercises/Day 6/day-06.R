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
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6) %>%
  pull(state)
covid %>%
  filter(state %in% c("California", "Florida", "Texas", "New York", "Georgia", "Illinois")) %>%
  ggplot(aes(x = date, y = cases)) +
  geom_line(aes(color = state)) +
  facet_wrap(~state) +
  theme_gray()
covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6) %>%
  pull(state) ->
  top_states
covid %>%
  filter(state %in% state) %>%
  group_by(state, date) %>%
  summarise(cases = sum(cases)) %>%
  ungroup() %>%
  ggplot(aes(x = date, y = cases, color = state)) +
  geom_line(size = 2) +
  facet_wrap(~state) +
  ggthemes::theme_gdocs() +
  theme(legend.position = 'NA') +
  labs(title = "Cummulative Case Counts",
       subtitle = "Data Source: NY-Times",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")

