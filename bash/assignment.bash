#!/bin/sh
function installApache2(){
    apt install apache2   
}
function newEmail(){
  echo "Please enter your Email."
  read EMAIL
  echo $EMAIL > Stored_Email.txt
}
function Details(){
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
  file = "User_Details.txt"
  while read -r line; do
    echo -e "$line\n"
  done <$file
}
function SubStringTest(){
  variable1 = "I'm just a single variable"
  variable2 = "substring"
  substring = cut -c  1-11 $variable1
  concatenatedString = "$substring""$variable2"
}
function sendEmail(){
  echo "You are going to send an email."
  echo "What message will you send today?"
  read contents
  $value = cat Stored_Email.txt
  echo "$contents" | email -s 'message subject' $value 
}
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit  
fi
sudo apt update -y
sudo apt upgrade -y
sudo apt-get install mailutils -y
echo "Welcome, Root-User, please type the following commands:"
echo "\n Apache 2"
echo " View Directory"
echo " Set Email"
echo " Exit"
while true;
do
  read COMMAND
  echo -n "You have selected: $COMMAND."
  case $COMMAND in
    Apache2 | "Apache 2")
      installApache2
      ;;
    ViewDirectory | "View Directory")
      dir
      ;;
    SetEmail | "Set email" | Email)
      newEmail
      ;;
    exit)
      break
      ;;
    *)
      echo "Unknown Command. Try again."
      ;;
  esac
done