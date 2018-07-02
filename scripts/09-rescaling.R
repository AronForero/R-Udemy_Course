#instalar paquete
install.packages('scales')
library(scales)
students = read.csv('Documents/DataScience/R/data/tema1/data-conversion.csv')
#para reescalar la variable income de [0,1]
students$Income_rescaled = rescale(students$Income)
(students$Income - min(students$Income))/(max(students$Income)-min(students$Income))

#si queremos ponerlo en escala de [0,100], o en cualquier
#intervalo que se quiera se hace asi:
rescale(students$Income, to=c(0,100))

rescale_many = function(df, cols)
{
  names = names(df)
  for (col in cols)
  {
    name = paste(names[col], 'rescaled', sep='_')
    df[name] = rescale(df[,col])
  }
  cat(paste('Hemos reescalado ', length((cols)), 'variable(s)'))
  df
}

students = rescale_many(students, c(1, 4))
