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
performSearch() {
echo "First|Middle|Last|  |  BIRTHDAY  |  |Mobile|    |Civil |"
echo "Name | Name |Name|Age|Month Day Year|Sex|Number|Email|Status|Nationality "
echo "--------------------------------------------------------------------------"
while read GREP; do
cat AddressBook.txt | grep $GREP >> search.txt
done < test1.txt
while read LINE; do
echo $LINE | tr ":" "|"
echo "--------------------------------------------------------------------------"
done < search.txt
rm search.txt
}
echo "Choose field to be searched!"
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
echo "Choose name to be searched: "
echo " [1] First Name "
echo " [2] Middle Name "
echo " [3] Last Name "
echo " [4] Full Name "
echo " Enter any key to cancel "
echo -n " Enter choice: "
read NCHOICE
case $NCHOICE in
1)
while true; do
echo -n " Enter first name: "
read FNAME
checkAlpha $FNAME
checkSpecial $FNAME
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Name must only contain alphabets!"
continue
fi
FNAME=`echo $FNAME | tr [a-z] [A-Z]`
export FNAME
break
done
cat AddressBook.txt | cut -f"1,9" -d":" | grep -i $FNAME > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f2 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
2)
while true; do
echo -n " Enter middle name: "
read MNAME
checkAlpha $MNAME
checkSpecial $MNAME
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Name must only contain alphabets!"
continue
fi
MNAME=`echo $MNAME | tr [a-z] [A-Z]`
export MNAME
break
done
cat AddressBook.txt | cut -f"2,9" -d":" | grep -i $MNAME > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f2 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
3)
while true; do
echo -n " Enter last name: "
read LNAME
checkAlpha $LNAME
checkSpecial $LNAME
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Name must only contain alphabets!"
continue
fi
LNAME=`echo $LNAME | tr [a-z] [A-Z]`
export LNAME
break
done
cat AddressBook.txt | cut -f"3,9" -d":" | grep -i $LNAME > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f2 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
4)
while true; do
echo -n " Enter first name: "
read FNAME
checkAlpha $FNAME
checkSpecial $FNAME
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Name must only contain alphabets!"
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
continue
fi
LNAME=`echo $LNAME | tr [a-z] [A-Z]`
export LNAME
break
done
NAMEE=$FNAME:$MNAME:$LNAME
cat AddressBook.txt | cut -f"1,2,3,9" -d":" | grep -i $NAMEE > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f4 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
*)
;;
esac
;;
2)
while true; do
echo -n " Enter your age: "
read AGE
checkNum $AGE
checkSpecial $AGE
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Age must only contain numbers!"
continue
else
    if [[ $AGE -gt 125 || $AGE -le 0 ]]; then
echo "Enter valid age number!"
continue
    fi
fi
break
done
cat AddressBook.txt | cut -f"4,10" -d":" | grep -w $AGE > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f2 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
3)
echo "Choose birthday to be searched!"
echo " [1] Month of birth "
echo " [2] Day of birth "
echo " [3] Year of birth "
echo " [4] Complete birthdate"
echo " Enter any key to cancel "
read BDAYCHOICE
case $BDAYCHOICE in
1) while true; do
echo -n " Enter your birthmonth (1-12): "
read BMONTH
checkNum $BMONTH
checkSpecial $BMONTH
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
            echo "Birthday must only contain numbers!"
continue
else
if [[ $BMONTH -gt 12 || $BMONTH -lt 1 ]];then
echo "Enter valid month!"
continue
fi
fi
break
done
cat AddressBook.txt | cut -f"5,9" -d":" | grep -w $BMONTH > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f2 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
2) while true; do
echo -n " Enter day of your birth(1-31): "
read BDAY
checkNum $BDAY
checkSpecial $BDAY
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Birthday must only contain number!"
continue
else
if [[ $BDAY -gt 31 || $BDAY -lt 1 ]]; then
echo "Enter valid day!"
continue
fi
fi
break
done
cat AddressBook.txt | cut -f"6,9" -d":" | grep -w $BDAY > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f2 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
3) while true; do
echo -n " Enter your birthyear (YYYY): "
read BYEAR
checkNum $BYEAR
checkSpecial $BYEAR
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Birthday must only contain numbers!"
continue
else
CURR=`date +%Y`
export CURR
((OLD=CURR-150))
if [[ $BYEAR -gt $CURR || $BYEAR -lt $OLD ]]; then
echo "Enter valid year!"
continue
fi
fi
break
done
cat AddressBook.txt | cut -f"7,9" -d":" | grep -w $BYEAR > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f2 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
4) while true; do
echo -n " Enter your birthmonth (1-12): "
read BMONTH
checkNum $BMONTH
checkSpecial $BMONTH
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
            echo "Birthday must only contain numbers!"
