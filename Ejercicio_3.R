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