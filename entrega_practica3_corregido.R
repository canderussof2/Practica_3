#---------- EJERCICIO PARA ENTREGAR PRACTICA 3 ----------
#---------------------------------  Punto 1 ---------------------------------

#Consideraciones previas

#seteo mi  directorio de trabajo y limpio el environment
rm(list=ls())
setwd("/Users/cande/Desktop/Labo/Practica_3/")
#setwd("/home/clinux01/Escritorio/Cande Labo Martes/Practica_3/")
#setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")

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
datos_estaciones<-read.table("estaciones.txt")
colnames(datos_estaciones)<-c("Estacion","Latitud","Longitud","Altura")

#Agrego los datos de Mendoza
generales_mendoza<-data.frame("MENDOZA",-32.9,-68.8,746)
colnames(generales_mendoza)<-c("Estacion","Latitud","Longitud","Altura")

datos_estaciones<-rbind(datos_estaciones,generales_mendoza)

estaciones <-list()
for (e in 1:nrow(datos_estaciones)){
    estacion <- list("Estacion"=datos_estaciones[[e,1]],"Latitud"=datos_estaciones[[e,2]], 
                     "Longitud"=datos_estaciones[[e,3]], "Altura"=datos_estaciones[[e,4]]
                     )
    datos_por_estacion <- list(estacion )
    estaciones<-c(estaciones, datos_por_estacion)
}

names(estaciones)<-c("Generales Azul","Generales Aeroparque","Generales Catamarca","Generales Chilecito","Generales Iguazu", "Generales Mendoza")

estaciones<-list("Azul"=c(estaciones[[1]],datos_azul),"Aeroparque"=c(estaciones[[2]],datos_aeroparque),"Catamarca"=c(estaciones[[3]],datos_catamarca),"Chilecito"=c(estaciones[[4]],datos_chilecito),"Iguazu"=c(estaciones[[5]],datos_iguazu),"Mendoza"=c(estaciones[[6]],datos_mendoza))

#Ordeno mi environment
rm(list="datos_aeroparque","datos_azul","datos_catamarca","datos_chilecito","datos_iguazu","datos_mendoza")
rm(list="datos_estaciones","datos_por_estacion","estacion","generales_mendoza")

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
      for (elemento in names(lista [[estacion]] )) {
        if (elemento == "Fecha"){
          fecha_inicial[estacion] <- lista[[estacion]][[elemento]][1]
          fecha_final[estacion]<- lista[[estacion]] [[elemento]][length(lista [[estacion]] [[elemento]])]
        }
        else if (elemento == "Temperatura"){
          mean_T [estacion]<- mean(lista[[estacion]][[elemento]],na.rm=T)
          desv_est_T [estacion] <- sd(lista[[estacion]][[elemento]],na.rm=T)
          max_T [estacion]  <- max(lista[[estacion]][[elemento]],na.rm=T)
          min_T [estacion] <- min(lista[[estacion]][[elemento]],na.rm=T)
        }
        else if (elemento == "Temperatura.de.Rocio"){
          mean_Tr [estacion] <- mean(lista[[estacion]][[elemento]],na.rm=T)
          desv_est_Tr [estacion] <- sd(lista[[estacion]][[elemento]],na.rm=T)
          max_Tr [estacion]  <- max(lista[[estacion]][[elemento]],na.rm=T)
          min_Tr [estacion] <- min(lista[[estacion]][[elemento]],na.rm=T)
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

resumen(estaciones)

#---------------------------------  Inciso ii ---------------------------------
cercania <- function(estacion,lat_min,lat_max,long_min,long_max) {
 
  if(estacion=="Azul"){
    if (estaciones[["Azul"]][["Latitud"]][]>=lat_min & estaciones[["Azul"]][["Latitud"]][]<=lat_max & estaciones[["Azul"]][["Longitud"]][]>=long_min & estaciones[["Azul"]][["Longitud"]][]<=long_max){
      print("La estación Azul tiene estaciones cercanas")
    } else {
      print("la estacion Azul no tiene estaciones cercanas") 
    }
  } else if (estacion=="Aeroparque"){
    if (estaciones[["Aeroparque"]][["Latitud"]][]>=lat_min & estaciones[["Aeroparque"]][["Latitud"]][]<=lat_max & estaciones[["Aeroparque"]][["Longitud"]][]>=long_min & estaciones[["Aeroparque"]][["Longitud"]][]<=long_max){
      print("La estación Aeroparque tiene estaciones cercanas")
    } else {
      print("la estacion Aeroparque no tiene estaciones cercanas") 
    }
  } else if (estacion=="Catamarca"){
    if (estaciones[["Catamarca"]][["Latitud"]][]>=lat_min & estaciones[["Catamarca"]][["Latitud"]][]<=lat_max & estaciones[["Catamarca"]][["Longitud"]][]>=long_min & estaciones[["Catamarca"]][["Longitud"]][]<=long_max){
      print("La estación Catamarca tiene estaciones cercanas")
    } else {
      print("la estacion Catamarca no tiene estaciones cercanas") 
    }
  }  else if (estacion=="Chilecito"){
    if (estaciones[["Chilecito"]][["Latitud"]][]>=lat_min & estaciones[["Chilecito"]][["Latitud"]][]<=lat_max & estaciones[["Chilecito"]][["Longitud"]][]>=long_min & estaciones[["Chilecito"]][["Longitud"]][]<=long_max){
      print("La estación Chilecito tiene estaciones cercanas")
    } else {
      print("la estacion Chilecito no tiene estaciones cercanas") 
    }
  } else if (estacion=="Iguazu"){
    if (estaciones[["Iguazu"]][["Latitud"]][]>=lat_min & estaciones[["Iguazu"]][["Latitud"]][]<=lat_max & estaciones[["Iguazu"]][["Longitud"]][]>=long_min & estaciones[["Iguazu"]][["Longitud"]][]<=long_max){
      print("La estación Iguazu tiene estaciones cercanas")
    } else {
      print("la estacion Iguazu no tiene estaciones cercanas") 
    } 
  } else if (estacion=="Mendoza"){
    if (estaciones[["Mendoza"]][["Latitud"]][]>=lat_min & estaciones[["Mendoza"]][["Latitud"]][]<=lat_max & estaciones[["Mendoza"]][["Longitud"]][]>=long_min & estaciones[["Mendoza"]][["Longitud"]][]<=long_max){
      print("La estación Mendoza tiene estaciones cercanas")
    } else {
      print("la estacion Mendoza no tiene estaciones cercanas") 
    } 
  }       
}
cercania("Azul",-36.8,-36.8,-59.9,-59.9)

