### Análisis Exploratorio del DataSet de Titanic
### Alumno: Gustavo Espinoza Mendieta


titanic <- read.csv("titanic_data.csv",header =TRUE, sep = ',') 

View(titanic)

head(titanic)
names(titanic)
str(titanic)

summary(titanic)


titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

#función que despliega cuantos valores NA posee cada variable
sin_valor <- function(x) {
  for(i in 1:ncol(x))
  {
    cat("En la columna",colnames(x[i]),"total de valores NA:",colSums(is.na(x[i])),"\n")
  }
}

sin_valor(titanic)

en_blanco <- function(x){
  for(i in 1:ncol(x)){
    cat("En la columna",colnames(x[i]),"total de valores en blanco",colSums(x[i]==""),"\n")
  }
}

en_blanco(titanic)


titanic$PassengerId[titanic$Embarked == ""]

titanic$Pclass[titanic$PassengerId == 62]
titanic$Fare[titanic$PassengerId == 62]


titanic$Pclass[titanic$PassengerId == 830]
titanic$Fare[titanic$PassengerId == 830]

library(dplyr)

embark_fare <-titanic%>%filter(PassengerId != 62 & PassengerId != 830)


library(ggplot2)
library(scales)

ggplot(data =embark_fare, aes(x = Embarked,y = Fare, fill= factor(Pclass))) +
  geom_boxplot() +
  geom_hline(aes(yintercept = 80),
             colour = "red",linetype = "dashed", lwd = 2)+
  scale_y_continuous(labels = dollar_format())+
  theme_bw()

titanic$Embarked[c(62,830)] <- "C"

table(titanic$Survived)


barplot(table(titanic$Survived), 
        main="Pasajeros en Titanic",names=c("Murieron", "Sobrevivieron"))

prop.table(table(titanic$Survived))

barplot(table(titanic$Pclass), main="Pasajeros de Titanic por Clase", 
        names= c("Primera", "Segunda", "Tercera"))

table(titanic$Sex)

barplot(table(titanic$Sex), main="Pasajeros del Titanic por Gen
        ero", names= c("Mujer", "Hombre"))

counts = table(titanic$Survived, titanic$Sex)
barplot(counts, col=c("green","yellow"), legend = c("Murieron", "Sobr
                                                    evivieron"), main = "Sobreviviencia de Pasajeros por Genero")

counts1 = table(titanic$Survived, titanic$Pclass)


barplot(counts1, col=c("green","yellow"), 
        legend = c("Murieron","Sobrevivieron"), 
        main = "Sobreviviencia de Pasajeros por Clase", 
        names= c("Primera", "Segunda", "Tercera"))

