#!/bin/bash

declare -a state
c=0

read region profit <<< $(gawk -F "\t" 'NR>1 {summm[$13] += $21}
END {
  for(i in summm){
    print i, summm[i]
  }
}' Sample-Superstore.tsv | LC_ALL=C sort -nrk2 | tail -1)

echo "Region dengan profit terendah adalah "$region" dengan profit sebesar "$profit
printf "\n\n"

gawk -F "\t" -v reg=$region 'NR>1 {if($13==reg){summm[$11] += $21}}
END {
  for(j in summm){
    print j, summm[j]
  }
}' Sample-Superstore.tsv | LC_ALL=C sort -nrk2 | tail -2 | cut -d " " -f1 > temp1.txt

echo "2 negara yang memiliki profit terendah di region "$region" adalah"
while IFS= read -r line;
do
  state+=($line)
  echo "- "${state[c]}
  c=$c+1
done < temp1.txt
printf "\n\n"


echo "10 produk yang memiliki keuntungan paling rendah di negara "${state[0]}" atau negara "${state[1]}" adalah sebagai berikut."
echo "-------------------------------------------------------------------"

gawk -F "\t" -v stat1=${state[0]} -v stat2=${state[1]} 'NR>1 {if(($11==stat1) || ($11==stat2)){summm[$17] += $21}}
END {
  for(k in summm){
    print "- "k";"summm[k]
  }
}' Sample-Superstore.tsv | LC_ALL=C sort -gk2 -t ";" | head -10 | cut -d ";" -f1

rm temp1.txt
