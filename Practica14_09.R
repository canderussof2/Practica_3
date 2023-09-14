#Practica 14/09


matriz_2<- matrix(c(1,2,3,4), ncol = 2, nrow = 2, byrow = TRUE) #Completa primero las filas
matriz_2<- matrix(c(1,2,3,4), ncol = 2, nrow = 2) #Completa primero por columnas
#colMeans y rowMeans es promedio por columnas y por filas. Si no me aparece tengo q bajar los paquetes 

# Creo la matriz M indicandole que complete por filas
A <- matrix(data = c(1, 5, 8, 4, 8, 7, 9, 1, 3), ncol = 3, nrow = 3, byrow = T)

A[3,2] #Elemento de la fila 3 y la columna 2. NombreMatriz[fila,columna]
A[6] #Acceder al elemento indicando la posicion
#Tambien se podria hacer con which
velocidad<- matrix(c(10, NA, 15, 1, 5, NA, 20, NA, 50, NA, 12, 16), ncol =4)
which(is.na(velocidad)) #Posicion de los elementos que tienen NA
which(is.na(velocidad), arr.ind = T) #Para saber en q posiciones estan esos NA  

#Ejercicio
matriz_pp_verano<-matrix(c(28,40,43,130,153.2,152.9,118.9,135.4,127.2),ncol=3,nrow=3) #Creo la matrix
colnames(matriz_pp_verano)<-c("Mendoza","Jujuy","Buenos Aires") #Pongo nombre a las columnas
rownames(matriz_pp_verano)<-c("pp Diciembre","pp Enero","pp Febrero") #Pongo nombre a las filas
media<-colMeans(matriz_pp_verano) #Calcula el promedio
verano<-rbind(matriz_pp_verano,media) #Pego matriz y la columna medias

