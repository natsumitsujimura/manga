#!/bin/sh
./folders.sh
find data -maxdepth 1 -type d | sed -e '/^data$/d' | while read file
do
./pages.sh ${file}
done
