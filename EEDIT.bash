#!/bin/bash

ALPHA=0
NUM=0
SCHAR=0
checkSpecial() {
echo $1 | grep [\~\`\!\@\#\$\%\^\&\*\(\)\_\+\-\=\<\>\?\,\.\/\:\"\;\'\{\}\|] > test.txt
if [[ -s test.txt ]]; then
SCHAR=1
else
SCHAR=0
fi 
}
checkAlpha() {
echo $1 | grep [0123456789] > test.txt
if [[ -s test.txt ]]; then
ALPHA=1
else
ALPHA=0
fi
}
checkNum() {
echo $1 | grep -i [A-Z] > test.txt
if [[ -s test.txt ]]; then
NUM=1
else
NUM=0
fi
}
while true; do
echo -n " Enter Mobile number of the account you wish to edit: "
read ENUM
checkNum $ENUM
checkSpecial $ENUM
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Input should only contain numbers!"
echo "Error: Input should only contain numbers! --> EDIT `date`" >> RESandERR.bat
else
CNT=`echo ${#ENUM}`
export CNT
TWO=`echo $ENUM | cut -c1-2`
export TWO
if [[ $CNT -eq 11 && $TWO = "09" ]]; then
cat AddressBook.txt | grep $ENUM > testacc.txt
if [[ -s testacc.txt ]]; then
FNAME=`cat testacc.txt | cut -f1 -d":"`
MNAME=`cat testacc.txt | cut -f2 -d":"`
LNAME=`cat testacc.txt | cut -f3 -d":"`
AGE=`cat testacc.txt | cut -f4 -d":"`
BMONTH=`cat testacc.txt | cut -f5 -d":"`
BDAY=`cat testacc.txt | cut -f6 -d":"`
BYEAR=`cat testacc.txt | cut -f7 -d":"`
SEX=`cat testacc.txt | cut -f8 -d":"`
MNUM=`cat testacc.txt | cut -f9 -d":"`
EMAIL=`cat testacc.txt | cut -f10 -d":"`
CSTAT=`cat testacc.txt | cut -f11 -d":"`
NAT=`cat testacc.txt | cut -f12 -d":"`
export FNAME; export MNAME; export LNAME; export AGE; export BDAY; export BMONTH; export BYEAR; export SEX; export MNUM; export EMAIL; export CSTAT; export NAT
echo "  THIS ACCOUNT BELONGS TO $FNAME $LNAME "
echo "Choose field you wish to edit!"
echo "  [1] Name "
echo "  [2] Age  "
echo "  [3] Birthday "
echo "  [4] Sex "
echo "  [5] Mobile Number "
echo "  [6] E-mail "
echo "  [7] Civil Status "
echo "  [8] Nationality "       
echo "  Enter any other key to cancel "
echo -n " Enter choice: "
read FLD
case $FLD in
1)
while true; do
echo -n " Enter first name: "
read FNAME
checkAlpha $FNAME
checkSpecial $FNAME
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Name must only contain alphabets!"
echo "Error: Name must only contain alphabets! --> EDIT `date`" >> RESandERR.bat
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
echo "Error: Name must only contain alphabets! --> EDIT `date`" >> RESandERR.bat
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
echo "Error: Name must only contain alphabets! --> EDIT `date`" >> RESandERR.bat
continue
fi
LNAME=`echo $LNAME | tr [a-z] [A-Z]`
export LNAME
break
done
echo "Successfully Edited Name!"
echo "Result: Successfully Edited Name! --> EDIT `date`" >> RESandERR.bat
;;
2)
while true; do
echo -n " Enter your age: "
read AGE
checkNum $AGE
checkSpecial $AGE
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Age must only contain numbers!"
echo "Error: Age must only contain numbers! --> EDIT `date`" >> RESandERR.bat
continue
else
    if [[ $AGE -gt 125 || $AGE -le 0 ]]; then
echo "Enter valid age number!"
echo "Error: Enter valid age number! --> EDIT `date`" >> RESandERR.bat
continue
    fi
fi
break
done
echo "Successfully Edited Age!"
echo "Result: Successfully Edited Age! --> EDIT `date`" >> RESandERR.bat
;;
3)
while true; do
echo -n " Enter your birthmonth (1-12): "
read BMONTH
checkNum $BMONTH
checkSpecial $BMONTH
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
            echo "Birthday must only contain numbers!"
            echo "Error: Birthday must only contain numbers! --> EDIT `date`" >> RESandERR.bat
continue
else
if [[ $BMONTH -gt 12 || $BMONTH -lt 1 ]];then
echo "Enter valid month!"
echo "Error: Enter valid month! --> EDIT `date`" >> RESandERR.bat
continue
fi
fi
break
done
while true; do
echo -n " Enter day of your birth(1-31): "
read BDAY
checkNum $BDAY
checkSpecial $BDAY
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Birthday must only contain number!"
            echo "Error: Birthday must only contain numbers! --> EDIT `date`" >> RESandERR.bat
continue
else
if [[ $BDAY -gt 31 || $BDAY -lt 1 ]]; then
echo "Enter valid day!"
echo "Error: Enter valid day! --> EDIT `date`" >> RESandERR.bat
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
echo "Birthday must only contain numbers!"
            echo "Error: Birthday must only contain numbers! --> EDIT `date`" >> RESandERR.bat
