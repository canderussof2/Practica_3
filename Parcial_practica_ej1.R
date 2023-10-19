#Parcial del 23/05/23

#Primer punto 
rm(list=ls())
#setwd("/home/clinux01/Escritorio/Cande/")
setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")

fecha<-as.numeric(readline("Ingrese el d?a de medici?n (DDMMAA) "))
while(is.na(fecha)){
  if(!is.na(fecha)){
    break
  }
  fecha<-as.numeric(readline("Ingrese nuevamente el d?a de medici?n (DDMMAA) "))
}

long_fecha<-nchar(fecha)
dia<-as.numeric(substr(fecha,long_fecha-5,long_fecha-4))
mes<-as.numeric(substr(fecha,long_fecha-3,long_fecha-2))
anio<-as.numeric(substr(fecha,long_fecha-1,long_fecha))


cant_estaciones<-as.numeric(readline("Ingrese la cantidad de estaciones "))
while(is.na(cant_estaciones)){
  if(!is.na(cant_estaciones)){
    break
  }
  cant_estaciones<-as.numeric(readline("Ingrese nuevamente la cantidad de estaciones "))
}

nombres<-c()
#presiones<-c()
for (estaciones in 1:cant_estaciones){
  nombre_estacion<-readline("Ingrese el nombre de la estaci?n ")
  nombres<-c(nombres,nombre_estacion)
  presion<-as.numeric(readline("Ingrese la presi?n de la estaci?n "))
  while(is.na(presion)){
    if(!is.na(presion)){
      break
    }
    presion<-as.numeric(readline("Ingrese nuevamente la presi?n "))
  }
  #presiones<-c(presiones,presion)
  if(presion>1013.5){
    excedente<- presion-1013.5
    print(paste("La estacion meteorológica",nombre_estacion,"el día",dia,"de",mes,"del",anio,
                "se encuentra bajo condiciones de ALTA PRESI?N y estuvo por encima del valor de 1013.5 en",
                excedente,"hPa"))
  }
  else if(presion<1013.5){
    deficit<-1013.5-presion 
    print(paste("La estacion meteorológica",nombre_estacion,"el día",dia,"de",mes,"del",anio,
                "se encuentra bajo condiciones de BAJA PRESI?N y estuvo por debajo del valor de 1013.5 en",
                deficit,"hPa"))
  }
  else if (presion == 1013.5){
    print(paste("La estacion meteorológica",nombre_estacion,"el día",dia,"de",mes,"del",anio,
                "se encuentra bajo condiciones NORMALES DE PRESI?N"))
  }
}

#for (valor in presiones){
 # if(valor>1013.5){
  #  excedente<- valor-1013.5
   # print(paste("La estacion meteorol?gica",estaciones,"el d?a",dia,"de",mes,"del",anio,
    #            "se encuentra bajo condiciones de ALTA PRESI?N y estuvo por encima del valor de 1013.5 en",
     #           excedente,"hPa"))
  #}
  #else if(valor<1013.5){
   #deficit<-1013.5-valor 
#print(paste("La estacion meteorol?gica",estaciones,"el d?a",dia,"de",mes,"del",anio,
#              "se encuentra bajo condiciones de BAJA PRESI?N y estuvo por debajo del valor de 1013.5 en",
#              deficit,"hPa"))
# }
# else if (valor == 1013.5){
#   print(paste("La estacion meteorol?gica",nombres[which(presion=1013.5)],"el d?a",dia,"de",mes,"del",anio,
#                "se encuentra bajo condiciones NORMALES DE PRESI?N"))
# }
#}

