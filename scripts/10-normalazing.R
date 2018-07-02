housing = read.csv('Documents/DataScience/R/data/tema1/BostonHousing.csv')
#para escalar a Z, la normal
housing_Z = scale(housing)
#tiene dos parametros, center es para restar la media, y scale es
#para dividir por la desviacion
#housing_none = scale(housing, center=TRUE, scale = TRUE)

scale_many = function(df, cols){
  names = names(df)
  for(col in cols){
    name = paste(names[col], 'Z', sep='_')
    df[name] = scale(df[,col])
  }
  cat(paste('hemos normalizado ', length(cols), 'variable(s)'))
  df
}

housing = scale_many(housing, c(1, 3, 5:8))