continue
else
CURR=`date +%Y`
export CURR
((OLD=CURR-150))
if [[ $BYEAR -gt $CURR || $BYEAR -lt $OLD ]]; then
echo "Enter valid year!"
echo "Error: Enter valid year! --> EDIT `date`" >> RESandERR.bat
continue
fi
fi
break
done
echo "Successfully Edited Birthday!"
echo "Result: Successfully Edited Birthday! --> EDIT `date`" >> RESandERR.bat
;;
4)
while true; do
echo " Enter either M or F "
echo -n " Enter your gender: "
read SEX
checkAlpha $SEX
checkSpecial $SEX
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Input should only contain letters!"
echo "Error: Input should only contain letters! --> EDIT `date`" >> RESandERR.bat
else
if [[ $SEX = [Mm] || $SEX = [Ff] ]]; then
SEX=`echo $SEX | tr [a-z] [A-Z]`
export SEX
break
else
echo "Invalid Input!"
echo "Error: Invalid Input! --> EDIT `date`" >> RESandERR.bat
fi
fi
done
echo "Successfully Edited Sex!"
echo "Result: Successfully Edited Sex! --> EDIT `date`" >> RESandERR.bat
;;
5)
while true; do
echo -n " Enter your mobile number: "
read MNUM
checkNum $MNUM
checkSpecial $MNUM
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Input should only contain numbers!"
echo "Error: Input should only contain letters! --> EDIT `date`" >> RESandERR.bat
else
CNT=`echo ${#MNUM}`
export CNT
TWO=`echo $MNUM | cut -c1-2`
export TWO
if [[ $CNT -eq 11 && $TWO = "09" ]]; then
cat AddressBook.txt | cut -f9 -d":" | grep $MNUM > test.txt
if [[ -s test.txt ]]; then
echo "Mobile number already exists!"
echo "Error: Mobile number already exists! --> EDIT `date`" >> RESandERR.bat
continue
fi
break
else
echo "Enter valid mobile number!"
echo "Error: Enter valid mobile number! --> EDIT `date`" >> RESandERR.bat
fi
fi
done
echo "Successfully Edited Mobile Number!"
echo "Result: Successfully Edited Mobile Number! --> EDIT `date`" >> RESandERR.bat
;;
6)
echo "Enter in this format example@example.com"
while true; do
echo -n " Enter your e-mail: "
read EMAIL
echo $EMAIL | egrep -x "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}" > test.txt
if [[ -s test.txt ]]; then
cat AddressBook.txt | cut -f10 -d":" | grep $EMAIL > test.txt
if [[ -s test.txt ]]; then
echo "E-mail already taken!"
echo "Error: E-mail already taken! --> EDIT `date`" >> RESandERR.bat
continue
fi
break
else
echo "Enter valid E-Mail!"
echo "Error: Enter valid E-Mail! --> EDIT `date`" >> RESandERR.bat
fi
done
echo "Successfully Edited E-mail!"
echo "Result: Successfully Edited E-mail! --> EDIT `date`" >> RESandERR.bat
;;
7)
echo " Enter either single/married/divorced/widowed "
while true; do
echo -n " Enter your civil status: "
read CSTAT
checkAlpha $CSTAT
checkSpecial $CSTAT
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Input should only contain alphabets!"
echo "Error: Input should only contain alphabets! --> EDIT `date`" >> RESandERR.bat
else
if [[ $CSTAT = [Ss][Ii][Nn][Gg][Ll][Ee] || $CSTAT = [Mm][Aa][Rr][Rr][Ii][Ee][Dd] ||
$CSTAT = [Dd][Ii][Vv][Oo][Rr][Cc][Ee][Dd] ||
$CSTAT = [Ww][Ii][Dd][Oo][Ww][Ee][Dd] ]]; then
CSTAT=`echo $CSTAT | tr [a-z] [A-Z]`
export CSTAT
break
else
echo "Enter valid input!"
echo "Error: Enter valid input! --> EDIT `date`" >> RESandERR.bat
fi
fi
done
echo "Successfully Edited Civil Status!"
echo "Result: Successfully Edited Civil Status! --> EDIT `date`" >> RESandERR.bat
;;
8)
while true; do
echo -n " Enter your nationality: "
read NAT
checkAlpha $NAT
checkSpecial $NAT
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Input should only contain alphabets!"
echo "Error: Input should only contain alphabets! --> EDIT `date`" >> RESandERR.bat
else
NAT=`echo $NAT | tr [a-z] [A-Z]`
export NAT
break
fi
done
echo "Successfully Edited Nationality!"
echo "Result: Successfully Edited Nationality! --> EDIT `date`" >> RESandERR.bat
;;
*)
;;
esac
sed /$ENUM/d AddressBook.txt > testacc.txt
cp testacc.txt AddressBook.txt
echo "$FNAME:$MNAME:$LNAME:$AGE:$BMONTH:$BDAY:$BYEAR:$SEX:$MNUM:$EMAIL:$CSTAT:$NAT" >> AddressBook.txt
else
echo "Account does not exist!"
echo "Error: Account does not exist! --> EDIT `date`" >> RESandERR.bat
fi
else
echo "Enter valid mobile number!"
echo "Error: Enter valid mobile number! --> EDIT `date`" >> RESandERR.bat
continue
fi
while true; do
echo "Do you still want to edit an account? Y or N"
echo -n "Enter choice: "
read EINP
if [[ $EINP = [Yy] ]]; then
break
elif [[ $EINP = [Nn] ]]; then
break 2
else
echo "Invalid input!"
fi
done
fi
done