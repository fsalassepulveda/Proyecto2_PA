#!/bin/bash
#INICIO
#Dia+hora LISTO
#Host (nombre de la maquina) LISTO
#Estado de la cpu + uso de memoria 
#Estado de los discos (espacio utilizado + disponible) LISTO(?
#Visualizar usuario que ejecuta y tiempo actual de login KSILISTO:
#Mostrar cuantos archivos y Mb tiene el usuario en /home KSILISTO

clear
echo -e "BIENVENIDE $USER
-----------------------
`date +"%A %d/%m/%Y %H":"%M"`\n"

echo -e "INFORMACION DEL SISTEMA:
------------------------"
echo "Nombre de la maquina (Host): `uname -n` " 
echo "Sistema operativo: `uname -o`" 
echo "MEMORIA"
free --mega| grep "Memoria: " | awk '{print "	Espacio libre de la memoria: " $3 " MB"}'
free --mega | grep "Swap:" | awk '{print "	Espacio libre de la memoria virtual: " $3 " MB"}' 
free -t --mega| grep "Total:" | awk '{print "	Espacio usado  total ocupado de la memoria: " $3" MB"}'

uptime -p|awk '{print "Tiempo en linea: " $2 " Hora(s) " $4 " minuto(s)" }' #ARREGLAR PARA CASO EN QUE LLEVE SOLO MINUTOS
echo "Cantidad de archivos en /home : `ls -lR $HOME |wc -c`"
ls -lR $HOME |awk ' {suma += $5 } END {print "El tamaño total de los archivos en /home es: " suma/1024 " MB" }'

#awk 'BEGIN { print "Usuario activo:  "} $3 >= 1000 { print "	- "$1  | "sort -r"}' FS=":" /etc/passwd #CÓMO USAR 'FOR'CON AWK 
#top -bn1 | awk '/Mem/ { mem = "Memoria en uso: " $5 / $3 * 100 "%" }; /Cpu/ { cpu = "CPU en uso: " 100 - $8 "%" }; END { print mem ", " cpu }'

top -bn1 |grep "%Cpu"| awk '{print "CPU \nOcupado por usuario " $2 " % "   "\nEspera "  $10 " % "   "\nSistema "  $4 " % "}'

echo "escribe algo"



