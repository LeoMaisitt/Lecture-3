library(purrr)                                          # I load the purrr package to the workspace to be able to use 'map_dbl()'

my_data<-c(1,3,10,2,6)                                  # I make a vector and pretend that this is my original data
v<-vector(mode="numeric",length=length(my_data))        # I initialize a new vector with the same length as 'my_data'

# Version 1
v<-map_dbl(.x=my_data,                                  # I assign the result of 'map_dbl()' to the initialized vector v
       .f=function(.x){v=.x})                           # this function - i.e. {v=.x} - assigns each element of 'my_data'
                                                        # to the corresponding element of 'v'
 
# Version 2, a shorter one with 'function(.x)' replaced by '~'
v<-map_dbl(.x=my_data,
           .f=~{v=.x})