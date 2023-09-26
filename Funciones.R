#clase practica 26/09
rm(list=ls())
#Genero funciones
#Convierto de knts a m/s la velocidad del viento
nudos_a_ms <- function(viento) { #function me genera la función, viento es el
                                 #argumento
  ms <- viento * 0.5144          #la cuenta 
  return(ms)                     
}
nudos_a_ms(viento = 15)

ms_a_nudos<- function(viento) {
  nudos<-viento * 1.944
  return(ms)                     
}

#Si quiero que la función primero revise a ver si es numerico
nudos_a_ms <- function(viento) {
  if (!is.numeric(viento)) stop("viento no es numérico")
  # Para R >= 4.0
  # stopifnot("No es numerico" = is.numeric(viento))
  # ¿Es de tipo numérico?
  ms <- viento * 0.5144
  return()
}

#funciones con un df
datos_viento <- data.frame(hora = seq(0, 9),
                           viento = c(21.58, 18.08, 7.19, 7.19, 7.19, 7.19, 7.19,
                                      3.69, 3.69, 7.19))
head(datos_viento)

datos_viento$viento_ms <- nudos_a_ms(datos_viento$viento)
head(datos_viento)
class(datos_viento$viento) #numeric porque es un vector, del mismo largo q el
                           #vector de entrada
print(datos_viento$viento)

#Argumentos por defecto
nudos_a_ms <- function(viento, conversion = 0.51) { #Puedo definir el valor 
                                                    #de conversion y la func anda
if (!is.numeric(viento)) stop("viento no es numérico")
ms <- viento * conversion
return(ms)
}

nudos_a_ms(15) # usa la constante por defecto
nudos_a_ms(15, conversion = 0.514444) #puedo cambiar el valor de la conversión

##############################################
#Ejercicio en grupos
rm(list=ls())
#Ejercicio en grupos
convertir_viento<-function(viento,conversion=0.51) {
  if(unidad=="m/s"){
    ms <- viento * conversion
    return(ms)
  } else if (unidad=="knts") {
    knts<-viento * 1.944
    return(knts)
  }
}
unidad<-readline("Ingrese en la unidad que va ingresar: m/s o knts")
convertir_viento(15)

##############################################################
#Buenas practicas. Documentar las funciones 
#Ejemplo
# Conviernte variables de viento
# La función convierte viento de nudos a m/s y viseversa.
# Argumentos
   ## viento: variable numérica. Vector, matrix, etc.
   ## unidad: caracter, opcional. Permite definir si
   ## la salida será en m/s (unidad = "ms") o nudos
# Salida
  ## Vector numérico de igual dimension que la entrada.
convertir_viento <- function(viento, unidad = "ms") {
  if (!(unidad %in% c("ms", "nudos"))) stop("Arg unidad
incorrecto")
  if (unidad == "nudos") {
    out <- ms_a_nudos(viento)
  } else if (unidad == "ms") {
    out <- nudos_a_ms(viento)
  }
  return(out)
}


