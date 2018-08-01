#!/bin/bash
echo "1ngrese el nombre del directorio o fichero que desea  buscar"
cd $HOME
val="$(find $HOME | grep "$1")"
echo "El elemento existe en esta ruta: "  $val
result="$(file $val)"
echo "El fichero es de tipo: " $result

clear
echo -e "DIRECTORIOS ENCONTRADOS: "
ls -lh $HOME| grep ^d | awk 'sum +=1 {print "-" $9} END{print "Total directorios: " sum }'
echo -e "\n--------------------------------------------------------------------"

echo -e "\n FICHEROS ENCONTRADOS: "
ls -lh $HOME| grep ^d | awk 'sum +=1 {print "-" $9} END{print "Total ficheros: " sum }'
echo -e "\n--------------------------------------------------------------------"

echo -e "PROCESOS QUE CONSUMEN MAS CPU: \n"
ps -eo cmd,%cpu --sort=-%cpu | head -n4 | grep "^/"

echo -e "PROCESOS QUE CONSUMEN MAS MEMORIA: \n"
ps -eo cmd,%cpu --sort=-%mem | head -n4 | grep "^/"

ls -lR $HOME |awk ' {suma += $5 } END {print "El tamaño total de los archivos en /home es: " suma/1024 " MB" }'



