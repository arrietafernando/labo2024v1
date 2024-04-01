# Este script almacena definitivamente sus cinco semillas
# en el bucket, de forma que NO deba cargarlas en cada script

require( "data.table" )

# reemplazar aqui por SUS semillas 
#mis_semillas <- c(102191, 200177, 410551, 552581, 892237)
mis_semillas = c(591067, 157991, 689987, 136999, 366467)

tabla_semillas <- as.data.table(list( semilla = mis_semillas ))

fwrite( tabla_semillas,
    #file = "~/buckets/b1/datasets/mis_semillas.txt",
    file = "../../buckets/b1/datasets/mis_semillas.txt",
    sep = "\t"
)
