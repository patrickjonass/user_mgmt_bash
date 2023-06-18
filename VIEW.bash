#!/bin/bash

while true; do
echo " What do you want to do?"
echo " [1] View all Guest Accounts"
echo " [2] Sort by field "
echo " [3] Search by field"
echo -n " Enter choice: "
read VINP
case $VINP in
1)
echo "First|Middle|Last|  |  BIRTHDAY  |  |Mobile|    |Civil |"
echo "Name | Name |Name|Age|Day Month Year|Sex|Number|Email|Status|Nationality "
echo "--------------------------------------------------------------------------"
while read LINE; do
echo $LINE | tr ":" "|"
echo "--------------------------------------------------------------------------"
done < AddressBook.txt
;;
2)
SORT.bash
;;
3)
SEARCHVIEW.bash
;;
*)
echo "Invalid input!"
;;
esac
while true; do
echo "Do you still want to view Guest accounts? Y or N"
echo -n "Enter choice: "
read VTRY
if [[ $VTRY = [Yy] ]]; then
break
elif [[ $VTRY = [Nn] ]]; then
break 2
else
echo "Invalid Input!"
fi
done
done
