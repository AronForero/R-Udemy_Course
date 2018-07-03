ozone_data = read.csv('data/tema1/ozone.csv',
                      stringsAsFactors = FALSE)
boxplot(ozone_data$pressure_height,
        main = 'Presure Height', #Titulo
        boxwex = 0.4) #Tamaño de la caja
#La linea de la mitad es la mediana
#y las otras lineas son los quartiles de 25% y 75%
#espacio entre los dos cuartiles RI=Rango Intercuartilico
summary(ozone_data$pressure_height)

##Ahora mes a mes
boxplot(pressure_height ~Month,
        data = ozone_data,
        main='Pressure Height per Month')

boxplot(ozone_reading ~Month,
        data = ozone_data,
        main='Ozone reading per month')$out
## Con el parametro OUT al final de la sentencia se pueden
#obtener los outliers

mtext('Hola!') #para escribir en la grafica
#se usa generalmente para escribit los outliers directamete
#en la grafica

impute_outliers = function(x, removeNA = TRUE)
{
  quantiles = quantile(x, c(0.05, 0.95), na.rm = removeNA)
  x[x<quantiles[1]] = mean(x, na.rm = removeNA)
  x[x>quantiles[2]] = median(x, na.rm = removeNA)
  x
}

imputed_data = impute_outliers(ozone_data$pressure_height)

#dos graficas asi:
par(mfrow = c(1,2))
boxplot(ozone_data$pressure_height,
        main='Presion con Outliers',
        boxwex = 1)
boxplot(imputed_data, 
        main='Presion sin Outliers',
        boxwex = 1)



replace_outliers = function(x, removeNA=TRUE){
  qrts = quantile(x, probs = c(0.25, 0.75), na.rm = removeNA)
  caps = quantile(x, probs = c(0.05, 0.95), na.rm = removeNA)
  iqr = qrts[2]-qrts[1]
  h = 1.5*iqr #tambien hay una funcion llamada iqr que devuelve el RI
  x[x<qrts[1]-h] = caps[1]
  x[x>qrts[2]+h] = caps[2]
  x
}

capped_pressure_height = replace_outliers(ozone_data$pressure_height)

par(mfrow=c(1,2)) #c(filas, columnas)
boxplot(ozone_data$pressure_height,
        main='Presion con outliers')
boxplot(capped_pressure_height,
        main='Presion sin outliers')
