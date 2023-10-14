# Ejercicio 8

#------------------------------------- a ---------------------------------------
#En base al programa anterior, desarrollar una funcion que reciba una serie de longitud N y
#entregue como resultado su media, valor maximo, valor mınimo y desviacion estandar. Evaluar
#el desempeno de esta funcion con la serie utilizada en el ejercicio anterior.

rm(list=ls())
setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")

temp <- scan("datos_tmedia_SABE_2010.txt",sep="")

temp[which(temp==-999)] <- NA
temp[which(temp>40)] <- NA

estadistica<- function(serie){
 # temp[which(temp==-999)] <- NA
 # temp[which(temp>40)] <- NA
 
   serie[which(serie==-999)] <- NA
   serie[which(serie>40)] <- NA
  
  media<-mean(serie, na.rm = T)
  valor_maximo<-max(serie, na.rm = T)
  valor_minimo<-min(serie, na.rm = T)
  desvio_estandar<-sd(serie, na.rm = T)
  return(list=c("Media"=media,"Maximo"=valor_maximo,"Minimo"=valor_minimo,
                "Desvio"=desvio_estandar))
}

estadistica(temp)

#------------------------------------- b ---------------------------------------
#Armar una funcion a la que se le ingrese una serie de longitud N y una cantidad de intervalos I,
#y que calcule un histograma usando I intervalos iguales que abarquen la totalidad del rango de
#la serie.






