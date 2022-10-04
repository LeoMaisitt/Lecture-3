# SETTING THE STAGE. 
# Load the packages into the workspace
library(tidyverse)
library(dplyr)
# Get the data
gapminder_orig <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv")
# define a copy of the original dataset that we will clean and play with 
gapminder <- gapminder_orig

# STEP 1. 
continent_year<-gapminder%>%distinct(continent,year)


# STEP 2. 
continents<-continent_year%>%pull(continent)%>%as.character
years<-continent_year%>%pull(year)


 
maplist<-map2(.x=continents,
              .y=years,
              .f=function(.x,.y){filter(gapminder,continent ==.x,year==.y)})
 

# STEP 5.
ggplot(data=the_result_of_filter)+
geom_point(aes(x=gdpPercap,y=lifeExp))
