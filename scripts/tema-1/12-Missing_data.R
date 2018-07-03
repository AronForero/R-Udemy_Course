housing_na = read.csv('Documents/DataScience/R/data/tema1/housing-with-missing-value.csv',
                      header=TRUE, 
                      stringsAsFactors = FALSE)
summary(housing_na)

#OPTION 1-> na.omit()
##Eliminar las obsrvaciones que tengan NA pueden dar lugar
#a variaciones en el modelo de datos que se pueda crear

#OPTION 2 -> Eliminar las observaciones que tienen NA en alguna o algunas columnas
drop_na = c('rad')
housing_data_2 = housing_na[
    complete.cases(housing_na[,!(names(housing_na))%in% drop_na])
    ,]

summary(housing_data_2)
#Mantiene los NA de la columna rad pero elimina
#las rows que contienen algun valor NA de las demas columnas

##OPTION 3 -> Eliminar toda una columna
#housing_na$rad = NULL
#esa sentencia hara desaparecer a la columna
#Para eliminar varias columnas:
drops = c('rad', 'ptratio')
housing_data_3 = housing_na[,!(names(housing_na)%in%drops)]

summary(housing_data_3)


############################################
#NO ELIMINANDO SINO COMPLETANDO
############################################

install.packages('Hmisc')
library(Hmisc)

housing_data = read.csv('Documents/DataScience/R/data/tema1/housing-with-missing-value.csv',
                        header = TRUE,
                        stringsAsFactors = FALSE)
housing_data_copy = housing_data
housing_data_copy$ptratio = impute(housing_data_copy$ptratio, mean)
housing_data_copy$rad = impute(housing_data_copy$rad, mean)
summary(housing_data_copy)

housing_data_copy2 = housing_data
housing_data_copy2$ptratio = impute(housing_data_copy2$ptratio, median)
housing_data_copy2$rad = impute(housing_data_copy2$rad, median)
summary(housing_data_copy2)

housing_data_copy3 = housing_data
housing_data_copy3$ptratio = impute(housing_data_copy3$ptratio, 18)
housing_data_copy3$rad = impute(housing_data_copy3$rad, 7)
summary(housing_data_copy3)
 
#Impute ayuda mucho al reemplazar los valores NA sin tener que
#ingresar directamente a los index de las rows

##########################################
##########################################
##########################################
##########################################

install.packages('mice')
library(mice)

md.pattern(housing_data)

install.packages('VIM')
library(VIM)

aggr(housing_data,
     col = c('green', 'red'),
     numbers = TRUE,
     sortVars=TRUE,
     labels = names(housing_data),
     cex.axis = 0.75, #tamaño de letra de los labels
     gap=1,#espacio entre graficas
     ylab=c('Histograma de Nas', 'Patron'))#cambio de nombres a las variables

