#-------------- Practica 3 --------------
#-------------- Ejercicio 1 --------------

#-------------- Inciso a --------------
#Generar un vector que contenga los n´umeros del 1 al 1000. Generarlo utilizando
#un ciclo “for” y utilizando la notaci´on abreviada de R.

rm(list=ls())
#setwd("/Users/cande/Desktop/Labo/")
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

arrayb<-array(1:600,dim=c(30,20)) #array de 30 filas y 20 columnas. Tiene
#dos dimensiones. Preguntar lo de i*j
dim(arrayb)


#Ejercicio 3
#Inciso a
#calcular el producto matricial entre dos matrices A y B
rm(list=ls())
a<-c()
while(length(a)<9){
  if(length(a)>=9){
    break
  } else {
    dat<-as.numeric(readline("Ingrese numeros"))
    a<-c(a,dat)
  }
}
matriza<-matrix(data=a,nrow=3,ncol=3)

