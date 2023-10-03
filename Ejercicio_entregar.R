#---------- EJERCICIO PARA ENTREGAR PRACTICA 3 ----------

#seteo mi  directorio de trabajo y limpio el environment
rm(list=ls())
setwd("/home/clinux01/Escritorio/Cande/Practica_3/")

#Armar una lista de listas (array de listas) que contenga los datos 
#correspondientes a cada estacion como as?? tambien informacion asociada a cada
#estacion en particular: nombre, latitud, longitud, altura y codigo de
#identificacion. Convertir los valores de temperatura y temperatura de roc??o
#a grados cent??grados. La informacion sobre la ubicacion de cada estacion esta
#disponible en el archivo estaciones.txt.

#Primero, creo cada lista por separado
datos_azul<-read.table("/home/clinux01/Escritorio/Cande/Practica_3/AZUL.txt") #Cargo los datos
azul<-as.list(datos_azul) #creo la lista
names(azul)<-c("Codigo de identificacion", "Fecha (YYYYMMDD)", "Temperatura", 
                "Temperatura de rocio", "Presion" ) #Agrego nombre a los elementos 

datos_catamarca<-read.table("/home/clinux01/Escritorio/Cande/Practica_3/CATAMARCA.txt") 
catamarca<-as.list(datos_catamarca)
names(catamarca)<-c("Codigo de identificacion", "Fecha (YYYYMMDD)", "Temperatura", 
               "Temperatura de rocio", "Presion" )

datos_aeroparque<-read.table("/home/clinux01/Escritorio/Cande/Practica_3/AEROPARQUE.txt") 
aeroparque<-as.list(datos_aeroparque)
names(aeroparque)<-c("Codigo de identificacion", "Fecha (YYYYMMDD)", "Temperatura", 
               "Temperatura de rocio", "Presion" )

datos_chilecito<-read.table("/home/clinux01/Escritorio/Cande/Practica_3/CHILECITO.txt") 
chilecito<-as.list(datos_chilecito)
names(chilecito)<-c("Codigo de identificacion", "Fecha (YYYYMMDD)", "Temperatura", 
               "Temperatura de rocio", "Presion" )

datos_iguazu<-read.table("/home/clinux01/Escritorio/Cande/Practica_3/IGUAZU.txt") 
iguazu<-as.list(datos_iguazu)
names(iguazu)<-c("Codigo de identificacion", "Fecha (YYYYMMDD)", "Temperatura", 
               "Temperatura de rocio", "Presion" )

datos_mendoza<-read.table("/home/clinux01/Escritorio/Cande/Practica_3/MENDOZA.txt") 
mendoza<-as.list(datos_mendoza)
names(mendoza)<-c("Codigo de identificacion", "Fecha (YYYYMMDD)", "Temperatura", 
               "Temperatura de rocio", "Presion" )





