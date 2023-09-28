rm(list=ls())

setwd("/home/clinux01/Escritorio/Cande Labo Jueves/Practica_3/")
load("./datos.Rdata")

#Miremos que dimensiones tiene el array
dimensiones<-dim(datos_PP)

#Veamos cual es el valor maximo
max(datos_PP)

#Ploteamos un histograma para ver como es la variable
hist(datos_PP,breaks=500,main="Histograma de frecuencias", xlab="Precipitacion [mm]",ylab="Frecuencia")

#se ve que hay datos faltantes proque el grafico va hasta -100 y los que son -99 
#son faltantes
#quiero sacarlos
datos_PP[datos_PP==-99]<-NA
max(datos_PP) #Ahora te dice NA
max(datos_PP,na.rm=TRUE) #Me calcula el maximo sin los NA

#Cuantos valores tengo arriba de un determinado umbral
length(which(datos_PP >= 1))/(prod(dim(datos_PP))) #1 mm
length(which(datos_PP >= 5))/(prod(dim(datos_PP))) #5 mm
length(which(datos_PP >= 10))/(prod(dim(datos_PP))) #10 mm
length(which(datos_PP >= 25))/(prod(dim(datos_PP))) #25 mm
length(which(datos_PP >= 100))/(prod(dim(datos_PP))) #100 mm
length(which(datos_PP >= 250))/(prod(dim(datos_PP))) #250 mm

#------------- EJERCICIO 2 -------------
estad<-function(x) {
  media<-mean(x,na.rm=T)
  desvio_estandar<-sd(x,na.rm=T)
  maximo<-max(x,na.rm=T)
  return(list("Media"= media , "Desvío"= desvio_estandar,"Máximo"=maximo))
}
resultados<-estad(datos_PP)


#------------- EJERCICIO 3 -------------
dim(datos_PP) #125 datos de long, 125 de lat y 8784 tiempos. Yo me quiero quedar
              #con cuadrados de 5x5
regionescol<-125/5
regionesfil<-125/5
#Cada cuadradito es una región
total<-regionescol*regionesfil #el total de regiones son 625

medias<-matrix(NA,nrow=25,ncol=25)
desvios<-matrix(NA,nrow=25,ncol=25)
maximos<-matrix(NA,nrow=25,ncol=25)

for (fila in seq(1,125,5)) {
  for(columna in seq(1,125,by=5)){
    datosA<-datos_PP[fila:(fila+4),columna:(columna+4),] #recorri todo. Primero todas las columnas de la 
                                                         #fila 1, despues todas las columnas de la fila 2 y asi
    resultadoA<-estad(datosA)
    medias[fila,columna]<-resultadosA$media
    desvios[fila,columna]<-resultadosA$desvios
    maximos[fila,columna]<-resultadosA$maximos
  }
}  
#CHEQUAR ESTO DESPUÉS


#ejercico 4 pedirle a gasti

#ejercico 5
ej5<-data.frame("Lons"=lons,"lats"=lats,"Media"=as.vector(medias),"Desvio"=desvio,"maximo"=maximo) #chequear nombre de las variables tamb


