#!/bin/bash

while true; do
echo -n " Enter e-mail of the account you wish to delete: "
read DINP
echo $DINP | egrep -x "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}" > test.txt
if [[ -s test.txt ]]; then
cat AddressBook.txt | grep $DINP > testacc.txt
if [[ -s testacc.txt ]]; then
FNAME=`cat testacc.txt | cut -f1 -d":"`
LNAME=`cat testacc.txt | cut -f3 -d":"`
export FNAME; export LNAME
echo " This account belongs to $FNAME $LNAME "
echo " Are you sure you want to delete this guest? Y or N"
echo -n " Enter choice: "
read DEL
while true; do
if [[ $DEL = [Yy] ]]; then
sed /$DINP/d AddressBook.txt > testacc.txt
cp testacc.txt AddressBook.txt
echo "Guest successfully deleted!"
echo "Result: Guest successfully deleted! --> DELETE `date`" >> RESandERR.bat
break
elif [[ $DEL = [Nn] ]]; then
break
else
echo "Invalid Input!"
echo "Error: Invalid Input! --> DELETE `date`" >> RESandERR.bat
fi
done
else
echo "Guest account does not exist!"
echo "Error: Guest account does not exist! --> DELETE `date`" >> RESandERR.bat
fi
while true; do
echo "Do you want to delete another account? Y or N "
echo -n "Enter choice: "
read DTRY
if [[ $DTRY = [Yy] ]]; then
break
elif [[ $DTRY = [Nn] ]]; then
break 2
else
echo "Invalid Input!"
fi
done
else
echo "Enter valid e-mail!"
echo "Error: Enter valid e-mail! --> DELETE `date`" >> RESandERR.bat
fi
done