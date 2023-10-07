#----------------- Ejercicio 6 -----------------
rm(list=ls())
#setwd("/home/clinux01/Escritorio/Cande/Practica_3/")
setwd("/Users/cande/Desktop/Labo/Practica_3/")

#A partir del archivo temp bsas.Rdata con datos de temperatura mensual para 
#diferentes niveles durante el per???odo 2000-2005 sobre la provincia de Buenos
#Aires. (Cargar el archivo utilizando la funcion ???load()???)

load("temp_bsas.RData")

#----------------- Inciso a -----------------
#Obtener el promedio mensual de temperatura en el periodo analizado para cada 
#nivel y cada punto de reticula. Hagalo por un lado utilizando ciclos y por
#otro reacomodando el arreglo y utilizando la funcion apply()

dim(variable)
class(variable)
#es una array de 4 dimensiones
nlon<-8
nlat<-14
niso<-4
ntiempo<-72

#[long, lat, isob, tiempo]

#Utilizando la funcion apply
#Dimensiones:
#Primera dimension: LONGITUDES
#Segunda dimension: LATITUDES
#Tercera dimension: NIVELES
#Cuarta dimension: TIEMPO

prom_mensual<-apply(variable,c(1,2,3),mean)  
prom_mensual #al mostrarlo por pantalla me da los promedios mensuales para cada 
#lat y long de cada uno de los 4 niveles
dim(prom_mensual)

dim_reticula<-nlat*nlon

reticula<-array(data=NA,dim=c(nlon*nlat,niso))
latitud<-prom_mensual[1:14]
longitud<-prom_mensual[1:8]
reticula[longitud,latitud]<-longitud*latitud

