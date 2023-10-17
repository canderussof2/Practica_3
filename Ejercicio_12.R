#Ejercicio 12
#El archivo presiondesaturacion.txt contiene dos columnas, una con datos de temperatura 
#(◦C) y la segunda con valores de presion de saturacion para el vapor de agua (hPa) 
#correspondientes a dichas temperaturas. Armar una funcion de R que dada una temperatura 
#obtenga el valor de presion de saturacion interpolado linealmente al valor de temperatura 
#deseado a partir de los datos presentes en el archivo. Hacer que la funcion muestre un
#mensaje de advertencia y termine correctamente en el caso de que el valor de temperatura
#indicado este fuera del rango abarcado por la tabla. Comparar los resultados utilizando la
#funcion intrınseca interp1 de R.

rm(list=ls())
#setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")
setwd("/home/clinux01/Escritorio/Cande Labo Martes/Practica_3/")

datos<-read.table("presiondesaturacion.txt",col.names=c("Temperatura","Presión"))
class(datos)
funcion<-function(temperatura){
  if(temperatura<min(datos$Temperatura) | temperatura>max(datos$Temperatura)){
    warning("Los valores ingresados se encuentran fuera del rango")
  } else {
    posic_temp<-which(datos$Temperatura==temperatura)
    presion<-datos[posic_temp,2]
  }
  return(presion)
}  
  
funcion(-31.7)

rm(list=ls())
#setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")
setwd("/home/clinux01/Escritorio/Cande Labo Martes/Practica_3/")

datos<-read.table("presiondesaturacion.txt",col.names=c("Temperatura","Presión"))
class(datos)
funcion<-function(temperatura){
  if(temperatura<min(datos$Temperatura) | temperatura>max(datos$Temperatura)){
    warning("Los valores ingresados se encuentran fuera del rango")
  } else {
    presion<-datos$Presión[datos$Temperatura==temperatura] 
  }
  return(presion)
}  

funcion(-4.4)

