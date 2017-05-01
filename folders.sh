#!/bin/sh
cd ./data
find . -maxdepth 1 -type d | sed -e 's/^\.\///' > .temp
awk -f - .temp << EOS > folders.js
BEGIN{
	print "var folders = new Array();";
	count = 0;
}
!/^\.$/{
	print "folders[" count++ "] = \"" \$0 "\";"; 
}
EOS
rm .temp
