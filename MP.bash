#!/bin/bash

while true; do
echo -e " WELCOME TO TIBAY ENTERPRISES!\n\n\n "
echo " What do you want to do? "
echo "  [A]dd Contact  "
echo "  [E]dit Contact "
echo "  [D]elete Contact "
echo "  [V]iew Contact "
echo "  [L]oad Contact "
echo "  [X] Exit "
echo -en " \n Enter your choice: "
read CHOICE
case $CHOICE in
[Aa])
ADD.bash
;;
[Ee])
EEDIT.bash
;;
[Dd])
DELETE.bash
;;
[Vv])
VIEW.bash
;;
[Ll])
LOAD.bash
;;
[Xx])
exit
;;
*)
echo "Invalid input!"
;;
esac
done