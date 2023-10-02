#-------------- Practica 3 --------------
#-------------- Ejercicio 1 --------------

#-------------- Inciso a --------------
#Generar un vector que contenga los numeros del 1 al 1000. Generarlo utilizando
#un ciclo “for” y utilizando la notacion abreviada de R.

rm(list=ls())
setwd("/Users/cande/Desktop/Labo/Practica_3/")
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
rm(list=ls())
arrayb<-array(1:600,dim=c(30,20))

for (i in 1:30) { #recorre filas
  for(j in 1:20) { #recorre columnas
    arrayb[i,j]<-i*j
  }
}
dim(arrayb)

#-------------- Inciso c --------------
#Generar la misma matriz del punto anterior pero como producto punto a punto de dos matrices.
rm(list=ls())
matriz_a<-matrix(data=1:30,nrow=30,ncol=1) 
matriz_b<-matrix(data=1:20,nrow=1,ncol=20)


for (i in matriz_a){
  for(j in matriz_b){
    matriz[i,j]<-i*j  #COMO HACER ESTA LINEA
  }
}

#-------------- Inciso d --------------
#Guardar la quinta columna del array mencionado en el punto anterior en un vector B

B<-c[,5]
#-------------- Inciso e --------------
#Generar un array de tres dimensiones. Si i, j y k son los subındices que 
#identifican la posicion de cada componente del array, el valor de cada componente 
#debe ser igual al producto de i*j* k.
rm(list=ls())
array_e<-array(data=1:6000,dim=c(20,30,10))
for(i in 1:nrow(array_e)) {
  for(j in 1:ncol(array_e)) {
    for (k in 1:10) {
      array_e[i,j,k]<-i*j*k
    }
  }
}
print(array_e)

tiempo_4<-array_e[,,4]


#Generar un array de dos dimensiones que contenga la componente k=4 del array de tres
#dimensiones. (El tamano de la matriz en cada una de las dimensiones debe ser 20, 30 y 10
#respectivamente).

matriz_e<-matrix(data=tiempo_4,nrow=20,ncol=30)

