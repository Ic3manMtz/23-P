#!/bin/bash

echo "Ingresa la cantidad N de cadenas que se generarán:"
read nCadenas

echo "Deseas guardar las cadenas en un archivo? (s/n)"
read guardarArchivo

if [ "$guardarArchivo" = "s" ]; then
    echo "Por favor ingresa el nombre del archivo:"
    read nombreArchivo

    echo Cadenas generadas > "$nombreArchivo"
fi


for (( i=1; i<=$nCadenas; )); do
    random_length=$(( RANDOM % 5 + 8 ))  #Tamaño random entre 8 y 12

    characters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%&"
    random_string=""

    # Cadena aleatoria, hasta que la cadena sea del tamaño obtenido
    while [ ${#random_string} -lt $random_length ]; do
        random_char="${characters:RANDOM % ${#characters}:1}"
        random_string+=$random_char
    done

    # grep -o obtiene todas las ocurrencias de los caracteres , wc -l las cuenta
    num_count=$(echo $random_string | grep -o [0-9] | wc -l)
    uppercase_count=$(echo $random_string | grep -o [A-Z] | wc -l)
    lowercase_count=$(echo $random_string | grep -o [a-z] | wc -l)
    special_count=$(echo $random_string | grep -o '[@#$%&]' | wc -l)

    if [[ $num_count -ge 2 && $uppercase_count -ge 2 && $lowercase_count -ge 2 && $special_count -ge 2 ]]; then
        
        if [ "$guardarArchivo" = "s" ]; then
            echo "($i) : $random_string" >> "$nombreArchivo"
        else
            echo "Generated string ($i): $random_string"
        fi 

        let i++
    fi
done

if [ "$guardarArchivo" = "s" ]; then
    echo "Cadenas guardas en $nombreArchivo exitosamente"
fi
