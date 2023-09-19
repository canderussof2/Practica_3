#---------- Práctica 19/09 ----------
rm(list = ls())
#Tienen que tener las mismas dimensiones
n <- c(2, 3, 5)
s <- c("aa", "bb", "cc")
b <- c(TRUE, FALSE, TRUE)
df <- data.frame(n, s, b)

#Dataframe a partir de una matriz y un vector
rm(list = ls())
nombres <- c("Padre", "Madre", "Hijo")
m <- matrix(c(1:6),nrow=3)
v <- c(180,157,165)
df <- data.frame(familia= nombres, m, estatura=v)

#Otra forma de armar Dataframe
mi_df <- data.frame(
  "entero" = 1:4,
  "factor" = c("a", "b", "c", "d"),
  "numero" = c(1.2, 3.4, 4.5, 5.6),
  "cadena" = as.character(c("a", "b", "c", "d"))
)

dim(mi_df) #Para ver las dimensiones de mi dataframe

#El largo de un data frame es igual a su número de columna
length(mi_df)

#names() nos permite ver los nombres de las columnas
names(mi_df)

#Si los vectores que usamos para construir el data frame no son del
#mismo largo, los datos no se reciclaran. Se nos devolverá un error.
 data.frame(
"entero" = 1:3,
"factor" = c("a", "b", "c", "d"),
"numero" = c(1.2, 3.4, 4.5, 5.6),
"cadena" = as.character(c("a", "b", "c", "d"))
)
 
matriz <- matrix(1:12, ncol = 4)
#Usamos as.data.frame() para coercionar una matriz a un dat
df <- as.data.frame(matriz)
#Verificamos el resultado
class(df)


###############################################
#Manipulación de DF
rm(list=ls())

df <- mtcars #desde la base de datos de R con dataframe de autos
nrow(df) #Cantidad de filas
ncol(df) #Cantidad de columnas
head(df) #Ccceder a los primeros elementos

###############################################
#Entrar a los datos del DF

#Acceder a un elemento
#1. Por numero de filas y columnas:
  #Sintaxis:
  #dataframe[numero_fila, numero_columna]
df[1,4]
class(df[1,4]) #me da numeric pórque me devuelve un numero
#2. Por nombre de filas y columnas:
  #Sintaxis:
  #dataframe["nombre_fila", "nombre_columna"]
df["Mazda RX4", "hp"]
class(df["Mazda RX4", "hp"]) #me da numeric pórque me devuelve un numero

#Acceder a una columna
#1. Por numero de la columna:
  #Sintaxis:
  #dataframe[numero_columna]
#o dataframe[c(numero_columna_1,
              #numero_columna_2)]
#Esto ultimo es para acceder a varias columnas
selecciono_columna_1 <- df[1]
head(selecciono_columna_1)
class(df[1])
#Otra formaSintaxis:
#dataframe[[numero_columna]]
df[[1]]
#2. Por nombre de la columna:
  #Sintaxis:
  #dataframe["nombre_columna"]
#o dataframe[c("nombre_columna_1",
              #"nombre_columna_2)]
#Esto ultimo es para acceder a varias columnas
selecciono_columna_mpg <- df["mpg"]
head(selecciono_columna_mpg)
class(df["mpg"])
#Otra forma
#Sintaxis:
  #dataframe[["nombre_columna"]]
#o dataframe$nombre_columna
df[["mpg"]]

#Acceder a una fila
#1. Por numero de la fila:
  #Sintaxis:
  #dataframe[numero_fila,]
#o dataframe[c(numero_fila1, numero_fila_2),]
#Esto último es para acceder a mas de una fila
df[2,]
#2. Por nombre de la fila:
  #Sintaxis:
  #dataframe["nombre_fila",]
#o dataframe[c("nombre_fila_1",
              "nombre_fila_2"),]
#Esto último es para acceder a mas de una fila
df["Datsun 710",]

##################################################
#indexación lógica
#Sintaxis
#dataframe[condicional sobre dataframe$nombre_columna, ]
#o subset(dataframe, condicional sobre nombre_columna)
df[df$mpg > 20,] #me quedo con las filas en las que se verifique que los valores
#de la columna "mpg" sean > 20
subset(df, mpg > 20) #me quedo con las filas en las que se verifique que los
#valores de la columna "mpg" sean > 20

################################################################
#Editar DF
#Combinar data frames
#Sintaxis:
 # merge(df_1, df_2)
#genero dataframe para agregar al data frame mtcars
df_personas <- data.frame("Personas" = c(rep(4, 4), rep(2, 16), rep(5, 12))) #genero 
#dataframe de 32 filas
# incorporo nombres al dataframe df_personas igual al nombre de las filas de mtcars
df_personas$Model <- rownames(mtcars)
mtcars$Model <- rownames(mtcars)
#combino los data frames
df_combinada <- merge(mtcars, df_personas)
head(df_combinada)

#Borrar una columna
#Sintaxis:
  #df$nombre_columna <- NULL
df_combinada$Personas <- NULL
head(df_combinada)

#Cambio orden de columnas
desordeno <- mtcars[c(1, 12, 2:11)] #llevo columna 12 a la posicion de la columna 2
head(desordeno)

####################################################
#Ejercicio
rm(list=ls())
dfc<-data.frame("Base"=c(2,6,13,20),"Altura"=3:4,row.names=c("Parcela 1","Parcela 2","Parcela 3","Parcela 4"))
dim(dfc)
sup<-dfc[,1]*dfc[,2]
dfc$sup<-sup
#tamb puede ser cbind o pedirle a cam la otra forma
#esto de abajo da raro pero deberia dar
supbien<-as.data.frame(sup)
df_comb <- merge(dfc, supbien)
