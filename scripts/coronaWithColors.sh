#/usr/bin/env bash
 curl -s 'https://corona-stats.online?source=2' |
   grep USA |
   #sed 's/\[[0-9][0-9]m/ /g' |
   sed 's/ //g ; s/║//g ; s/│/;/g' |
   awk -F';' '{print "COVID-19 - "$2"  Total: "$3"   New: "$4"   Deaths: "$5"  New Deaths: "$6}' 
