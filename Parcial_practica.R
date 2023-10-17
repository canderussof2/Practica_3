rm(list=ls())
setwd("/home/clinux01/Escritorio/Cande/")
fecha<-as.numeric(readline("Ingrese el día de medición (DDMMAA) "))
while(is.na(fecha)){
  if(!is.na(fecha)){
    break
  }
  fecha<-as.numeric(readline("Ingrese nuevamente el día de medición (DDMMAA) "))
}

cant_estaciones<-as.numeric(readline("Ingrese la cantidad de estaciones "))
while(is.na(cant_estaciones)){
  if(!is.na(cant_estaciones)){
    break
  }
  cant_estaciones<-as.numeric(readline("Ingrese nuevamente la cantidad de estaciones "))
}

nombres<-c()
presiones<-c()
for (estaciones in 1:cant_estaciones){
  nombre_estacion<-readline("Ingrese el nombre de la estación ")
  nombres<-c(nombres,nombre_estacion)
  presion<-as.numeric(readline("Ingrese la presión de la estación "))
  while(is.na(presion)){
    if(!is.na(presion)){
      break
    }
    presion<-as.numeric(readline("Ingrese nuevamente la presión "))
  }
  presiones<-c(presiones,presion)
}

long_fecha<-nchar(fecha)
dia<-as.numeric(substr(fecha,long_fecha-5,long_fecha-4))
mes<-as.numeric(substr(fecha,long_fecha-3,long_fecha-2))
anio<-as.numeric(substr(fecha,long_fecha-1,long_fecha))

for (valor in presiones){
  if(valor>1013.5){
    excedente<- valor-1013.5
    print(paste("La estacion meteorológica",nombres[which(presion>1013.5)],"el día",dia,"de",mes,"del",anio,
                "se encuentra bajo condiciones de ALTA PRESIÓN y estuvo por encima del valor de 1013.5 en",
                excedente,"hPa"))
  }
  else if(valor<1013.5){
   deficit<-1013.5-valor 
   print(paste("La estacion meteorológica",nombres[which(presion<1013.5)],"el día",dia,"de",mes,"del",anio,
               "se encuentra bajo condiciones de BAJA PRESIÓN y estuvo por debajo del valor de 1013.5 en",
               deficit,"hPa"))
  }
  else if (valor == 1013.5){
    print(paste("La estacion meteorológica",nombres[which(presion=1013.5)],"el día",dia,"de",mes,"del",anio,
                "se encuentra bajo condiciones NORMALES DE PRESIÓN"))
  }
}

