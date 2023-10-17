# Ejercicio 10

rm(list=ls())
#setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")
setwd("/home/clinux01/Escritorio/Cande Labo Martes/Practica_3/")
#Generar una celda con 10 elementos, donde cada elemento sea un nombre propio. 
#Armar una funcion que permita ingresar una lista con nombres (de cualquier dimension) 
#y una letra, y que devuelva una lista que contenga todos los nombres contenidos 
#en la celda original que comiencen con dicha letra.

nombres<-c("Candelaria","Camila","Eliana","Maite","Agustín","Luke","Esteban","Gabriela","Matias","Juliana")

letras<-0
matcheo<-0
funcion<-function(lista) {
  letra<-readline("Ingrese la letra ")
  # for(letra in 1:length(lista)){ #Me da un vector
  for (letra in lista){ 
  matcheo[letra]<-match(lista,letra)
  }
  #if(letra==matcheo){
   # letras[letra]<-letra
  #}
  #return(letras)
  return(matcheo)
}
funcion(nombres)

