#---------- EJERCICIO PARA ENTREGAR PRACTICA 3 ----------

#seteo mi  directorio de trabajo y limpio el environment

rm(list=ls())
#setwd("/home/clinux01/Escritorio/Cande/Practica_3/")
setwd("/Users/cande/Desktop/Labo/Practica_3/")

#Armar una lista de listas (array de listas) que contenga los datos 
#correspondientes a cada estacion como asi tambien informacion asociada a cada
#estacion en particular: nombre, latitud, longitud, altura y codigo de
#identificacion. Convertir los valores de temperatura y temperatura de rocio
#a grados centigrados. La informacion sobre la ubicacion de cada estacion esta
#disponible en el archivo estaciones.txt.

#Defino el dato faltante y lo convierto a NA para que no interfiera en las cuentas
dato_faltante<- -999.9

#Para convertir la temperatura y temperatura de rocio de grados Farenheit (°F) a 
#grados Centigrados (°C) armo una funcion que lo haga

temp_farenheit_a_centigrados <- function (Temperatura) {
  t <- (Temperatura - 32) * 5/9
  return(t)
}

temp_rocio_farenheit_a_centigrados <- function (Temperatura) {
  tr <- (Temperatura - 32) * 5/9
  return(tr)
}
#AZUL
#Primero, cargo los datos. Los carga como un dataframe. Con as.list() fuerzo a 
#convertirlo en lista

datos_azul<-read.table("AZUL.txt") 
datos_azul[which(datos_azul== dato_faltante)] <- NA #Cambio los datos faltates 
                                                    #por NA.

datos_azul$V3_C <- temp_farenheit_a_centigrados(datos_azul$V3) #Cambio la 
                                                            #temperatura de F a C

datos_azul$V4_C <- temp_rocio_farenheit_a_centigrados(datos_azul$V4) #Cambio la 
                                                                    #temp de rocio


lista_datos_azul<-as.list(datos_azul)

agregado_azul<-list("Azul",-36.8,-59.9,146,876410) #lista con los datos de cada estación 

azul<-c(agregado_azul,lista_datos_azul) #Uno las listas

#Elimino el elemento correspondiente al codigo de identifiacion que se repetia
azul[[6]]<-NULL

#Agrego nombre a los elementos
names(azul)<-c("Estacion", "Latitud", "Longitud","Altura","Codigo de identificacion",
               "Fecha (YYYYMMDD)", "Temperatura (F)", "Temperatura de rocio (F)", 
               "Presion", "Temperatura (C)", "Temperatura de rocio (C)" ) 

#Elimino el elemento correspondiente a las temperaturas en Farenheit
azul$'Temperatura (F)' <-NULL
azul$'Temperatura de rocio (F)' <-NULL

#Convertir la temperatura y temperatura de rocio de grados Farenheit (°F) a 
#grados Centigardos (°C)

#Temperatura
#selecciono los elementos de la lista
#temperatura_F <- azul[["Temperatura"]]
#temperatura_C <- c()
#for (valor in temperatura_F) {
  #if(is.na(valor)){
   # temperatura_C[valor] <- NA
  #}
  #temperatura_C[valor] <- (((valor - 32) * 5)/9)
#}  

#CATAMARCA
datos_catamarca<-read.table("CATAMARCA.txt")
datos_catamarca[which(datos_catamarca== dato_faltante)] <- NA
datos_catamarca$V3_C <- temp_farenheit_a_centigrados(datos_catamarca$V3) 
datos_catamarca$V4_C <- temp_rocio_farenheit_a_centigrados(datos_catamarca$V4) 
lista_datos_catamarca<-as.list(datos_catamarca)
agregado_catamarca<-list("Catamarca",-28.6,-65.8,454,87220)
catamarca<-c(agregado_catamarca,lista_datos_catamarca)
catamarca[[6]]<-NULL
names(catamarca)<-c("Estacion", "Latitud", "Longitud","Altura","Codigo de identificacion",
                     "Fecha (YYYYMMDD)", "Temperatura (F)", "Temperatura de rocio (F)", 
                     "Presion", "Temperatura (C)", "Temperatura de rocio (C)" ) 
catamarca$'Temperatura (F)' <-NULL
catamarca$'Temperatura de rocio (F)' <-NULL

#AEROPARQUE
datos_aeroparque<-read.table("AEROPARQUE.txt") 
datos_aeroparque[which(datos_aeroparque== dato_faltante)] <- NA
datos_aeroparque$V3_C <- temp_farenheit_a_centigrados(datos_aeroparque$V3) 
datos_aeroparque$V4_C <- temp_rocio_farenheit_a_centigrados(datos_aeroparque$V4)
lista_datos_aeroparque<-as.list(datos_aeroparque)
agregado_aeroparque<-list("Aeroparque", -34.6,-58.4,6,875820)
aeroparque<-c(agregado_aeroparque,lista_datos_aeroparque)
aeroparque[[6]]<-NULL
names(aeroparque)<-c("Estacion", "Latitud", "Longitud","Altura","Codigo de identificacion",
                     "Fecha (YYYYMMDD)", "Temperatura (F)", "Temperatura de rocio (F)", 
                     "Presion", "Temperatura (C)", "Temperatura de rocio (C)" ) 
aeroparque$'Temperatura (F)' <-NULL
aeroparque$'Temperatura de rocio (F)' <-NULL

