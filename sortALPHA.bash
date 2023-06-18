#/bin/bash

cat $1 | cut -f1 -d":" > sort1.txt
while true; do
COUNT=0
PASSCOUNT=0
LINECOUNT=0
while read LINE; do
PASSCOUNT=0
LINECOUNT=0
touch sort2.txt
if [[ -s sort2.txt ]]; then
PASS=`cat sort2.txt | tr -d "\n"`
export PASS
if [[ $LINE < $PASS ]]; then
echo $LINE >> sorted.txt | tr -s "\n"
echo $PASS > sort2.txt
((COUNT=COUNT+1))
PASSCOUNT=1
else
echo $PASS >> sorted.txt | tr -s "\n"
echo $LINE > sort2.txt
VAL=`cat sort2.txt | tr -d "\n"`
export VAL
LINECOUNT=1
fi
else
echo $LINE > sort2.txt
continue
fi
done < sort1.txt
if [[ $PASSCOUNT -eq 1 ]]; then
echo $PASS >> sorted.txt | tr -s "\n"
fi
if [[ $LINECOUNT -eq 1 ]]; then
echo $VAL >> sorted.txt | tr -s "\n"
fi
if [[ $COUNT -eq 0 ]]; then
cat sorted.txt > TOGREPALPHA.txt
rm sorted.txt
rm sort2.txt
break
else
cat sorted.txt > sort1.txt | tr -s "\n"
fi
rm sorted.txt
rm sort2.txt
done