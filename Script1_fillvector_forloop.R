
 my_data<-c(1,3,10,2,6)                               # I make a vector and pretend that this is my original data
 v<-vector(mode="numeric",length=length(my_data))     # I initialize a new vector with the same length as 'my_data'

 
 for(i in 1:length(my_data))                          # This is the 'counter' that sets the range of the index (i) values
                                                      # i starts from 1 and goes up to 'length(my_data)' (it is 5)
   
   {
   
  v[i]=my_data[i]                                     # The value of the element in 'my_data' at index i gets assigned to
                                                      # to the element at index i in 'v'
 }


