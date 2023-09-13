#!/bin/bash

echo 'Compilando programa...'
gcc analizar.c -o analizar

echo 'Ingresa el directorio a analizar...'
read directorio

#se usa la bandera -d para saber si el directorio existe
if [ -d "$directorio" ]
then
    echo -e '\nEjecutando programa analizar'
    ./analizar $directorio
else
    echo "El directorio ${DIRECTORIO} no existe, intenta de nuevo"
fi


