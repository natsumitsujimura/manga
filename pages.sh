#!/bin/bash
cd "$*"
if [ -e pages.js ]; then
echo pages.js exist in $0
else
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
fi

#generate thumbnail file in subdirectory 'thumbnail'

if [ -e thumbnail ]; then
	echo directry thumbnail exist in $0
else
	mkdir thumbnail
	if ls *.jpg  > /dev/null 2>&1 ; then for i in *.jpg ;  do convert -thumbnail 90 "$i" thumbnail/"$i"; done; fi
	if ls *.jpeg > /dev/null 2>&1 ; then for i in *.jpeg;  do convert -thumbnail 90 "$i" thumbnail/"$i"; done; fi
	if ls *.png  > /dev/null 2>&1 ; then for i in *.png ;  do convert -thumbnail 90 "$i" thumbnail/"$i"; done; fi
fi
