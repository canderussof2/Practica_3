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
data_azul<-list("Nombre"=nombre_azul,"Latitud"=lat_azul,"Longitud"=long_azul,"Altura"=alt_azul) 
azul<-list("Estacion"=data_azul,"Datos"=datos_azul) #Lista de Azul

#CATAMARCA
nombre_catamarca<-datos_estaciones[2,1]
lat_catamarca<-datos_estaciones[2,2]
long_catamarca<-datos_estaciones[2,3]
alt_catamarca<-datos_estaciones[2,4]
data_catamarca<-list("Nombre"=nombre_catamarca,"Latitud"=lat_catamarca,"Longitud"=long_catamarca,"Altura"=alt_catamarca) 
catamarca<-list("Estacion"=data_catamarca,"Datos"=datos_catamarca) #Lista de Catamarca

#AEROPARQUE
nombre_aeroparque<-datos_estaciones[3,1]
lat_aeroparque<-datos_estaciones[3,2]
long_aeroparque<-datos_estaciones[3,3]
alt_aeroparque<-datos_estaciones[3,4]
data_aeroparque<-list("Nombre"=nombre_aeroparque,"Latitud"=lat_aeroparque,"Longitud"=long_aeroparque,"Altura"=alt_aeroparque) 
aeroparque<-list("Estacion"=data_aeroparque,"Datos"=datos_aeroparque) #Lista de Aeroparque

#CHILECITO
nombre_chilecito<-datos_estaciones[4,1]
lat_chilecito<-datos_estaciones[4,2]
long_chilecito<-datos_estaciones[4,3]
alt_chilecito<-datos_estaciones[4,4]
data_chilecito<-list("Nombre"=nombre_chilecito,"Latitud"=lat_chilecito,"Longitud"=long_chilecito,"Altura"=alt_chilecito) 
chilecito<-list("Estacion"=data_chilecito,"Datos"=datos_chilecito) #Lista de Chilecito

#IGUAZU
nombre_iguazu<-datos_estaciones[5,1]
lat_iguazu<-datos_estaciones[5,2]
long_iguazu<-datos_estaciones[5,3]
alt_iguazu<-datos_estaciones[5,4]
data_iguazu<-list("Nombre"=nombre_iguazu,"Latitud"=lat_iguazu,"Longitud"=long_iguazu,"Altura"=alt_iguazu) 
iguazu<-list("Estacion"=data_iguazu,"Datos"=datos_iguazu) #Lista de Iguazu

#MENDOZA
nombre_mendoza<-datos_estaciones[6,1]
lat_mendoza<-datos_estaciones[6,2]
long_mendoza<-datos_estaciones[6,3]
alt_mendoza<-datos_estaciones[6,4]
data_mendoza<-list("Nombre"=nombre_mendoza,"Latitud"=lat_mendoza,"Longitud"=long_mendoza,"Altura"=alt_mendoza) 
mendoza<-list("Estacion"=data_mendoza,"Datos"=datos_mendoza) #Lista de Mendoza

estaciones<-list(azul,catamarca,aeroparque,chilecito,iguazu,mendoza)
names(estaciones)<-c("Azul","Catamarca","Aeroparque","Chilecito","Iguazu","Mendoza")

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
resumen<-function(lista){
  nombres <- c()
  fecha_inicial <- c()
  fecha_final <- c()
  mean_T <- c()
  mean_Tr <- c()
  desv_est_T <- c()
  desv_est_Tr <- c()
  max_T <- c()
  min_T <- c()
  max_Tr <- c()
  min_Tr <- c()
  #i es estacion
  #j puede ser Datos o Ubicacion
  #k puede ser cualquier elemento dentro de Datos o Ubicacion
   for (estacion in 1:length(lista)){
    for (dat_ubic in 1:length(lista [[estacion]] [] )) { 
      for (elemento in names(lista [[estacion]] [[dat_ubic]] [])) {
          if (elemento == "Fecha"){
          fecha_inicial[estacion] <- lista[[estacion]][[dat_ubic]][[elemento]][1]
          fecha_final[estacion]<- lista[[estacion]][[dat_ubic]][[elemento]][length(lista [[estacion]] [[dat_ubic]] [[elemento]][])]
        }
        else if (elemento == "Temperatura"){
          mean_T [estacion]<- mean(lista[[estacion]][[dat_ubic]][[elemento]][],na.rm=T)
          desv_est_T [estacion] <- sd(lista[[estacion]][[dat_ubic]][[elemento]][],na.rm=T)
          max_T [estacion]  <- max(lista[[estacion]][[dat_ubic]][[elemento]][],na.rm=T)
          min_T [estacion] <- min(lista[[estacion]][[dat_ubic]][[elemento]][],na.rm=T)
        }
        else if (elemento == "Temperatura.de.Rocio"){
          mean_Tr [estacion] <- mean(lista[[estacion]][[dat_ubic]][[elemento]][],na.rm=T)
          desv_est_Tr [estacion] <- sd(lista[[estacion]][[dat_ubic]][[elemento]][],na.rm=T)
          max_Tr [estacion]  <- max(lista[[estacion]][[dat_ubic]][[elemento]][],na.rm=T)
          min_Tr [estacion] <- min(lista[[estacion]][[dat_ubic]][[elemento]][],na.rm=T)
        }
      }
    }
   }
  
 resumen_estadistica <- data.frame("Fecha inicial"= fecha_inicial,
                                    "Fecha final"= fecha_final,"Media de temperatura"= mean_T,
                                    "Desvio estandar de temperatura"= desv_est_T, 
                                    "Máximo de temperatura"= max_T,"Minimo de temperatura"= min_T,
                                    "Media de temperatura de rocio"= mean_Tr,
                                    "Desvio estandar de temperatura de rocio"= desv_est_Tr, 
                                    "Máximo de temperatura de rocio"= max_Tr,
                                    "Minimo de temperatura de rocio"= min_Tr,
                                   row.names=c("Azul","Catamarca","Aeroparque","Chilecito",
                                               "Iguazu","Mendoza"))

   return(resumen_estadistica)
}

resumen()

#---------------------------------  Inciso ii ---------------------------------
cercania <- function(lista,lat_min,lat_max,long_min,long_max) {
  for (elemento in names(lista)) {
    if (lista[[elemento]][["Estacion"]][["Latitud"]][]>=lat_min & lista[[elemento]][["Estacion"]][["Latitud"]][]<=lat_max & lista[[elemento]][["Estacion"]][["Longitud"]][]>=long_min & lista[[elemento]][["Estacion"]][["Longitud"]][]<=long_max){
      print(paste("La estación",elemento,"tiene estaciones cercanas"))
    } else {
      print(paste("No hay estaciones cercanas"))
    }
  }
}
cercania()

#---------------------------------  Inciso iii ---------------------------------
guardado <- function (lista) {
  save(lista, file = "DatosEstaciones.RData") 
}
guardado(estaciones)
