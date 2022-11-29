#!/bin/sh
function installApache2(){
            
}
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