#CHILECITO
datos_chilecito<-read.table("CHILECITO.txt")
datos_chilecito[which(datos_chilecito== dato_faltante)] <- NA
datos_chilecito$V3_C <- temp_farenheit_a_centigrados(datos_chilecito$V3) 
datos_chilecito$V4_C <- temp_rocio_farenheit_a_centigrados(datos_chilecito$V4)
lista_datos_chilecito<-as.list(datos_chilecito)
agregado_chilecito<-list("Chilecito",-29.2,-67.4,1250,872140)
chilecito<-c(agregado_chilecito,lista_datos_chilecito)
chilecito[[6]]<-NULL
names(chilecito)<-c("Estacion", "Latitud", "Longitud","Altura","Codigo de identificacion",
                    "Fecha (YYYYMMDD)", "Temperatura (F)", "Temperatura de rocio (F)", 
                    "Presion", "Temperatura (C)", "Temperatura de rocio (C)" ) 
chilecito$'Temperatura (F)' <-NULL
chilecito$'Temperatura de rocio (F)' <-NULL

#IGUAZU
datos_iguazu<-read.table("IGUAZU.txt")
datos_iguazu[which(datos_iguazu== dato_faltante)] <- NA
datos_iguazu$V3_C <- temp_farenheit_a_centigrados(datos_iguazu$V3) 
datos_iguazu$V4_C <- temp_rocio_farenheit_a_centigrados(datos_iguazu$V4)
lista_datos_iguazu<-as.list(datos_iguazu)
agregado_iguazu<-list("Iguazu",-25.7,-54.5,270,870970)
iguazu<-c(agregado_iguazu,lista_datos_iguazu)
iguazu[[6]]<-NULL
names(iguazu)<-c("Estacion", "Latitud", "Longitud","Altura","Codigo de identificacion",
                 "Fecha (YYYYMMDD)", "Temperatura (F)", "Temperatura de rocio (F)", 
                 "Presion", "Temperatura (C)", "Temperatura de rocio (C)" ) 
iguazu$'Temperatura (F)' <-NULL
iguazu$'Temperatura de rocio (F)' <-NULL 

#MENDOZA
datos_mendoza<-read.table("MENDOZA.txt") 
datos_mendoza[which(datos_mendoza== dato_faltante)] <- NA
datos_mendoza$V3_C <- temp_farenheit_a_centigrados(datos_mendoza$V3) 
datos_mendoza$V4_C <- temp_rocio_farenheit_a_centigrados(datos_mendoza$V4)
lista_datos_mendoza<-as.list(datos_mendoza)
agregado_mendoza<-list("Mendoza",-32.8,-68.8,746,874180)
mendoza<-c(agregado_mendoza,lista_datos_mendoza)
mendoza[[6]]<-NULL
names(mendoza)<-c("Estacion", "Latitud", "Longitud","Altura","Codigo de identificacion",
                  "Fecha (YYYYMMDD)", "Temperatura (F)", "Temperatura de rocio (F)", 
                  "Presion", "Temperatura (C)", "Temperatura de rocio (C)" ) 
mendoza$'Temperatura (F)' <-NULL
mendoza$'Temperatura de rocio (F)' <-NULL


#Uno todas las listas
datos<-c(azul,catamarca,aeroparque,chilecito,iguazu,mendoza)

#Limpio un poco el environment, los elementos q no voy a volver a usar
rm(list="agregado_azul","agregado_catamarca","agregado_aeroparque",
   "agregado_chilecito","agregado_iguazu","agregado_mendoza")
rm(list="lista_datos_azul","lista_datos_catamarca","lista_datos_aeroparque",
   "lista_datos_chilecito","lista_datos_iguazu","lista_datos_mendoza")
rm(list="datos_azul", "datos_catamarca","datos_aeroparque","datos_chilecito",
   "datos_iguazu","datos_mendoza")

#---------------------------------  Punto 2 ---------------------------------
#En base a la lista armada en el punto a), desarrollar funciones que permitan 
#hacer lo siguiente:

#---------------------------------  Inciso i ---------------------------------
#A partir del array, generar un resumen por pantalla con el nombre de las 
#estaciones y la cantidad de datos presentes en cada una, los estadısticos basicos 
#de cada serie (media, desvıo estandar, valor maximo y mınimo), la fecha inicial 
#del perıodo abarcado y la fecha final.
#Tip: organizar los datos de cada estacion en un data.frame.

#Primero me quedo con los elementos de cada estacion
estacion_azul <- datos[[1]]
latitud_azul <- datos[[2]]
longitud_azul <- datos[[3]]
altura_azul <- datos[[4]]
codigo_identificacion_azul <- datos[[5]]
fecha_azul <- datos[[6]]
presion_azul <- datos[[7]]
temp_azul <- datos[[8]]
temp_rocio_azul <- datos[[9]]

#creo el dataframe 
data_azul <- data.frame("Estacion" = estacion_azul, "Latitud" = latitud_azul,
                        "Longitud" = longitud_azul, "Altura" = altura_azul, 
                        "Codigo de identifiacion" = codigo_identificacion_azul,
                        "Fecha" = fecha_azul, "Temperatura" = temp_azul, 
                        "Temperatura de rocio" = temp_rocio_azul,
                        "Presion" = presion_azul )
 
estad<-function(x) {
  if (x==estacion_azul){
    estacion<-estacion_azul
    latitud<-latitud_azul
    longitud <- longitud_azul
    altura <- altura_azul
    codigo <- codigo_identificacion_azul
  } 
  media<-mean(x,na.rm=T)
  desvio_estandar<-sd(x,na.rm=T)
  maximo<-max(x,na.rm=T)
  minimo<-min(x,na.rm=T)
  return(data.frame("Estacion"=estacion,"Latitud"=latitud,"Longitud"=longitud,
                    "Altura"=altura, "Codigo"= codigo," Media"= media , "Desvío"= desvio_estandar,
                    "Máximo"=maximo,"Minimo"= minimo))
}


#---------------------------------  Inciso iii ---------------------------------

guardado <- function (x) {
  save(x, file = "DatosEstaciones.RData") 
}
guardado(datos)



