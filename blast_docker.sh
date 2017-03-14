#! /bin⁄bash

######Scrip para correr blast en docker#####

####primero installar(pullear) blast 

docker pull biocontainers/blast

####para observar la ayuda de blast se puede usar:

docker run biocontainers/blast blastp -help

###un ejemplo para usar blast.
###Queremos ver si la proteina prion del zebrafish es similar a la proteina prion del ser humano
###primero debe se debe descargar la secuencia de la proteina prion en humanos de Uniprot

wget http://www.uniprot.org/uniprot/P04156.fasta

#####Después descargar la base de datos de zebrafish

curl -O ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz

###Descomprimir

gunzip zebrafish.1.protein.faa.gz

####Preparar la base de datos, crear un volumen

docker run -v /Users/gissellapineda/Desktop/Blast_prueba:/data/ biocontainers/blast makeblastdb -in zebrafish.1.protein.faa -dbtype prot

####Realizar el alinemiento final

docker run -v /Users/gissellapineda/Desktop/Blast_prueba:/data/ biocontainers/blast blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt

####Los resultados podrán ser observados en el archivo results.txt