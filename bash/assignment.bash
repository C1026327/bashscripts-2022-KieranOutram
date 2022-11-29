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
if [ "$input" =='Apache2' ] 
then installApache2() 
fi      
if [ "$input" == 'Exit' ] 
then 
echo "goodbye"
break
fi
done