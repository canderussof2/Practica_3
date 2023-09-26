#Listas
rm(list=ls())
#Sintaxis:
#list(x,y,z,...) donde x,y,z,. . . elementos de la lista

familia <- list("Maria","Juana", 10, c("Hugo", "Paula"), 
                c(8,7)) #genero la lista familia q tiene 5 elementos
familia

#Agrego nombres a los elementos de la lista
#Sintaxis:
  #list(nombre_x = x, nombre_y = y, nombre_z = z,...)  

  #lista_a <- list(x, y, z,...) names(lista_a) <- c(nombre_x, nombre_y, nombre_z,...)
  #donde x,y,z,. . . elementos de la lista cuyos nombres en la lista van a
  #ser: nombre_x, nombre_y, nombre_z, . . .

familia <- list(madre = "Maria", tia = "Juana",
                casados = 10,hijos = c("Hugo","Paula"),
                edades = c(8, 6))
familia

################################################################
#Manipulacion de listas
#Sintaxis:

#lista[numero_elemento] 
familia[2]
class(familia[2]) #lista

#lista["nombre_elemento"] 
familia["tia"]
class(familia["tia"]) #lista

#lista[c(numero_elemento_1, numero_elemento_2)] 
familia[c(2,4)]
class(familia[c(2,4)]) #lista

#lista[c("nombre_elemento_1", "nombre_elemento_2")]
familia[c("tia", "hijos")]
class(familia[c("tia", "hijos")]) #lista


#Accedo al CONTENIDO de un elemento de la lista
#Sintaxis:

#lista[[numero_elemento]] 
familia[[2]]
class(familia[[2]]) #Character

#lista$nombre_elemento
familia$tia
class(familia$tia) #Character

#lista[["nombre_elemento"]]
familia[["tia"]]
class(familia[["tia"]]) #character

##############################################################
#Operaciones basicas

#Agregar un componenente
#Sintaxis:

#lista$nombre_nueva_componente <-nueva_componente 
familia$mascotas <- "Gato"

#lista[numero_elemento] <- nueva_componente
familia[7] <- "Auto"

#Eliminar un componente
#Sintaxis:

#lista$nombre_nueva_componente <- NULL
familia$edades <- NULL

#lista[numero_elemento] <- NULL
familia[[5]] <- NULL

#Concatenar listas
#Sintaxis:
#c(lista1,lista2,lista3)
familia_2 <- list(mascotas = "Gato",
                  vacaciones_favoritas = c("Mar del Plata"))
familia_concatenada <- c(familia, familia_2)

##################################################
#Operaciones avanzadas con listas

#lapply()
#El input es un vector o una lista y el output es una lista
#intaxis:
  #lapply(lista, function(x) nombre_funcion(x))
#Esto aplica la funcion nombre_funcion a cada elemento de la lista y
#devuelve una lista
mi_lista <- list(x = c(1, 3, 5), y = c(2, 2, 3))
lapply(mi_lista, function(x) mean(x)) #El function me dice que lo que sigue es 
                                      #una funcion pero podria no estar

################################################
#Ejercicio
alumnas<-list(Nombres=c("Cami","Maite","Cande","Eli"),edades=c(22,20,21,23))
alumnas

alumnas$promedio <- mean(alumnas$edades) #calculo del promedio y agregar a la lista
#tambien podia
#media_edades <- mean(mi_lista$edades)
#mi_lista$promedio_edades <- media_edades

lapply(alumnas,function(x) length(x))
