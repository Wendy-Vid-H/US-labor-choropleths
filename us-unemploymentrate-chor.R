library(tidyverse)
library(tigris)
library(tidycensus)
library(censusapi)
library(sf)

## The intention of this visualization is to briefly look at the State Monthly Unemployment rate in the US ###

### Get the 2019 1-year ACS on State-level Unemployment Rate ###
### Visualize the Unemployment Rate as a Choropleth ###
state_ur19 <- get_acs(
  geography = "state", 
  variables = "DP03_0005PE", 
  geometry = TRUE,
  year = 2019,
  progress = FALSE,
  survey = "acs1",
  resolution = "20m"
) |>
  shift_geometry()
ggplot() +
  geom_sf(
    data = state_ur19,
    mapping = aes(fill = estimate),
    color = "white") +
  scale_fill_gradient(low = "#cfe8f3", high = "#062635") +
  theme_void() + 
  labs(fill = "Unemployment \n Rate (%)",
       title = "US Unemployment Rate by state in 2019",
       caption = "Data Source: 2019 American Community Survey, 1 year estimate")+
  theme(
    plot.title = element_text(hjust = 1, face = "bold")
  )

### Get the 2020 5-year ACS on State-level Unemployment Rate ###
### Visualize the Unemployment Rate as a Choropleth ###
state_ur20 <- get_acs(
  geography = "state", 
  variables = "DP03_0005PE", 
  geometry = TRUE,
  year = 2020,
  progress = FALSE,
  resolution = "20m"
) |>
  shift_geometry()
ggplot() +
  geom_sf(
    data = state_ur20,
    mapping = aes(fill = estimate),
    color = "white") +
  scale_fill_gradient(low = "#cfe8f3", high = "#062635") +
  theme_void() + 
  labs(fill = "Unemployment \n Rate (%)",
       title = "US Unemployment Rate by state in 2020",
       caption = "Data Source: 2020 American Community Survey, 5 years estimate")+
  theme(
    plot.title = element_text(hjust = 1, face = "bold")
  )

### Get the 2020 5-year ACS on Median Income for Female at State-level ###
### Visualize the Female Median Income as a Choropleth ###
state_midincf2 <- get_acs(
  geography = "state", 
  variables = "B20017_005E", 
  geometry = TRUE,
  year = 2020,
  progress = FALSE,
  resolution = "20m"
) |>
  shift_geometry()
ggplot() +
  geom_sf(
    data = state_midincf2,
    mapping = aes(fill = estimate),
    color = "white") +
  scale_fill_gradient(low = "#cfe8f3", high = "#062635") +
  theme_void() + 
  labs(fill = "Median \n Income ($)",
       title = "Female Median Income by state in 2020",
       caption = "Data Source: 2020 American Community Survey, 5 years estimate")+
  theme(
    plot.title = element_text(hjust = 1, face = "bold")
  )

