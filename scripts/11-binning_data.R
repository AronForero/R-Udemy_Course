students = read.csv('Documents/DataScience/R/data/tema1/data-conversion.csv')

bp = c(-Inf, 10000, 31000, Inf)
names = c('Low', 'Average', 'High')

#la funcion CUT Utiliza los rangos definidos de breaks, para inferir
#los trozos a los que pertenece cada una de las variables
#que se intentan categorizar
students$Income_cat = cut(students$Income, breaks = bp, labels = names)
students$Income_cat2 = cut(students$Income, breaks = bp)
students$Income_cat3 = cut(students$Income, breaks = 4, 
                           labels = c('lvl1', 'lvl2', 'lvl3', 'lvl4'))
# Si no se aporta el parametro LABELS, R pondra el intervalo como categoria
#Los intervalos son cerrados por la derecha

#######################################
#DUMMY VARIABLES
#######################################

install.packages('dummies')
library(dummies)

students = read.csv('Documents/DataScience/R/data/tema1/data-conversion.csv')

students_dummy = dummy.data.frame(students, sep = '_')

names(students_dummy)

#Se puede especificar el parametro ALL = FALSE para que 
#el resultado de la funcion dumy.data.frame sea un Dataframe
#SOLO con las variables dummy, quitando las variables numericas
#######################################
### Si se quisiera aplicar la funcion solo a una columna
#se le pasa solo la columna y no todo el Dataframe
#o si es para varias asi:
dummy.data.frame(students, names=c('State', 'Gender'))
