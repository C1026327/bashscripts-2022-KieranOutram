#!/bin/sh
function installApache2(){
    apt install apache2   
}
function newDetails(){
  echo "Your Information:" > User_Details.txt
  echo "Please enter your Name."
  read NAME
  echo "\n $NAME" >> User_Details.txt
  echo "Please enter your Favorite Word"
  read FAVWORD
  echo "\n $FAVWORD" >> User_Details.txt
  echo "Please enter your Second Favorite Word"
  read FAVRWORD
  echo "\n $FAVRWORD" >> User_Details.txt
}
function readDetails(){
  file="User_Details.txt"
  while read -r line; do
    echo -e "$line\n"
  done <$file
}
function SubStringTest(){
  variable1="This is a Variable"
  variable2="concatenated string"
  substring=${variable1:T:-8}
  concatenatedString="$substring""$variable2"
  echo $variable1
  echo $substring"substring"
  echo $concatenatedString
}
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit  
fi
sudo apt update -y
sudo apt upgrade -y
sudo apt install tree -y
echo "Welcome, Root-User, please type the following commands:"
echo " Apache 2"
echo " View Directory"
echo " New Details"
echo " Read Details"
echo " Substring Test"
echo " Exit"
while true;
do
  read COMMAND
  echo -n "You have selected: $COMMAND."
  echo ""
  case ${COMMAND,,} in
    apache2 | "apache 2")
      installApache2
      ;;
    viewdirectory | "view directory")
      tree
      ;;
    newdetails | "new details")
      newDetails
      ;;
    readdetails | "read details")
      readDetails
      ;;
    substringtest | "substring test")
      SubStringTest
      ;;
    exit)
      break
      ;;
    *)
      echo "Unknown Command. Try again."
      ;;
  esac
done