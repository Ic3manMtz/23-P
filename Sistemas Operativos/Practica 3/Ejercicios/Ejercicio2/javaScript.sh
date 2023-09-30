#!/bin/bash

echo -e "\nIniciando compilación del servidor"
javac Servidor.java

if [ $? -eq 0 ]; then
    echo -e "\n\tCompilación del servidor exitosa!\n"
else
    echo -e "\n\tError en compilación, intente de nuevo\n"
    exit 1
fi


clear
java Servidor &
