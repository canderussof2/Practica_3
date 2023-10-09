#---------- EJERCICIO PARA ENTREGAR PRACTICA 3 ----------
#---------------------------------  Punto 1 ---------------------------------

#Consideraciones previas

#seteo mi  directorio de trabajo y limpio el environment
rm(list=ls())
setwd("/Users/cande/Desktop/Labo/Practica_3/")

#Cargo mis datos
datos_azul<-read.table("AZUL.txt",col.names=c("Codigo de identificación","Fecha","Temperatura","Temperatura de Rocio","Presión")) 
datos_catamarca<-read.table("CATAMARCA.txt",col.names=c("Codigo de identificación","Fecha","Temperatura","Temperatura de Rocio","Presión")) 
datos_aeroparque<-read.table("AEROPARQUE.txt",col.names=c("Codigo de identificación","Fecha","Temperatura","Temperatura de Rocio","Presión")) 
datos_chilecito<-read.table("CHILECITO.txt",col.names=c("Codigo de identificación","Fecha","Temperatura","Temperatura de Rocio","Presión")) 
datos_iguazu<-read.table("IGUAZU.txt",col.names=c("Codigo de identificación","Fecha","Temperatura","Temperatura de Rocio","Presión")) 
datos_mendoza<-read.table("MENDOZA.txt",col.names=c("Codigo de identificación","Fecha","Temperatura","Temperatura de Rocio","Presión")) 

#Defino el dato faltante para despues convertirlo a NA para y no interfiera en 
#las cuentas
dato_faltante<- -999.9
datos_azul[which(datos_azul== dato_faltante)] <- NA
datos_catamarca[which(datos_catamarca== dato_faltante)] <- NA
datos_aeroparque[which(datos_aeroparque== dato_faltante)] <- NA
datos_chilecito[which(datos_chilecito== dato_faltante)] <- NA
datos_iguazu[which(datos_iguazu== dato_faltante)] <- NA
datos_mendoza[which(datos_mendoza== dato_faltante)] <- NA

#Para convertir la temperatura y temperatura de rocio de grados Farenheit (°F) a 
#grados Centigrados (°C) armo una funcion que lo haga

temp_faren_a_cent <- function (Temperatura) {
  t <- (Temperatura - 32) * 5/9
  return(t)
}
datos_azul$Temperatura<- temp_faren_a_cent(datos_azul$Temperatura) 
datos_azul$Temperatura.de.Rocio <- temp_faren_a_cent(datos_azul$Temperatura.de.Rocio)
datos_catamarca$Temperatura<- temp_faren_a_cent(datos_catamarca$Temperatura) 
datos_catamarca$Temperatura.de.Rocio <- temp_faren_a_cent(datos_catamarca$Temperatura.de.Rocio)
datos_aeroparque$Temperatura<- temp_faren_a_cent(datos_aeroparque$Temperatura) 
datos_aeroparque$Temperatura.de.Rocio <- temp_faren_a_cent(datos_aeroparque$Temperatura.de.Rocio)
datos_chilecito$Temperatura<- temp_faren_a_cent(datos_chilecito$Temperatura) 
datos_chilecito$Temperatura.de.Rocio <- temp_faren_a_cent(datos_chilecito$Temperatura.de.Rocio)
datos_iguazu$Temperatura<- temp_faren_a_cent(datos_iguazu$Temperatura) 
datos_iguazu$Temperatura.de.Rocio <- temp_faren_a_cent(datos_iguazu$Temperatura.de.Rocio)
datos_mendoza$Temperatura<- temp_faren_a_cent(datos_mendoza$Temperatura) 
datos_mendoza$Temperatura.de.Rocio <- temp_faren_a_cent(datos_mendoza$Temperatura.de.Rocio)


#Datos generales de cada estacion
datos_estaciones<-as.list(read.table("estaciones.txt"))

#Modifico mi lista para agregarle los datos de Mendoza
e<-c("AZUL","AEROPARQUE","CATAMARCA","CHILECITO","IGUAZU","MENDOZA")
datos_estaciones[[1]]<-e
lat<-c(-36.8,-34.6,-28.6,-29.2,-25.7,-32.8)
datos_estaciones[[2]]<-lat
long<-c(-59.9,-58.4,-65.8,-67.4,-54.5,-68.8)
datos_estaciones[[3]]<-long
alt<-c(146, 6, 454,1250, 270,746)
datos_estaciones[[4]]<-alt
names(datos_estaciones)<-c("Estacion","Latitud", "Longitud", "Altura")
datos_estaciones<-as.data.frame(datos_estaciones)

