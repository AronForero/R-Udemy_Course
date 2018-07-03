data = read.csv('data/tema2/auto-mpg.csv',
                header = TRUE,
                stringsAsFactors = FALSE)
data$cylinders = factor(data$cylinders,
                        levels = c(3,4,5,6,8),
                        labels = c('3cil', '4cil', '5cil', '6cil', '8cil'))

summary(data)
summary(data$cylinders)
summary(data$mpg)


str(data)
str(data$cylinders)

#Para nuevas medidas estadisticas
install.packages(c('modeest', 'raster', 'moments'))
library(modeest) #moda
library(raster) #Quantiles, Coef-variacion
library(moments) #Coef-asimetria, coef-curtosis

######MEDIDAS DE CENTRALIZACION

X = data$mpg

mean(X)
median(X)
mfv(X) #Most Frecuent Value / Moda
quantile(X)

###### MEDIDAS DE DISPERSION

var(X) #Varianza
sd(X) #Desviacion estandar
cv(X) #Coeficiente de variacion

###### MEDIDAS DE ASIMETRIA

skewness(X) #Asimetria de Fisher
kurtosis(X) 


hist(X)
## Con esto se ve lo que decian los
#coeficientes hallados anteriormente
