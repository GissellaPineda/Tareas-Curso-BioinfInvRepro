rm(list=ls())

##Script para correr SNPrelate

source("http://bioconductor.org/biocLite.R")
biocLite("gdsfmt")
biocLite("SNPRelate")

library(gdsfmt)
library(SNPRelate)

#COnverit el VCF en GDS
vcf.fn <- "../data/SNPrelate/Hypsiboas2"
##reformatear
snpgdsVCF2GDS(vcf.fn, "../data/SNPrelate/Hypsi.gds", method="biallelic.only")
##Resumen
snpgdsSummary("../data/SNPrelate/Hypsi.gds")

##Abrir el archivo GDS
genofile <- snpgdsOpen("../data/SNPrelate/Hypsi.gds")

##Obtener informacion de las Poblaciones
pop_code <- scan("../data/SNPrelate/pop.txt", what=character())
table(pop_code)
head(pop_code)

##PCA
pca <- snpgdsPCA(genofile, sample.id = NULL, snp.id = NULL, autosome.only = F, num.thread=2)

##Revisar proporcion de la varianza
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))

##Crear una data.frame
tab <- data.frame(sample.id = pca$sample.id,
                  EV1 = pca$eigenvect[,1],    # primer eigenvector
                  EV2 = pca$eigenvect[,2],    # segundo eigenvector
                  stringsAsFactors = FALSE)
head(tab)

##Graficar
plot(tab$EV2, tab$EV1, xlab="eigenvector 2", ylab="eigenvector 1")

##Revisar que las muestras y las poblaciones esten en el mismo orden
sample.id
pop_code
head(cbind(sample.id, pop_code))

##Crear una nueva data.frame con los anteriores datos
tab <- data.frame(sample.id = pca$sample.id,
                  pop = factor(pop_code)[match(pca$sample.id, sample.id)],
                  EV1 = pca$eigenvect[,1],    # primer eigenvector
                  EV2 = pca$eigenvect[,2],    # segundo eigenvector
                  stringsAsFactors = FALSE)
head(tab)

##Establecer paleta de colores
palette(c("red", "green", "blue"))

##Graficar nuevamente con la informacion poblacional
plot(tab$EV2, tab$EV1, col=as.integer(tab$pop), xlab="eigenvector 2", ylab="eigenvector 1")
legend("bottomright", legend=levels(tab$pop), pch="o", col=1:nlevels(tab$pop))


