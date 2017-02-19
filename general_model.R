# Instalar paquete sin conexion a internet:

install.packages(pks='escritorio/ISLR_1.0.zip',type='source',repos=null)

# Cargamos el dataset:
data("Smarket") # Smarket es un dataframe que consta de 1250 observaciones y 9 variables

# matriz de correlacion:

cor(Smarket[,-9])

# Ajustamos un modelo de regresion logistica para predecir la variable direction 
attach(Smarket)

modelog<-glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,family = 'binomial',data = Smarket)

# usamos la funcion sample para dividir el dataset en un training set y testingset:

tr<-sample(1:1250,875)

training_set<-Smarket[tr,]
testing_set<-Smarket[-tr,] 

# le decimos al modelo que aprenda a partir del training

modelog_training<-glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,family = 'binomial',data = training_set)

# usamos el modelo sobre el conjunto testing

predict.glm(modelog_training,newdata = testing_set,type = 'response') # la salida del modelo es un conjunto de
                                                                      # numeros que indican la pertenencia o no a la clase 
                                                                      # si el valor es mayor o menor que 0,5
