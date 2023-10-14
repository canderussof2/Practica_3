# Ejercicio 9

#El archivo t_media_EF.RData contiene un array de tipo lista con la temperatura 
#media del mes de Enero y Febrero desde 1982 a 2012 para 5 estaciones argentinas
#(usar la sentencia load(“t_media_EF.RData”) para abrirlo). La primera columna
#del array contiene el nombre de cada estacion, la segunda contiene la serie 
#para el mes de enero y la tercera para el mes de febrero. Cada fila del array 
#esta asociada a una estacion:

rm(list=ls())
setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")

load("t_media_EF.RData")

#------------------------------------- a ---------------------------------------
#Para cada estacion: Obtener la anomalıa mensual maxima de enero y el anio en que
#se alcanzo. Almacenarlo en un data frame donde la primer variable sea el nombre 
#de cada estacion, la segunda el ano de la anomalıa y la tercera dicho valor.

colnames(estaciones)<-c("Estacion","Enero","Febrero")

#for(estacion in 1:nrow(estaciones)){
 # maximo<-max(estaciones[["Enero"]])
#}