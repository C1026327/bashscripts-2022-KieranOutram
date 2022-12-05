#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit  
fi
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install mailutils -y
sudo dpkg-reconfigure postfix
echo "Welcome to the mailing service."
echo "To Begin, submit your email by typing 'NewEmail'"
while true;
do 
    read COMMAND
    echo -n "You have selected $COMMAND"
    echo ""
    case ${COMMAND,,} in
        newemail|"new email")
            echo "Please enter your Email."
            read EMAIL
            echo $EMAIL > Stored_Email.txt
            ;;
        sendemail|"send email")
            storedemail= cat Stored_Email.txt
            mail -s 'AssignmentEmail.bash' "$storedemail" <<< "You have sent an email from Bash."
            ;;
        exit)
            break
            ;;
        *)
            echo "Unknown Command"
            ;;
    esac
done