#Quiero quedarme con datos puntuales
#AZUL
nombre_azul<-datos_estaciones[1,1]
lat_azul<-datos_estaciones[1,2]
long_azul<-datos_estaciones[1,3]
alt_azul<-datos_estaciones[1,4]
data_azul<-list(nombre_azul,lat_azul,long_azul,alt_azul) 
azul<-list("Estacion"=data_azul,"Datos"=datos_azul) #Lista de Azul

#CATAMARCA
nombre_catamarca<-datos_estaciones[2,1]
lat_catamarca<-datos_estaciones[2,2]
long_catamarca<-datos_estaciones[2,3]
alt_catamarca<-datos_estaciones[2,4]
data_catamarca<-list(nombre_catamarca,lat_catamarca,long_catamarca,alt_catamarca) 
catamarca<-list("Estacion"=data_catamarca,"Datos"=datos_catamarca) #Lista de Catamarca

#AEROPARQUE
nombre_aeroparque<-datos_estaciones[3,1]
lat_aeroparque<-datos_estaciones[3,2]
long_aeroparque<-datos_estaciones[3,3]
alt_aeroparque<-datos_estaciones[3,4]
data_aeroparque<-list(nombre_aeroparque,lat_aeroparque,long_aeroparque,alt_aeroparque) 
aeroparque<-list("Estacion"=data_aeroparque,"Datos"=datos_aeroparque) #Lista de Aeroparque

#CHILECITO
nombre_chilecito<-datos_estaciones[4,1]
lat_chilecito<-datos_estaciones[4,2]
long_chilecito<-datos_estaciones[4,3]
alt_chilecito<-datos_estaciones[4,4]
data_chilecito<-list(nombre_chilecito,lat_chilecito,long_chilecito,alt_chilecito) 
chilecito<-list("Estacion"=data_chilecito,"Datos"=datos_chilecito) #Lista de Chilecito

#IGUAZU
nombre_iguazu<-datos_estaciones[5,1]
lat_iguazu<-datos_estaciones[5,2]
long_iguazu<-datos_estaciones[5,3]
alt_iguazu<-datos_estaciones[5,4]
data_iguazu<-list(nombre_iguazu,lat_iguazu,long_iguazu,alt_iguazu) 
iguazu<-list("Estacion"=data_iguazu,"Datos"=datos_iguazu) #Lista de Iguazu

#MENDOZA
nombre_mendoza<-datos_estaciones[6,1]
lat_mendoza<-datos_estaciones[6,2]
long_mendoza<-datos_estaciones[6,3]
alt_mendoza<-datos_estaciones[6,4]
data_mendoza<-list(nombre_mendoza,lat_mendoza,long_mendoza,alt_mendoza) 
mendoza<-list("Estacion"=data_mendoza,"Datos"=datos_mendoza) #Lista de Mendoza

todo<-list(azul,catamarca,aeroparque,chilecito,iguazu,mendoza)

#Ordeno mi environment
rm(list="alt_aeroparque","alt_azul","alt_catamarca","alt_chilecito","alt_iguazu","alt_mendoza")
rm(list="lat_aeroparque","lat_azul","lat_catamarca","lat_chilecito","lat_iguazu","lat_mendoza")
rm(list="long_aeroparque","long_azul","long_catamarca","long_chilecito","long_iguazu","long_mendoza")
rm(list="nombre_aeroparque","nombre_azul","nombre_catamarca","nombre_chilecito","nombre_iguazu","nombre_mendoza")
rm(list="alt","e","lat","long")
rm(list="datos_aeroparque","datos_azul","datos_catamarca","datos_chilecito","datos_iguazu","datos_mendoza")
rm(list="data_aeroparque","data_azul","data_catamarca","data_chilecito","data_iguazu","data_mendoza")
rm(list="aeroparque","azul","catamarca","chilecito","iguazu","mendoza")




#---------------------------------  Punto 2 ---------------------------------
#---------------------------------  Inciso i ---------------------------------
#---------------------------------  Inciso ii ---------------------------------

#---------------------------------  Inciso iii ---------------------------------
guardado <- function (x) {
  save(x, file = "DatosEstaciones.RData") 
}
guardado(datos)
