install.packages("jsonlite")
library(jsonlite)

#Para importar un archivo JSON se usa la funcion fromJSON
dat1 = fromJSON("data/tema1/students.json")
dat2 = fromJSON("data/tema1/student-courses.json")
#Para escribir un archivo JSON se puede usar la funcion toJSON

#se puede utilizar el signo $ para acceder a campos
#o a partes de un dataframe si se trata de un json
#o de una estructura compleja con varias anidaciones
dat1$Email

#metodo de busqueda
dat1[c(2,5,8),]
dat1[,c(2,5)]

head(dat1,3)
