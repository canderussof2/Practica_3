#-------------- Practica 3 --------------
#-------------- Ejercicio 1 --------------

#-------------- Inciso a --------------
#Generar un vector que contenga los n´umeros del 1 al 1000. Generarlo utilizando
#un ciclo “for” y utilizando la notaci´on abreviada de R.

rm(list=ls())
setwd("/Users/cande/Desktop/Labo/")
vector<-c() #vector vacio
for(i in seq(1:1000)){
numero<-1:1000
vector<-c(vector,numero)
}
print(vector)

#-------------- Inciso b --------------
#Generar un array de dos dimensiones que tenga 20 columnas y 30 filas. La 
#componente correspondiente a la fila i, columna j del array debe tener el 
#resultado del producto de i*j.

arrayb<-array(dim=c(30,20)) #array de 30 filas y 20 columnas. Me lo completa con
#NA 

