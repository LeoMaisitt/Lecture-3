# SETTING THE STAGE
library(tidyverse)
library(reshape2)

#load the data
load('Ourstuff.RData')

# get the 'grades' dataframe
grades<-melt(Ourstuff[[1]],id.vars='names')

#plot the data
ggplot(grades,aes(x=names,y=value,fill=variable))+
  geom_bar(stat='identity',color='black',position='dodge')


