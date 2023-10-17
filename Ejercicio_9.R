# Ejercicio 9

#El archivo t_media_EF.RData contiene un array de tipo lista con la temperatura 
#media del mes de Enero y Febrero desde 1982 a 2012 para 5 estaciones argentinas
#(usar la sentencia load(“t_media_EF.RData”) para abrirlo). La primera columna
#del array contiene el nombre de cada estacion, la segunda contiene la serie 
#para el mes de enero y la tercera para el mes de febrero. Cada fila del array 
#esta asociada a una estacion:

rm(list=ls())
#setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")
setwd("/home/clinux01/Escritorio/Cande Labo Martes/Practica_3/")

load("t_media_EF.RData")


#------------------------------------- a ---------------------------------------
#Para cada estacion: Obtener la anomalıa mensual maxima de enero y el anio en que
#se alcanzo. Almacenarlo en un data frame donde la primer variable sea el nombre 
#de cada estacion, la segunda el ano de la anomalıa y la tercera dicho valor.

colnames(estaciones)<-c("Estacion","Enero","Febrero")

#Valores maximos y posiciones maximos
max_cada_estacion<-c()
posiciones_maximos<-c()
#anios_maximos<-c()
anio<-0
for(estacion in 1:nrow(estaciones)){
 maximo<-max(estaciones[[estacion, 2]],na.rm=T)
 max_cada_estacion<-c(max_cada_estacion,maximo)
 posic<-which(estaciones[[estacion,2]] == maximo )
 posiciones_maximos<-c(posiciones_maximos, posic)
 anio[estacion]<-1981+posiciones_maximos[estacion]
 #anios_maximos<-c(anios_maximos,anio)
 
}

data_frame_datos<-data.frame(Estaciones=c("Buenos Aires","Viedma","Rosario","San Luis","Resistencia"),
               Anio=anio,Valor=max_cada_estacion)

#------------------------------------- b ---------------------------------------
#Para cada estacion: Calcular la media y el desvıo estandard para el mes de febrero. 
#Imprimir luego un cartel que senale para cada estacion en que anos la temperatura 
#estuvo por encima de la media mas un desvıo standar.

media_estaciones<-c()
desvio_estaciones<-c()
umbral<-0
valor_sup_umbral<-c()
posic_valor_sup_umbral<-c()
for(estacion in 1:nrow(estaciones)){
  media<-mean(estaciones[[estacion,3]],na.rm=T)
  media_estaciones<-c(media_estaciones,media)
  desvio<-sd(estaciones[[estacion,3]],na.rm=T)
  desvio_estaciones<-c(desvio_estaciones,desvio)
  umbral[estacion]<-media_estaciones[estacion]+desvio_estaciones[estacion]
  valor_sup_umbral<-estaciones[[estacion,3]][which(estaciones[[estacion,3]]>umbral)]
  posic_valor_sup_umbral<-which(estaciones[[estacion,3]]>umbral) 
  anio<-1981+posic_valor_sup_umbral
  print(paste("En la estación", estacion,"se superó el umbral en los años",anio))
  df<-data.frame("Estacion"=estacion ,"Umbral"=umbral,"Años"=anio) #me da solo para bsas
}

media_estaciones<-c()
desvio_estaciones<-c()
umbral<-0
valor_sup_umbral_bsas<-c()
posic_valor_sup_umbral_bsas<-c()

#EJEMPLO CON BS AS
for(estacion in 1:nrow(estaciones)){
  media<-mean(estaciones[[estacion,3]],na.rm=T)
  media_estaciones<-c(media_estaciones,media)
  desvio<-sd(estaciones[[estacion,3]],na.rm=T)
  desvio_estaciones<-c(desvio_estaciones,desvio)
  umbral[estacion]<-media_estaciones[estacion]+desvio_estaciones[estacion]
  if (estacion == 1){
    valor_sup_umbral_bsas<-estaciones[[1,3]][which(estaciones[[1,3]]>umbral)]
    posic_valor_sup_umbral_bsas<-which(estaciones[[1,3]]>umbral) 
    anio_bsas<-1981+posic_valor_sup_umbral_bsas
    print(paste("En la estación Buenos Aires se superó el umbral en los años",anio_bsas))
  }
}

#COMO LO PENSE CON VIEDMA
media_viedma<-mean(estaciones[[2,3]],na.rm=T)
desvio_viedma<-sd(estaciones[[2,3]],na.rm=T)
umbral_viedma<-media_viedma+desvio_viedma
valores<-c()
posic<-c()
for(valor in estaciones[[2,3]]){
  valor_sup_umbral<-estaciones[[2,3]][which(estaciones[[2,3]]>umbral_viedma)]
  posic_valor_sup_umbral<-which(estaciones[[2,3]]>umbral_viedma) 
  anio<-1981+posic_valor_sup_umbral
}

#------------------------------------- c ---------------------------------------
#Escribir una funcion que, dado un vector de longitud N con los datos de temperatura 
#calcule el rango de la serie y la mediana. Utilizar dicha funcion en los datos de
#enero y guardar los resultados en una nueva matriz que lleve como nombre en cada 
#columna el de cada una de las estaciones.

rm(list=ls())
#setwd("/Users/Usuario/Desktop/Cande/Laboratorio de Procesamiento de Información meteorológica/Practica_3/")
setwd("/home/clinux01/Escritorio/Cande Labo Martes/Practica_3/")
load("t_media_EF.RData")
colnames(estaciones)<-c("Estacion","Enero","Febrero")
class(estaciones)
#todos_resultados<-c()
estadistica<-function(vector) {
  largo<-length(vector)
  suma<-sum(vector)
  mediana<-suma/largo
  maximo<-max(vector)
  minimo<-min(vector)
  rango<- maximo - minimo
  #resultados<-matrix(data=c(mediana,rango),nrow=3,ncol=5)
  resultados<-matrix(data=c(mediana,rango))
  colnames(resultados)<-c("Buenos Aires","Viedma","Rosario","San Luis","Resistencia")
  #colnames(resultados)<-c("Viedma")
  #todos_resultados<-c(todos_resultados,resultados)
  return(resultados)
}

estadistica(estaciones[[2,2]])
estadistica(estaciones[[estacion,2]])
for(estacion in 1:nrow(estaciones)){
  resultados<-estadistica(estaciones[[estacion,2]])
}
print(resultados)




