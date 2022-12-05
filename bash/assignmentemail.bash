#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit  
fi
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install mailutils -y
sudo apt-get install postfix -y
sudo apt-get install libsas2-2 -y
sudo apt-get install ca-certificates -y
sudo apt-get install libsas2-modules -y
echo "Please enter your Email."
read EMAIL
mail -s 'AssignmentEmail.bash' "$EMAIL"
cat /var/mail/root