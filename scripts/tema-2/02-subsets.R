data = read.csv('data/tema2/auto-mpg.csv',
                stringsAsFactors = F)

#Index by position
#maneras de hacer subconjuntos
data[1:5,8:9]
data[1:5, c(8,9)]

#Index by Name
data[1:5,c('model_year', 'car_name')]

#Min/Max de mpg
data[data$mpg == max(data$mpg) | data$mpg == min(data$mpg),]

#Filtros con condiciones
data[data$mpg>30 & data$cylinders == 6,c('car_name', 'mpg')]

data[data$mpg>30 & data$cyl == 6, c('car_name', 'mpg')]


##SUBSET

subset(data, mpg>30 & cylinders == 6, select = c('car_name', 'mpg'))


### FALLOS TIPICOS
data[data$mpg>30] #olvidar la coma para indicar las columnas


## EXCLUIR COLUMNAS
data[1:5, c(-1,-9)]
data[1:5, -c(1,9)]
#pero no funciona si se indica el nombre
data[1:5, -c('No', 'car_name')]
#la manera de hacer es esta
data[1:5, !names(data) %in% c('No', 'car_name')]

data[data$mpg %in% c(15,20), c('car_name', 'mpg')]

data[1:2, c(F, F, T)] #si solo se indican 3 columnas el extrapola ciclicamente las demas
#tambien se puede hacer con las filas
data[c(F,F,F,F,T), c(F,F,T)]



