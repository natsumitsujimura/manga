#!/bin/sh
cd "$*"
ls > .temp
awk -f - .temp <<EOS > pages.js
BEGIN{
	print "var pagefile = new Array();";
	count = 0;
}
/jpg$/ || /jpeg$/ || /png$/{
	print "pagefile[" count++ "] = \"" \$0 "\";"; 
}
EOS
rm .temp
