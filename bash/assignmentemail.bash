#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit  
fi
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install mailutils -y
echo "Please enter your Email."
read EMAIL
mail -s 'AssignmentEmail.bash' "$EMAIL"