#!/bin/sh
cd "$*"
ls > .temp
awk -f - .temp <<EOS > pages.js
BEGIN{
	print "var pagefile = new Array();";
	count = 0;
}
/jpg$/{
	print "pagefile[" count++ "] = \"" \$0 "\";"; 
}
EOS
rm .temp
