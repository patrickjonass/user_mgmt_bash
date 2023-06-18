#!/bin/bash

while true; do
echo -n "Enter the location of batch file (use absolute path): "
read LOC
if [[ -s $LOC ]]; then
echo $LOC | grep .bat > test.txt
cat test.txt
if [[ -s test.txt ]]; then
while read LINE; do
FNAME=`echo $LINE | cut -f1 -d":"`
LNAME=`echo $LINE | cut -f3 -d":"`
CHKNUM=`echo $LINE | cut -f9 -d":" `
CHKMAIL=`echo $LINE | cut -f10 -d":" `
cat AddressBook.txt | grep -w $CHKNUM > test.txt
cat AddressBook.txt | grep -w $CHKMAIL > test1.txt
if [[ -s test.txt || -s test1.txt ]]; then
echo "Guest $FNAME $LNAME has an existing mobile number or email!"
echo "Guest $FNAME $LNAME cannot be added!"
echo "Error: Guest $FNAME $LNAME cannot be added! --> LOAD `date`" >> RESandERR.bat
else
echo $LINE >> AddressBook.txt
echo "Guest $FNAME $LNAME successfully added!"
echo "Result: Guest $FNAME $LNAME successfully added! --> LOAD `date`" >> RESandERR.bat
fi
done < $LOC
else
echo "File is not a batch file!"
echo "Error: File is not a batch file! --> LOAD `date`" >> RESandERR.bat
fi
else
echo "File might not be existing or has no contents!"
echo "Error: File might not be existing or has no contents! --> LOAD `date`" >> RESandERR.bat
fi
while true; do
echo " Do you still want to load contacts? Y or N "
echo -n " Enter choice: "
read LINP
if [[ $LINP = [Yy] ]]; then
break
elif [[ $LINP = [Nn] ]]; then
break 2
else
echo "Invalid Input!"
fi
done
done