#Ejercicio 3
#Inciso a. Preguntar
#calcular el producto matricial entre dos matrices A y B. Verificar los
#resultados utilizando la funcion “%*%” para el producto de arrays en R

setwd("/Users/cande/Desktop/Labo/Practica_3/")
rm(list=ls())

matriz_a<-matrix(data=1:9, nrow=3,ncol=3)
matriz_b<-matrix(data=1:9,nrow=3,ncol=3, byrow=T)

for(i in matriz_a){
  for(j in matriz_b) {
    
    
    
  }
}







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