family_salary = c(40000, 60000, 50000, 80000, 60000, 70000, 60000)
famili_size = c(4, 3, 2, 2, 3, 4, 3)
family_car = c('Lujo', 'Compacto', 'Utilitario', 'Lujo',
               'Compacto', 'Compacto', 'Compacto')
family = data.frame(family_salary, famili_size, family_car)

unique(family) #Una manera de eliminar duplicaciones
#devuelve el objeto del mismo tipo sin duplicaciones

family_unique = unique(family)

#Para ver esas duplicaciones sin eliminarlas
duplicated(family) #devuelve un vector de True/False
#True si es duplicado de alguno, y false si no

family[duplicated(family),]
