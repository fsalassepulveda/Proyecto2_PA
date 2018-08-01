#!/bin/bash
echo "La cantidad de archivos en HOME que presentan un peso mayor a 1024 mbyts corresponden a :"
cd $HOME
ls -lR | awk '$5 > 8192000 { print $9 " --- " $5 }'