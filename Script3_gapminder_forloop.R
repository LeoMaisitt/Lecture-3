# SETTING THE STAGE.
# Load the packages into the workspace
library(tidyverse)
library(dplyr)
# Get the data. To download the data directly:
gapminder_orig <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv")
# define a copy of the original dataset that we will clean and play with 

gapminder <- gapminder_orig

# DESCRIPTION OF THE TASK. To rearrange the data in the 'gapminder' dataset in such a way that the data for a particular continent
# in a particular year will be gathered in a separate subset of data. You may imagine the original dataset as filling one sheet in 
# an Excel file and your task consisting of organizing this one large block of data into separate sheets where each sheet contains
# the data for one particular continent in a particular year. 

# In the present case , I will organize the data in a list where each element is again a list (sublist) containing a particular
# continent/year combination. Hence you can think of the list as an Excel file and its elements as the sheets in this file.


# STEP 1. First I extract the vectors containing year and continent information from the original dataframe.
# I use the 'distinct()' function that extracts all distinct combinations of entries in the 'continent' and 
# 'year' columns in the original dataframe. Though the number of distinct entries in the 'continent' column alone 
# is 5 and the number of entries in the 'year' column alone is 12, if the 'distinct' function is applied to
# the two columns in combination the number of distinct entries rises to 60 since e.g. 'Asia 1952' is distinct from
# 'Asia 1957' and so on.

continent_year<-distinct(gapminder,continent,year)


# STEP 2. From the dataframe 'continent_year' I now extract the 'continent' and 'year' columns as separate vectors
# using the function 'pull()'. I need these vectors as the source of the search criteria when I filter subdata from
# the original data in 'gapminder' in the following loop.

continents<-pull(continent_year,continent)
years<-pull(continent_year,year)

#continents<-pull(gapminder,continent)
#years<-pull(gapminder,year)

# Down to this point, my code is identical to that of Rebecca Barter
# *******************************************************************************************************************************
# From this point on, my loop-based approach differs from Rebecca Barter's map-based approach


# STEP 3. Here I preallocate/initialize the list where the looped data will be collected 
datalist<-vector(mode="list",length=length(years))

for(i in 1:length(years))
{

# Here, I filter the data from the original dataset ('gapminder') into a list. What the loop does, is that for each
# value of the index i, it finds the corresponding element in the 'continents' vector and in the 'years' vector and
# uses these values to select from the original dataset only data corresponding to a particular year/continent
# combination. For instance, when i=1, 
#       continents[i]="Asia"
#       years[i]=1952
# Hence, during the first iteration (i=1) the loop will look into 'gapminder'. It will find that in the "continents" vector, 
# the 1st (i=1) element is "Asia" and in the vector "years" the 1st element is "1952". Hence, using "Asia" and 1952 as search 
# criteria the loop will extract only the part containing information on Asian countries in 1952 in the dataframe 'gapminder'. 
# The extracted information will be saved as the first element in the list 'datalist' (i.e. datalist[[1]]). During the second 
# iteration (i=2), the loop will look into the "continents" vector and find the 2nd element named "Asia" and it will look into 
# the "years" vector and find the 2nd element "1957". Using those elements as new search criteria, the loop will extract information 
# on the Asian countries in 1957. And so on. When the loop reaches the 13th iteration, it will discover that the 13th element in the
# "continents" vector is "Europe" and the 13th element in the "years" vector is 1952. So again, using now "Europe" and 1952 as search
# criteria, the loop will extract information from the 'gapminder' dataframe on all European countries in 1952. And save this 
# information as the 13th element (sublist) in the list 'datalist'. 
  
  datalist[[i]]<-filter(gapminder,
                        continent==continents[i],
                        year==years[i])
}



# Here comes the plotting. Lots of different ways to do it. 
ggplot(datalist[[1]])+
  geom_point(aes(x=datalist[[1]][[6]],y=datalist[[1]][[5]]))+
  xlab(colnames(datalist[[1]][6]))+
  ylab(colnames(datalist[[1]][5]))
  #gtitle(paste(select_dataframe[4][1,1],select_dataframe[2][1,1]))

element<-datalist[[1]]
  xlab(colnames(element[6]))+
  ylab(colnames(element[5]))