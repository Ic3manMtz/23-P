#! /bin/bash

echo -e 'Bitacora de usuarios\n' > bitacora
n=1

echo Para terminar presiona Ctrl + c

while

tm=$(date '+%B %V %T.%3N')
echo Consulta $n >> bitacora
echo "Fecha y hora de consulta: ${tm}" >> bitacora
echo '' >> bitacora
ps -eo user | sort | uniq >> bitacora; do

sleep 1
let n++
echo >> bitacora

done