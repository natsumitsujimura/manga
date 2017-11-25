#!/bin/sh
cd ./data
find . -maxdepth 1 -type d | sed -e 's/^\.\///' > .temp
awk -f - .temp << EOS > folders.js
BEGIN{
	print "var folders = new Array();";
	print "var thumbnail = new Array();";
	count = 0;
}
!/^\.$/{
        print "folders[" count "] = \"" \$0 "\";";

        cmd = "ls \"" \$0 "/thumbnail\" | head -n 1";
        cmd | getline t;
        print "thumbnail[" count "] =\"" t "\";";

        count++;
}
EOS
rm .temp
