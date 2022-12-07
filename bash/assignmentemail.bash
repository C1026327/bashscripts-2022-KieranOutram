#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit  
fi
## Here will ensure that the system and emailing system is up to date.
## It skips user requirements by filling -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install sendemail -y
## Below is the EMAIL system itself, with 6 variables.
server="smtp.mail.yahoo.com" 
## This is the SMTP server for Yahoo mail.
from="kiekie420360@yahoo.com"
## My personal email on Yahoo.
to="kiekie420360@yahoo.com"
## My Student Email
subj="Test"
message="Testing"
## The Email Contents
charset="utf-8"
## Character set so the email can process the contents properly.
sendemail -f $from -t $to -u $subj -s $server -m $message -v -o message-charset=$charset
## Send Email is its own command which links to an SMTP server.
## Ideally this will send an email from a certain account to 
##   another account depended on its access.
## The Subject and Message are essential, with charset included
##   for the text to be displayed properly.

## This program can be modified easily to allow user input.
## Simply change i.e line 16, "to c1026327@hallam..." to "read to"