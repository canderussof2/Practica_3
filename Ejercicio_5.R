#Ejercicio 5

#a) Se tienen datos de temperatura tomados cada 3 horas en una estacion de superficie comenzando
#a las 00 y terminando a las 21 (serie <-c( 25, 20, 18, 22, 27, 31, 32, 28)). Armar un script de
#R que permita ingresar la serie de datos por pantalla, la guarde en un vector y muestre por
#pantalla la hora en la que ocurrio el maximo valor medido y el valor de la temperatura maxima
#medida.
getwd()
setwd("/Users/cande/Desktop/Labo/Practica_3/")
#setwd("/home/clinux01/Escritorio/Cande /Practica_3/")
rm(list=ls())

temperatura<-c()
horas<-seq(0,21,by=3)

for (temp in horas){
  t<-as.numeric(readline("Ingrese la temperatura: "))
  while (is.na(t)){
    t<-as.numeric(readline("Ingrese nuevamente la temperatura: "))
  } 
  temperatura<-c(temperatura,t)
}
max<-max(temperatura) #Valor maximo de temperatura
posicmax<-which(temperatura==max) #posicion donde se da la maxima temp
tempmax<-temperatura[which(temperatura==max)] #Valor maximo de temperatura
horamax<-horas[which.max(temperatura)] 
print(paste("La mayor temperatura registrada fue de",tempmax,"°C y ocurrió a las",horamax,"horas"))








