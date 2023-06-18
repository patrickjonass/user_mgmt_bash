#!/bin/bash

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
echo "Choose field to be sorted!"
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
echo " Enter any key to cancel "
echo -n " Enter choice: "
read NCHOICE
case $NCHOICE in
1)
cat AddressBook.txt | cut -f1 -d":" > test.txt
sortALPHA.bash test.txt
cat AddressBook.txt | cut -f1,9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPALPHA.txt
cat sorttest.txt | cut -f2 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
2)
cat AddressBook.txt | cut -f2 -d":" > test.txt
sortALPHA.bash test.txt
cat AddressBook.txt | cut -f2,9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPALPHA.txt
cat sorttest.txt | cut -f2 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
3)
cat AddressBook.txt | cut -f3 -d":" > test.txt
sortALPHA.bash test.txt
cat AddressBook.txt | cut -f3,9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPALPHA.txt
cat sorttest.txt | cut -f2 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
*)
;;
esac
;;
2)
cat AddressBook.txt | cut -f4 -d":" > test.txt
sortNUM.bash test.txt
cat AddressBook.txt | cut -f4,9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPNUM.txt
cat sorttest.txt | cut -f2 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
3)
echo "Choose birthday to be searched!"
echo " [1] Month of birth "
echo " [2] Day of birth "
echo " [3] Year of birth "
echo " Enter any key to cancel "
read BDAYCHOICE
case $BDAYCHOICE in
1)
cat AddressBook.txt | cut -f5 -d":" > test.txt
sortNUM.bash test.txt
cat AddressBook.txt | cut -f5,9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPNUM.txt
cat sorttest.txt | cut -f2 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
2)
cat AddressBook.txt | cut -f6 -d":" > test.txt
sortNUM.bash test.txt
cat AddressBook.txt | cut -f6,9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPNUM.txt
cat sorttest.txt | cut -f2 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
3)
cat AddressBook.txt | cut -f7 -d":" > test.txt
sortNUM.bash test.txt
cat AddressBook.txt | cut -f7,9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPNUM.txt
cat sorttest.txt | cut -f2 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
*)
;;
esac
;;
4)
cat AddressBook.txt | cut -f8 -d":" > test.txt
sortALPHA.bash test.txt
cat AddressBook.txt | cut -f8,9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPALPHA.txt
cat sorttest.txt | cut -f2 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
5)
cat AddressBook.txt | cut -f9 -d":" | cut -c2- > test.txt
sortNUM.bash test.txt
cat AddressBook.txt | cut -f9 -d":" > test.txt
while read LINE; do
cat test.txt | grep -m1 $LINE >> sorttest.txt   
done < TOGREPNUM.txt
cat sorttest.txt | cut -f1 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
6)
cat AddressBook.txt | cut -f10 -d":" > test.txt
sortALPHA.bash test.txt
cat AddressBook.txt | cut -f10 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPALPHA.txt
cat sorttest.txt | cut -f1 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
7)
cat AddressBook.txt | cut -f11 -d":" > test.txt
sortALPHA.bash test.txt
cat AddressBook.txt | cut -f9,11 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPALPHA.txt
cat sorttest.txt | cut -f1 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
8)
cat AddressBook.txt | cut -f12 -d":" > test.txt
sortALPHA.bash test.txt
cat AddressBook.txt | cut -f9,12 -d":" > test.txt
while read LINE; do
cat test.txt | grep -iw -m1 $LINE >> sorttest.txt       
done < TOGREPALPHA.txt
cat sorttest.txt | cut -f1 -d":" > test.txt
rm test1.txt
while read LINE; do
cat AddressBook.txt | grep -w $LINE >> test1.txt
done < test.txt
performSearch
rm sorttest.txt
;;
*)
;;
esac