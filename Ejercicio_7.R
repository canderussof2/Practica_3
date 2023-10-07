# ------- EJERCICIO 7 -------
rm(list=ls())
setwd("/Users/cande/Desktop/Labo/Practica_3/")

#El archivo “datos tmedia SABE 2010.txt” contiene la serie de temperaturas medias diarias de la
#estacion Aeroparque correspondiente al 2010. Utilizando el comando “scan” cargar los datos en una
#variable de R.


temp <- scan("datos_tmedia_SABE_2010.txt",sep="")

# -------------------------- a --------------------------
#Dado que se trata de temperaturas medias mensuales para la Ciudad de Buenos Aires, valores
#superiores a 40◦C son, muy probablemente, erroneos de acuerdo con el comportamiento 
#climatologico de esta variable. Disenar y programar un algoritmo que identifique la posicion dentro
#de la serie de los dıas donde el valor de la temperatura media supera los 40◦C, pero que ademas
#muestre el valor del dıa anterior y del dıa siguiente. Obtener la cantidad total de elementos
#erroneos.


posic_erroneos <- which(temp>40)
erroneos <- temp[which(temp>40)] 
cant_erroneos <- print(length(erroneos))
valores <- c()  
for (valor in erroneos) {
    valores<-print(paste(temp[valor-1],temp[valor+1]))
}

#dar algo da, pero no da lo que deberia 
for (valor in temp) {
  if(valor == 40.55) 
  valores<-print(paste(temp[valor-1],temp[valor+1]))
}







