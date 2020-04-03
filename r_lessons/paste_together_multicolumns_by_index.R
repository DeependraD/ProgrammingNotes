# # paste together dataframe columns by column index
# take the following df

df <- data.frame(my_number = letters[1:5], 
                 column_odd1 = rnorm(5), 
                 column_even1 = rnorm(5), 
                 column_odd2 = rnorm(5), 
                 column_even2 = rnorm(5), 
                 column_odd3 = rnorm(5), 
                 column_even3 = rnorm(5))

df %>% 
  select(1) %>% 
  bind_cols(data.frame(setNames(lapply(list(c(2,3), c(4, 5), c(6, 7)), function(i) 
    do.call(sprintf, c(fmt = "%0.3f (%0.3f)", # round at third place after decimal. use %s if columns were character type
                       df[i]))), c("new_column1", "new_column2", "new_column3"))))
