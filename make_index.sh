#!/bin/sh
find data -maxdepth 1 -type d | sed -e '/^data$/d' | while read file
do
echo ${file}
./pages.sh ${file}
echo
done
./folders.sh
