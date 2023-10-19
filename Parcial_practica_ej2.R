#Parcial del 23/05/23

#Segudo punto 
rm(list=ls())
setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")

set.seed(123)
datos<-rnorm(19716,mean=25,sd=5)

#----------------------------------- a -----------------------------------------
#array de tres dimensiones
# PRIMERA DIMENSIÓN: LONGITUD
# SEGUNDA DIMENSIÓN: LATITUD
# TERCERA DIMENSIÓN: MESES

longitud<-seq(51,64, by= 0.25)
latitud<-seq(23,38,by=0.5)
tiempo<-1:12

longitud_ordenanda<-sort(longitud,decreasing=T)
latitud_ordenada<-sort(latitud,decreasing=T)

array_datos<-array(data=datos,dim=c(53,31,12))
dimnames(array_datos)<-list(longitud_ordenanda,latitud_ordenada,tiempo)

#----------------------------------- b -----------------------------------------
#seleccionar los datos de marzo
datos_marzo<-array_datos[,,3]
dim(datos_marzo)
#----------------------------------- i -----------------------------------------
#max y min temp en la region y determinar el punto de grilla (lon-lat) donde se registró cada una
maxi<-max(datos_marzo)
mini<-min(datos_marzo)
posic_max<-which(datos_marzo==maxi,arr.ind = T)
posic_min<-which(datos_marzo==mini,arr.ind = T)
lat_maxi<-latitud_ordenada[22]
long_maxi<-longitud_ordenanda[6]
lat_min<-latitud_ordenada[3]
long_min<-longitud_ordenanda[37]

#----------------------------------- ii ----------------------------------------
#guardar info en data.frame tres columnas(LONG,LAT, TEMP) y nombre filas la temp 
#a la q hace referencia cada fila. Valores de temp con un solo decimal

redondeo_max<-round(maxi,1)
redondeo_min<-round(mini,1)

df_marzo<-data.frame("Longitudes"=c(long_maxi,long_min),"Latitudes"=c(lat_maxi,lat_min),"Temperaturas"=c(redondeo_max,redondeo_min))
rownames(df_marzo)<-c("Maximo","Minimo")

#----------------------------------- c -----------------------------------------
#Calcular el campo medio (promedio en tiempo para cada punto de reticula) para la 
#primavera (SON)

datos_primavera<-array_datos[,,9:11]
dim(datos_primavera)

campo_medio<-apply(datos_primavera,c(1,2),mean)

#----------------------------------- i -----------------------------------------
#Calcular el desvio estandar y mediana y guardarlos en una lista de dos componentes.
#Nombre cada componente debe hacer refernecia al valor calculado

estadistica<- function(array){
  mediana<-median(array)
  desvio<-sd(array)
  resultados<-list("Mediana"=mediana,"Desvio estandar"=desvio)
  return(resultados)
}
estadistica(campo_medio)

#Mejor hacerlo asi
mediana<-median(campo_medio)
desvio<-sd(campo_medio)
lista_campo_medio<-list("Mediana"=mediana,"Desvio estandar"=desvio)

#----------------------------------- ii ----------------------------------------
#agregar a la lista anterior una nueva componente q sea el valor medio
valor_medio<-mean(campo_medio)
lista_campo_medio$valor_medio<-valor_medio
