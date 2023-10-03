#Ejercicio 2

setwd("/Users/cande/Desktop/Labo/Practica_3/")

#----------- Inciso a -----------

rm(list=ls())

a <- c ( 4 , -10, 7 , -2, 8 , -6, 1 , -15, 3 , -9)
i <- 3
j <- 5
b <- c ( 1 , 5 , 7 )
c <- c (TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)

a[ ] #Me devuelve todos los elementos de a

a[i, j] #error. Preguntar 
#creo que es porque me pide la posicion de la fila i (aca -3) y columna j (aca 5) 
#y a es un vector de una dim

a[seq(i, i, 2)] #secuencia q emp en posicion i y termina ahi tamb, cada 2. 
#Me devuelve un solo valor, el 7

a[seq(i, j, 3)] #secuencia q emp en posicion i y termina en la j, cada 3. 
#Me devuelve un solo valor, el 7. Es el mismo porque no puede recorrer mucho mas

a[i:length(a)] #secuencia q emp en posicion i (aca la 3) y termina en la long 
#de a, aca 10, cada 1. Me devuelve los ultimos 8 valores de a, desde el 7 al -9

a[c(1, 5, 7)] #Preguntar como compara con c. Lo del False
#Me devuelve los valores de las posiciones 1, 5 y 7 de a 

a[b] #Me devuelve los valores de las posiciones de a teniendo en cuenta los 
#Valores de b

a[c] #Me devuelve los valores de las posiciones de a donde c es TRUE

a[a == -4] #Preguntar. Es porque ningun valor de a es -4?
#devuelve numeric (0)

#----------- Inciso b -----------
mi_matriz<-matrix(data=1:25,nrow= 5, ncol=5 , byrow=TRUE)

mi_matriz[3,2] #Me devuelve el valor que esta en la fila 3, columna 2

mi_matriz[3,] #Me devuelve toda la fila 3

mi_matriz[, 2] #Me devuelve toda la columna 2

mi_matriz[seq(1, 5, 2),] #Me arma una nueva matriz con las filas 1,3 y 5. Preguntar

mi_matriz[,seq(2, 5, 2)] #Me arma una nueva matriz con las columnas 2. Preguntar

mi_matriz[seq(1, 5, 2), seq(1, 5, 2)] #Preguntar

mi_matriz[10]  #Me devuelve el valor que esta en la posicion 10. Se va completando por columnas

b <- c ( 1 , 5 , 7 )
mi_matriz[b] #Me devuelve los valores q estan en la posicion 1,5 y 7. Se va completando por columnas
