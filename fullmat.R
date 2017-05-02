
##Cargar un df llamada fullmat
fullmat <- read.delim (file = "../meta/maizteocintle_SNP50K_meta_extended.txt")
fullmat
##Que tipo de objeto se creó
class(fullmat)
##Como ver las 6 primeras lineas del archivo
fullmat[1:6,]
##Cuantas muestras hay
nrow(fullmat)
##De cuantos estados se tienen muestras?
levels (fullmat$Estado)
##Cuantas muestras fueron colectadas antes de 1980
sum(fullmat$A.o._de_colecta<1980, na.rm = T)
##Cuantas muestras hay de cada raza?
levels(fullmat$Raza_Primaria)
sum(fullmat$Raza=="Ancho")
sum(fullmat$Raza=="Arrocillo")
sum(fullmat$Raza=="Blando de Sonora")
sum(fullmat$Raza=="C\xcc_nico")
sum(fullmat$Raza=="C\xcc_nico Norte̱o")
sum(fullmat$Raza=="Celaya")
sum(fullmat$Raza=="Chapalote")
sum(fullmat$Raza=="Complejo Serrano de Jalisco")
sum(fullmat$Raza=="Coscomatepec")
sum(fullmat$Raza=="Dulce")
sum(fullmat$Raza=="Dzit-Bacal")
sum(fullmat$Raza=="Elotes C\xcc_nicos")
sum(fullmat$Raza=="Gordo")
sum(fullmat$Raza=="mexicana")
sum(fullmat$Raza=="Nal-tel de Altura")
sum(fullmat$Raza=="Olotillo")
sum(fullmat$Raza=="Palomero de Chihuahua")
sum(fullmat$Raza=="parviglumis")
sum(fullmat$Raza=="Rat\xcc_n")
sum(fullmat$Raza=="Tablilla de Ocho")
sum(fullmat$Raza=="Tabloncillo Perla")
sum(fullmat$Raza=="Tepecintle")
sum(fullmat$Raza=="Tuxpe̱o Norte̱o")
sum(fullmat$Raza=="Zamorano Amarillo")
sum(fullmat$Raza=="Zapalote Grande")
sum(fullmat$Raza=="Apachito")
sum(fullmat$Raza=="Azul")
sum(fullmat$Raza=="Bofo")
sum(fullmat$Raza=="C\xcc_nico ")
sum(fullmat$Raza=="Cacahuacintle")
sum(fullmat$Raza=="Chalque̱o")
sum(fullmat$Raza=="Comiteco")
sum(fullmat$Raza=="Conejo")
sum(fullmat$Raza=="Cristalino de Chihuahua")
sum(fullmat$Raza=="Dulcillo del Noroeste")
sum(fullmat$Raza=="Elotero de Sinaloa")
sum(fullmat$Raza=="Elotes Occidentales")
sum(fullmat$Raza=="Jala")
sum(fullmat$Raza=="Mushito")
sum(fullmat$Raza=="Olot\xcc_n")
sum(fullmat$Raza=="Onave̱o")
sum(fullmat$Raza=="Palomero Toluque̱o")
sum(fullmat$Raza=="Pepitilla")
sum(fullmat$Raza=="Reventado")
sum(fullmat$Raza=="Tabloncillo")
sum(fullmat$Raza=="Tehua")
sum(fullmat$Raza=="Tuxpe̱o")
sum(fullmat$Raza=="Vande̱o")
sum(fullmat$Raza=="Zapalote Chico")
##En promedio ¿A que altitud fueron colectadas las muestras?
mean(fullmat$Altitud)
##A que altitud maxima y munima fueron colectadas
min(fullmat$Altitud)
max(fullmat$Altitud)
##Crea una df de datos solo con las muestras de la raza Olotillo
olotillo<-subset(fullmat, fullmat$Raza=="Olotillo")
##Crea una nueva df s´ólo con las muestras de las razas Reventador, Jala y Ancho
varias<-subset(fullmat, fullmat$Raza==c("Reventador", "Jala", "Ancho"))
##Escribe la matriz anterior a un archivo llamado "submat.csv en meta
write.csv(varias, "../meta/submat.csv") 


