#!/bin/sh
function installApache2(){
    apt install apache2   
}
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit  
fi
while true;
do
  read input
  if [ $input == "apache2" ] || [ $input == "Apache2" ]
    then installApache2
  fi
  if [ $input == 'Exit' ] || [ $input == 'exit' ]
    then echo "Goodbye"
    break
  fi
done