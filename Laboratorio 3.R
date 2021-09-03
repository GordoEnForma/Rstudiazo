print(iris)
str(iris)
summary(iris)



my.iris <- iris
head(my.iris)

ls() #Objetos creados en memoria por nosotros

rm(my.iris) #Borrar el objeto my.iris
ls()


my.iris <- iris
head(my.iris)

my.iris$Petal.Area <- my.iris$Petal.Length * my.iris$Petal.Width

my.iris$Petal.Area <- NULL


my.iris <-iris[order(iris$Sepal.Length),]


# Creación de Vectores
x <-1:10

y <-iris$Species
y # Esta compuesto por las categorías(niveles ) de las especies del dataset Iris

ls()

1:5
5:1
c(1:5,5:1)

seq(1,5)
rep(1:5,5) #Repetir una secuencia n veces
rep(1:5,each = 5) #Repite cada elemento n veces


#Exploración de Vectores

plot(x)

table(y)

summary(y)

head(x)

tail(x)

table(iris$Species)

x <- x^2
x

x[1:3]
x[c(1,3)]

x[x>25]

x[3:1]

x[-(1:2)]
x

x[-length(x)] #Remueve el elemento en la posición señalada

w <-table(iris$Species)
w["setosa"]

w[c("setosa","virginica")]

my.iris <- iris 
colnames(my.iris)[5]<-"Especie"
colnames(my.iris)


z<-table(iris$Species)

names(z)
names(z)[1] <- "Tipo 1"
names(z)

z <-1:10
z

z[z<5]<-100

x<-1:10

sample(x,4) #Elegir 4 elementos aleatorios del vector x

sample(x,50,replace=TRUE)

#Funciones

x<- 1:10

mean(x)
max(x)
median(x)

sum(x)
prod(x)

suma_cuadrados <- function(x) sum(x*x)

suma_cuadrados(x)

media <- function(x){
  longitud <-length(x)
  suma<-sum(x)
  suma/longitud
}

media(x)

tapply(iris$Petal.Length, iris$Species, mean)


# Creación de Listas

is.list(iris)

x <-list("a" = 2.5, "b" = TRUE, c= 1:3)
x$a

typeof(x)
length(x)

str(x)

x <- list(2,TRUE,1:3)
x


x <- list(name = "John", age = 19, speaks = c("English", "French"))
x$name
x$age
x$speaks

x[c(1:2)]

x[-2]

x[c(T,F,F)]

x[c("age","speaks")]
  
x[["name"]] <-"Patricia";x

x[["married"]] <- TRUE
x[["age"]] <- NULL

str(x)

x$married <- NULL

# Gráfico de datos

hist(iris$Sepal.Width)


hist(iris$Sepal.Width,main="Iris: Histograma de la anchura de los petalos",
     xlab ="anchura del sépalo", ylab = "frecuencia",
     col = "steelblue")

barplot(table(iris$Species))

plot(iris$Petal.Length, iris$Petal.Width, main="Edgar Anderson's Iris Data")

boxplot(iris$Sepal.Width ~ iris$Species, col = "gray", main = "Especies
de iris\nsegún la anchura del sépalo")
