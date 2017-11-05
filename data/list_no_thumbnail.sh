#!/bin/bash
find . -maxdepth 1 -type d | sed -e 's/^\.\///' > 1.tmp
find . -maxdepth 2 -type d | grep thumbnail | sed -e 's/^\.\///' | sed -e 's/\/thumbnail$//' > 2.tmp
diff 1.tmp 2.tmp
rm 1.tmp 2.tmp
