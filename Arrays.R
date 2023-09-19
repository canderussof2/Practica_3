#---------- Práctica 19/09 ----------
rm(list=ls())
datos<-array(data = c(1:120), dim = c(5,6,4)) #Completa por columnas. 5 filas,
#6 columnas y 4 dimensiones
dim(datos)

#Por ejemplo si quiero quedarme con todos los datos del dia 2,
dia_2 <- datos[,,2] #en este caso le estoy diciendo quiero
# todas las filas, todas las columas,
# pero en la tercera dimension le digo que quiero el dia 2.
dim(dia_2)

# Queremos hacer un promedio en los dias
promedio_dias <- apply(datos, c(1,2), mean ) #Me devulve una matriz 5x6. Nos 
#hace un promedio temporal. Hacer c(3) me devolveria un valor por dia creo. 
dim(promedio_dias) 

#-------------------------------------------------------------------------------
#Ahora en vez de tener 5 longitudes (filas), 6 latitudes (columnas) y 4 dias,
# reacomodemos para que sean 30 filas (lon*lat) y 4 columnas (dias)
datos_2<- matrix(data= datos, ncol = 4, nrow = 30)

#Si ahora usamos la funcion rowMeans obtendriamos el promedio en los dias para cada lon-lat,
## y el resultados seria similar al que obtuvimos en promedio_dias
promedio_filas_datos2<- rowMeans(datos_2) #Media de las filas
promedio_filas_datos2

###############################################################################
rm(list=ls())
#Cargo mis archivos
load("/home/clinux01/Escritorio/Cande Labo Martes/Practica_3/datos_viento.RData")
load("/home/clinux01/Escritorio/Cande Labo Martes/Practica_3/datos_dimensiones_viento.RData")
datos_viento
viento
#Dimensiones:
#Primera dimensión: LONGITUDES
#Segunda dimensión: LATITUDES
#Tercera dimensión: TIEMPO
#Cuarta dimensión: NIVELES

prom_viento<-apply(viento,c(1,2,4),mean) #Me calcula el promedio para cada long,
#lat y nivel y se "olvida" de la dimens 3 (el tiempo)

#Seleccione el nivel de 850hPa y guardar en una matriz el promedio de
#temperatura sobre el dominio.
#Dominio de sudamerica. Region espacial q considero. promedio de todos los puntos.
#Sumar todo y dividir por la cant de puntos que tengo, Calcular media
prom_dic_850<-prom_viento[,,1] #Matriz de 72x89
mean(prom_dic_850)

prom_dic_200<-prom_viento[,,2]
suma<-sum(prom_dic_200)
