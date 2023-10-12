# ------- EJERCICIO 7 -------
rm(list=ls())
#setwd("/Users/cande/Desktop/Labo/Practica_3/")
#setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")
setwd("/home/clinux01/Escritorio/Cande Labo Jueves/Practica_3/")

#El archivo “datos tmedia SABE 2010.txt�? contiene la serie de temperaturas medias diarias de la
#estacion Aeroparque correspondiente al 2010. Utilizando el comando “scan�? cargar los datos en una
#variable de R.


temp <- scan("datos_tmedia_SABE_2010.txt",sep="")

# -------------------------- a --------------------------
#Dado que se trata de temperaturas medias mensuales para la Ciudad de Buenos Aires, valores
#superiores a 40◦C son, muy probablemente, erroneos de acuerdo con el comportamiento 
#climatologico de esta variable. Disenar y programar un algoritmo que identifique la posicion dentro
#de la serie de los dıas donde el valor de la temperatura media supera los 40◦C, pero que ademas
#muestre el valor del dıa anterior y del dıa siguiente. Obtener la cantidad total de elementos
#erroneos.

valor_erroneos <- print(temp[which(temp>40)])
ant_post<-c()
for (valor in valor_erroneos) {
      ant_post<-paste(temp[which(temp>40)-1],temp[which(temp>40)+1] )
    }
print(ant_post)
cant_erroneos<- print(paste("La cantidad de valores erroneos es",length(valor_erroneos)))

valor_erroneos <- print(temp[which(temp>40)])
valor_ant_erroneos <- print(temp[which(temp>40)-1])
valor_post_erroneos <- print(temp[which(temp>40)+1])
posic_erroneos <- print(which(temp>40))
posic_ant_erroneos <- print(which(temp>40)-1)
posic_post_erroneos <- print(which(temp>40)+1)

# -------------------------- b --------------------------
#Calcular el valor maximo y el mınimo de la serie teniendo en cuenta los puntos erroneos y sin
#tenerlos en cuenta. Calcular la cantidad total de datos faltantes. Remover los elementos faltantes
#y los erroneos de la serie de temperatura.

maximo_con_erroneos<-max(temp)
minimo_con_erroneos<-min(temp)

temp[which(temp>40)]<- NA
temp[which(temp==-999)]<- NA

for(valores in temp){
if(is.na(valores)){
  next
}
   maximo_sin_erroneos<-max(temp, na.rm=T)
   minimo_sin_erroneos<-min(temp,na.rm=T)
 }
print(maximo_sin_erroneos)
print(minimo_sin_erroneos)

# -------------------------- c --------------------------
#Ordenar la serie de menor a mayor y calcular su mediana
ordenados<-sort(temp)
mediana<- median(ordenados,na.rm=T) #Cual es la diferencia de ponerlo con NA y sin

# -------------------------- d --------------------------
#Generar una serie de medias semanales a partir de los datos medios diarios
media_semanal<-c()
semana<-c()
media_semana<-c()
x<-seq(1,365,by=7)
for(valores in x) {
  semana<-temp[valores:(valores+6)]
  media_semanal<-mean(semana,na.rm=T)
  media_semana<-c(media_semana,media_semanal)
}

# -------------------------- e --------------------------
#Dividir el rango de la variable en N intervalos de igual longitud y calcular el numero de elementos de la serie que cae dentro de cada intervalo. Repetir el ejercicio utilizando la funcion intr??nseca �hist�.

x<-seq(1,365,by=5)
valores_cada_5<-c()
for(valores in x) {
  igual_long<-ordenados[valores:(valores+4)]
  valores_cada_5<-c(valores_cada_5,igual_long)
}

plot(valores_cada_5)
hist(temp,5)
  
