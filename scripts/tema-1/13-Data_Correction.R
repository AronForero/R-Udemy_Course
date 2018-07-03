install.packages('tidyr')
library(tidyr)

crime_data = read.csv('data/tema1/USArrests.csv', 
                      stringsAsFactors = FALSE)
#View(DataFrame) Funcion para visualizar el objeto
#es lo mismo que dar click en el espacio de la derecha


#Añadir una o mas columnas asi:
crime_data = cbind(state = rownames(crime_data), crime_data)
#Anotacion personal: row.names y rownames es lo mismo D:
###########################################
###########################################
###########################################
#Realmente lo que hace es colapsar columnas
#de tener 3 columnas, las metio en una sola y quedo guardado en lo siguiente:
crime_data_1 = gather(crime_data,
                      key = 'crime_type',
                      value = 'arrest_estimate',
                      Murder : UrbanPop)

crime_data_2 = gather(crime_data,
                      key = 'crime_type',
                      value = 'arrest_estimate',
                      -state)
crime_data_3 = gather(crime_data,
                      key = 'crime_type',
                      value = 'arrest_estimate',
                      Murder, Assault)

###########################################
#LA FUNCION CONTRARIA DE GATHER :
###########################################
crime_data_4 = spread(crime_data_2, 
                      key='crime_type',
                      value='arrest_estimate')

###########################################
#FUNCION UNITE: Unifica, pega... Dos columnas
#y las separa con lo que uno quiera
###########################################
crime_data_5 = unite(crime_data,
                     col = 'Murder_Assault',
                     Murder, Assault,
                     sep = '_')

###########################################
#SE puede volver a separar algo que se unio con UNITE
###########################################
crime_data_6 = separate(crime_data_5,
                        col = 'Murder_Assault',
                        into = c('Murder', 'Assault'),
                        sep = '_')