continue
else
if [[ $BMONTH -gt 12 || $BMONTH -lt 1 ]];then
echo "Enter valid month!"
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
continue
else
if [[ $BDAY -gt 31 || $BDAY -lt 1 ]]; then
echo "Enter valid day!"
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
continue
else
CURR=`date +%Y`
export CURR
((OLD=CURR-150))
if [[ $BYEAR -gt $CURR || $BYEAR -lt $OLD ]]; then
echo "Enter valid year!"
continue
fi
fi
break
done
BDAYY=$BMONTH:$BDAY:$BYEAR
cat AddressBook.txt | cut -f"5,6,7,9" -d":" | grep -w $BDAYY > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f4 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
*)
;;
esac
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
else
if [[ $SEX = [Mm] || $SEX = [Ff] ]]; then
SEX=`echo $SEX | tr [a-z] [A-Z]`
export SEX
break
else
echo "Invalid Input!"
fi
fi
done
cat AddressBook.txt | cut -f"8,9" -d":" | grep -iw $SEX > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f2 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
5)
while true; do
echo -n " Enter your mobile number: "
read MNUM
checkNum $MNUM
checkSpecial $MNUM
if [[ $NUM -eq 1 || $SCHAR -eq 1 ]]; then
echo "Input should only contain numbers!"
else
CNT=`echo ${#MNUM}`
export CNT
TWO=`echo $MNUM | cut -c1-2`
export TWO
if [[ $CNT -eq 11 && $TWO = "09" ]]; then
break
else
echo "Enter valid mobile number!"
fi
fi
done
cat AddressBook.txt | cut -f9 -d":" | grep -w $MNUM > test1.txt
if [[ -s test1.txt ]];then
performSearch
else
echo "No matched results!"
fi     
;;
6)
echo "Enter in this format example@example.com"
while true; do
echo -n " Enter your e-mail: "
read EMAIL
echo $EMAIL | egrep -x "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}" > test.txt
if [[ -s test.txt ]]; then
break
else
echo "Enter valid E-Mail!"
fi
done
cat AddressBook.txt | cut -f"10" -d":" | grep -w $EMAIL > test1.txt
if [[ -s test1.txt ]];then
performSearch
else
echo "No matched results!"
fi     
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
else
if [[ $CSTAT = [Ss][Ii][Nn][Gg][Ll][Ee] || $CSTAT = [Mm][Aa][Rr][Rr][Ii][Ee][Dd] ||
$CSTAT = [Dd][Ii][Vv][Oo][Rr][Cc][Ee][Dd] ||
$CSTAT = [Ww][Ii][Dd][Oo][Ww][Ee][Dd] ]]; then
CSTAT=`echo $CSTAT | tr [a-z] [A-Z]`
export CSTAT
break
else
echo "Enter valid input!"
fi
fi
done
cat AddressBook.txt | cut -f"9,11" -d":" | grep -iw $CSTAT > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f1 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
8)
while true; do
echo -n " Enter your nationality: "
read NAT
checkAlpha $NAT
checkSpecial $NAT
if [[ $ALPHA -eq 1 || $SCHAR -eq 1 ]]; then
echo "Input should only contain alphabets!"
else
NAT=`echo $NAT | tr [a-z] [A-Z]`
export NAT
break
fi
done
cat AddressBook.txt | cut -f"9,12" -d":" | grep -iw $NAT > test.txt
if [[ -s test.txt ]];then
cat test.txt | cut -f1 -d":" > test1.txt
performSearch
else
echo "No matched results!"
fi     
;;
*)
;;
esac