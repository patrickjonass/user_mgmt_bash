#!/bin/bash

while true; do
ALPHA=0
NUM=0
SCHAR=0
checkSpecial() {
echo $1 | grep [\~\`\!\@\#\$\%\^\&\*\(\)\_\+\-\=\<\>\?\,\.\/\:\"\;\'\{\}\|] > test.txt
if [[ -s test.txt ]]; then
SCHAR=1  #contains special char
else
SCHAR=0
fi
}
checkAlpha() {
echo $1 | grep [0123456789] > test.txt
if [[ -s test.txt ]]; then
ALPHA=1  #contains num
else
ALPHA=0  #does not conatain num
fi
}
checkNum() {
echo $1 | grep -i [A-Z] > test.txt
if [[ -s test.txt ]]; then
NUM=1 #contains alpha
else
NUM=0 #does not contain alpha
fi
}
clear
echo " PLEASE COMPLETE THE FOLLOWING DETAILS! "
####################################################
echo "    N A M E  D E T A I L"
while true; do
echo -n " Enter first name: "
read FNAME
checkAlpha $FNAME
checkSpecial $FNAME
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Name must only contain alphabets!"
echo "Error: Name must only contain alphabets! --> ADD `date`" >> RESandERR.bat
continue
fi
FNAME=`echo $FNAME | tr [a-z] [A-Z]`
export FNAME
break
done
while true; do
echo -n " Enter middle name: "
read MNAME
checkAlpha $MNAME
checkSpecial $MNAME
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Name must only contain alphabets!"
echo "Error: Name must only contain alphabets! --> ADD `date`" >> RESandERR.bat
continue
fi
MNAME=`echo $MNAME | tr [a-z] [A-Z]`
export MNAME
break
done
while true; do
echo -n " Enter last name: "
read LNAME
checkAlpha $LNAME
checkSpecial $LNAME
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Name must only contain alphabets!"
echo "Error: Name must only contain alphabets! --> ADD `date`" >> RESandERR.bat
continue
fi
LNAME=`echo $LNAME | tr [a-z] [A-Z]`
export LNAME
break
done
####################################################
echo "    A G E  D E T A I L"
while true; do
echo -n " Enter your age: "
read AGE
checkNum $AGE
checkSpecial $AGE
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Age detail must only contain numbers!"
echo "Error: Age detail must only contain numbers! --> ADD `date`" >> RESandERR.bat
continue
else
if [[ $AGE -gt 125 || $AGE -le 0 ]]; then
echo "Enter valid age number!"
echo "Error: Enter valid age number! --> ADD `date`" >> RESandERR.bat
continue
fi
fi
break
done
####################################################
echo "    B I R T H D A Y  D E T A I L"
while true; do
echo -n " Enter your birthmonth (1-12): "
read BMONTH
checkNum $BMONTH
checkSpecial $BMONTH
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Birthday detail must only contain numbers!"
echo "Error: Birthday detail must only contain numbers! --> ADD `date`" >> RESandERR.bat
continue
else
if [[ $BMONTH -gt 12 || $BMONTH -lt 1 ]]; then
echo "Enter valid month!"
echo "Error: Enter valid month! --> ADD `date`" >> RESandERR.bat
continue
fi
fi
break
done
while true; do
echo -n " Enter day of your birth (1-31): "
read BDAY
checkNum $BDAY
checkSpecial $BDAY
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Birthday detail must only contain numbers!"
echo "Error: Birthday detail must only contain numbers! --> ADD `date`" >> RESandERR.bat
continue
else
if [[ $BDAY -gt 31 || $BDAY -lt 1 ]]; then
echo "Enter valid day!"
echo "Error: Enter valid day! --> ADD `date`" >> RESandERR.bat
continue
fi
fi
break
done
while true; do
echo -n " Enter your birthyear (YYYY): "
read BYEAR
checkNum $BYEAR
checkSpecial $BYEAR
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Birthday detail must only contain numbers!"
echo "Error: Birthday detail must only contain numbers! --> ADD `date`" >> RESandERR.bat
continue
else
CURR=`date +%Y`
export CURR
((OLD=CURR-150))
if [[ $BYEAR -gt $CURR || $BYEAR -lt $OLD ]]; then
echo "Enter valid year!"
echo "Error: Enter valid year! --> ADD `date`" >> RESandERR.bat
continue
fi
fi
break
done
####################################################
echo "    G E N D E R  S P E C I F I C A T I O N "
while true; do
echo " Enter either M or F "
echo -n " Enter your gender: "
read SEX
checkAlpha $SEX
checkSpecial $SEX
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Gender Specification should only contain letter!"
echo "Error: Gender Specification should only contain letter! --> ADD `date`" >> RESandERR.bat
else
if [[ $SEX = [mM] || $SEX = [Ff] ]]; then
SEX=`echo $SEX | tr [a-z] [A-Z]`
export SEX
break
else
echo "Invalid Input!"
echo "Error: Invalid Input! --> ADD `date`" >> RESandERR.bat
fi
fi
done
#####################################################
echo "    N U M B E R  D E T A I L"
while true; do
echo -n " Enter your mobile number: "
read MNUM
checkNum $MNUM
checkSpecial $MNUM
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Input should only contain numbers!"
echo "Error: Input should only contain numbers! --> ADD `date`" >> RESandERR.bat
else
CNT=`echo ${#MNUM}`
export CNT
TWO=`echo $MNUM | cut -c1-2`
export TWO
if [[ $CNT -eq 11 && $TWO = "09" ]]; then
cat AddressBook.txt | cut -f9 -d":" | grep $MNUM > test.txt
if [[ -s test.txt ]]; then
echo "Mobile number already exists!"
echo "Error: Mobile number already exists! --> ADD `date`" >> RESandERR.bat
continue
fi
break
else
echo "Enter valid mobile number!"
echo "Error: Enter valid mobile number! --> ADD `date`" >> RESandERR.bat
fi
fi
done
####################################################
echo "    E - M A I L  D E T A I L"
echo " Enter in this format example@example.com "
while true; do
echo -n " Enter your e-mail: "
read EMAIL
echo $EMAIL | egrep -x "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}" > test.txt
if [[ -s test.txt ]]; then
cat AddressBook.txt | cut -f10 -d":" | grep $EMAIL > test.txt
if [[ -s test.txt ]]; then
echo "E-mail already taken!"
echo "Error: E-mail already taken! --> ADD `date`" >> RESandERR.bat
continue
fi
break
else
echo "Enter valid E-Mail!"
echo "Error: Enter valid E-Mail! --> ADD `date`" >> RESandERR.bat
fi
done
#####################################################
echo "    C I V I L  S T A T U S"
echo " Enter either single/married/divorced/widowed "
while true; do
echo -n " Enter your civil status: "
read CSTAT
checkAlpha $CSTAT
checkSpecial $CSTAT
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "This field should only contain alphabets!"
echo "Error: This field should only contain alphabets! --> ADD `date`" >> RESandERR.bat
else
if [[ $CSTAT = [Ss][Ii][Nn][Gg][Ll][Ee] ||
$CSTAT = [Mm][Aa][Rr][Rr][Ii][Ee][Dd] ||
$CSTAT = [Dd][Ii][Vv][Oo][Rr][Cc][Ee][Dd] ||
$CSTAT = [Ww][Ii][Dd][Oo][Ww][Ee][Dd] ]]; then
CSTAT=`echo $CSTAT | tr [a-z] [A-Z]`
export CSTAT
break
else
echo "Enter valid input!"
echo "Error: Enter valid input! --> ADD `date`" >> RESandERR.bat
fi
fi
done
#####################################################
echo "    N A T I O N A L I T Y"
while true; do
echo -n " Enter your nationality: "
read NAT
checkAlpha $NAT
checkSpecial $NAT
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "This field should only contain alphabets!"
echo "Error: This field should only contain alphabets! --> ADD `date`" >> RESandERR.bat
else
NAT=`echo $NAT | tr [a-z] [A-Z]`
export NAT
break
fi
done
#####################################################
echo "$FNAME:$MNAME:$LNAME:$AGE:$BMONTH:$BDAY:$BYEAR:$SEX:$MNUM:$EMAIL:$CSTAT:$NAT" >> AddressBook.txt
echo "CONTACT SUCCESSFULLY ADDED!"
echo "Result: CONTACT SUCCESSFULLY ADDED! --> ADD `date`" >> RESandERR.bat
while true; do
echo "Do you still want to add another contact? Y or N"
echo -n "Enter choice: "
read INP
if [[ $INP = [Yy] ]]; then
break
elif [[ $INP = [Nn] ]]; then
break 2
else
echo "Invalid Input!"
fi
done
done