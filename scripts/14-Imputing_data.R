library(mice)
housing_data = read.csv('data/tema1/housing-with-missing-value.csv',
                   header = TRUE,
                   stringsAsFactors = FALSE)

columns = c('ptratio', 'rad')
imputed_data = mice(housing_data[,names(housing_data)%in%columns],
                    m = 5,
                    maxit = 50,
                    method = 'pmm',
                    seed = 2018)

imputed_data_1 = mice(housing_data[,columns],
                    m = 5,
                    maxit = 50,
                    method = 'pmm',
                    seed = 2018)
## Al parecer es lo mismo, poner el vector con los nombres de las columnas
#que hacer el %in% bla bla
###################################
#Otros algoritmos usuales:
#pmm = Comparacion predictiva de medias
#logreg = regresion logistica
#polyreg = '''' politomica
#polr = modelo de probabilidades proporcionales
###################################

summary(imputed_data)
summary(imputed_data_1)

complete_data = mice::complete(imputed_data)

housing_data$ptratio = complete_data$ptratio
housing_data$rad = complete_data$rad

anyNA(housing_data) #ver que tantos NA hay
