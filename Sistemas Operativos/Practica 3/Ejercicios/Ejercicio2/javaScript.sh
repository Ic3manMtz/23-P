#!/bin/bash

function menuCliente(){
    while true
    do
        echo -e "\n\tMenú de cliente:"
        echo -e "\nDeseas crear un cliente? s/n"
        read opcion

        case $opcion in
        s)
            echo -e "\nIniciando compilación del cliente"
            javac Cliente.java

            if [ $? -eq 0 ]; then
                echo -e "\n\tCompilación del cliente exitosa!\n"
            else
                echo -e "\n\tError en compilación, intente de nuevo\n"
                exit 1
            fi

            java Cliente
            ;;
        n)
            echo "Saliendo..."
            break
            ;;
        *) echo "Opción no válida"
            ;;
        esac
    done
}

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


#sleep 2

#menuCliente

#killall java

#echo "Ingresa el número de procesos..."
#read processes

#for ((i=0; i<$processes; i++))do
#    fuser -k 600$i/tcp &>/dev/null
#    echo "Ejecutando el programa para el proceso [$i]"
#    java Peer $i $processes &
#done

