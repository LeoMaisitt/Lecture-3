# Load the neccessary packages into the workspace
library(tidyverse)
library(readxl)
library(writexl)

# Read 'Eurodata' into the workspace
Eurodata<-read_excel('Europe-1952.xlsx')

# Make the vector with the names of the Mediterranean countries
mednames<-c('Albania',
       'Bosnia and Herzegovina',
       'Croatia',
       'France',
       'Greece',
       'Italy',
       'Montenegro',
       'Slovenia',
       'Spain')

# Initialize the dataframe where the data on the Mediterranean countries will be collected
Meddata<-data.frame(matrix(nrow=length(mednames),ncol=ncol(Eurodata)))

# Assign names to the columns of 'Meddata'. Take these names from the original 'Eurodata'
colnames(Meddata)<-colnames(Eurodata)

# Fill 'Meddata' with data from 'Eurodata' using map_df
Meddata<-map_df(.x=mednames,
                .f=function(.x){filter(Eurodata,country==.x)})


# Save 'Meddata' as an Excel file
write_xlsx(Meddata,'C:/Users/kalle/Documents/R/Project2/Mediterranean countries.xlsx')

