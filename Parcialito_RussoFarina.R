#Hacer un programa que pida el ingreso de un n´umero de d´ıa del mes de Agosto entre 1 y 31. Verifique
#que el n´umero ingresado sea v´alido. Luego, pida ingresar los valores de temperatura (T) de cada d´ıa en
#el mes de Agosto de 2023. Luego, calcule el valor medio de la temperatura durante el mes de Agosto.
#Finalmente, el c´odigo debe imprimir por consola el siguiente mensaje correspondiente (Sin las comillas):
  #-“El d´ıa NUMERO DE DIA INGRESADO (X) del mes de Agosto la temperatura fue de T ºC,
#es decir debajo de la media mensual”
#- “El d´ıa NUMERO DE DIA INGRESADO (X) del mes de Agosto la temperatura fue de T ºC,
#es decir por encima de la media mensual”
#- “El d´ıa NUMERO DE DIA INGRESADO (X) del mes de Agosto la temperatura fue de T ºC,
#es decir igual a la media mensual”
#seg´un la relaci´on entre el valor diario (T del d´ıa X) y el promedio mensual calculado.
#El programa debe verificar en cada instancia que los valores de temperatura y el promedio mensual
#sean n´umeros y en caso contrario debe comunicar el error.
#* aclaraci´on: Para resolver este ejercicio no deben usarse nociones de vectore

rm(list=ls()) #Limpio el environment
setwd("/home/clinux01/Escritorio/Cande Labo Jueves/") #Seteo el directorio}

#Ingreso de los dias
dia<-as.integer(readline("Ingrese un día del mes de Agosto"))

#Para que el ingreso de dias sea entre los dias reales de agosto, es decir entre el 1 y el 31
while(dia<1 | dia>31){
  dia<-as.integer(readline("Ingrese un dia del mes de Agosto"))
  if(dia>=1 | dia<=31){
    break
  }
}

#Ingreso de la temperatura
temp<-c() #defino un vector vacío para que los ingresos de valores de temperatura se vayan guardando ahí
for (i in seq(1:31)) {
  t<-as.numeric(readline("Ingresela temperatura"))
  temp<-c(temp,t)
  }

print(temp)

#Calculo del promedio 
prom<-mean(temp)

#Impresión por consola, sin las comillas
for(valor in temp){
  if(valor<prom){
    cat("El dia",dia,"del mes de Agosto, la temperatura fue de",valor,"°C, es decir debajo de la media mensual","\n")
  } else if (valor>prom) {
    cat("El dia",dia,"del mes de Agosto, la temperatura fue de", valor,"°C, es decir encima de la media mensual","\n")
  } else {
    cat("El dia",dia,"del mes de Agosto, la temperatura fue de",valor,"°C, es decir igual a la media mensual","\n")
  }
}

#ACLARACIÓN: Se que por consola me debería aparecer una sola frase que tenga el dia ingresado, la temperatura que fue ingresada para
#ese día y si fue por debajo, igual o encima de la media. El for corre para cada valor del vector temperatura y va comparando ese valor con el promedio e imprime. Perdón :(  

