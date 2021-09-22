

data <- read.csv('missing-data.csv',na.strings = "")

data.limpia <-na.omit(data)

is.na(data[4,2])

is.na(data[4,1])


is.na(data$Income)


data.income.limpio <- data[!is.na(data$Income),]

complete.cases(data)

data.limpia2 <-data[complete.cases(data),]

data$Income[data$Income == 0]

data$Income[data$Income == 0] <- NA

data$Income[data$Income == 0]


mean(data$Income, na.rm = TRUE)

sd(data$Income)

sd(data$Income, na.rm = TRUE)

sum(data$Income)

sum(data$Income, na.rm=TRUE)


data <- read.csv('missing-data.csv',na.strings = "")
data$Income[data$Income == 0] <- NA
data$Income.mean <- ifelse(is.na(data$Income),mean(data$Income,na.rm = TRUE),data$Income)


rand.valor <- function(x){
  
  faltantes <-is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <-sample(x.obs,tot.faltantes, replace = TRUE)
  return (valorado)
}


random.df <-function(df,cols){
  nombres <- names(df)
  for (col in cols){
    nombre <-paste(nombres[col], "valorado",sep=".")
    df[nombre] <- rand.valor(df[,col])
  }
  df
}

data.limpio <-random.df(data, c(1,2))
View(data.limpio)


familia.salario <- c(40000,60000,50000, 80000, 60000, 70000, 60000)
familia.integrantes <- c(4,3,2,2,3,4,3)
familia.auto <- c("Lujo", "Compacto", "SUV", "Lujo", "Compacto", "Compac
                    to", "Compacto")
familia <- data.frame(familia.salario, familia.integrantes, familia.auto)

View(familia)

duplicated(familia)

familia[duplicated(familia),]

unique(familia)

familias.unique <- unique(familia)

