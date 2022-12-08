#!/bin/sh
function installApache2(){
    apt install apache2 -y   ## This command will confirm apache2 is installed.
}
function installMariaDB(){
  apt install mariadb-server -y
  echo "To setup Mariadb, please consider using the 'mysql_secure_installation'."
}
function installPHP(){
  apt install php-cli -y
  echo "<?php phpinfo(); ?>" >> /var/www/html/phpinfo.php
  systemctl restart apache2
}
## This function saves and overwrites the details of User_Details.txt
## If there is not a User_Details.txt it will make a new one.
## It will store 3 lines which can be read.
## It uses a user input to store NAME, FAVWORD and FAVRWORD, 
## as well as store them in the file.
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
#This function defines a file as user_details.txt
#and performs a while loop to run through each line in the file,
#It will currently echo (or present) each line until it runs out.
function readDetails(){
  file="User_Details.txt"
  while read -r line; do
    echo -e "$line\n"
  done <$file
}
function SubStringTest(){ # Substring Function
  variable1="This is a Variable" # Variables are set here
  variable2="concatenated string"
  substring=${variable1:T:-8} # A substring is created from variable 1 here.
  ## It takes T and removes 8 characters from the end, removing "Variable" in this case.
  ## Then this concatenatedstring variable is made to present a substring merged with another variable.
  concatenatedString="$substring""$variable2"
  echo $variable1
  # Expected Result: "This is a Variable"
  echo $substring"substring"
  # Expected Result: "This is a substring"
  echo $concatenatedString
  # Expected Result: "This is a concatenated string"
  ## The Function is called in the case statement
} ## Which means the user does not have to run this.
#
#The following line checks if the user is a root user, 
#meaning they need administrative access to run this program.
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit  
fi
## These will make sure the system and "tree" is fully up to date.
sudo apt update -y
sudo apt upgrade -y
sudo apt install tree -y
## This line will list every command to the user.
echo "Welcome, Root-User, please type the following commands:"
echo " Apache 2"
echo " Maria DB"
echo " PHP"
echo " View Directory"
echo " New Details"
echo " Read Details"
echo " Substring Test"
echo " Exit"
while true; ## While loop will run this indefinitely
do ## until it is broken.
  read COMMAND # This section will process user input.
  echo -n "You have selected: $COMMAND."
  echo "" # as well as present it back.
  case ${COMMAND,,} in ##The Case allows the user to input one of the below statements,
## ${COMMAND,,} makes the user's wording lowercase, so no matter the capitalisation it will always submit.
    apache2 | "apache 2" | "install apache 2" | "install apache2") ##it runs almost like an "if" statement.
      installApache2 ##This calls for the install apache function.
      ;; ## The expected result should be that Apache2 is installed.
    mariadb | "maria db" | "install mariadb" | "install maria db")
      installMariaDB
      ;;
    php | "install php")
      installPHP
      ;;
    viewdirectory | "view directory")
      tree ## This runs the "tree" program, which presents all directories in 
      ;;
    newdetails | "new details")
      newDetails ## This will run the newDetails function
      ;;
    readdetails | "read details")
      readDetails ## This will read the read details function
      ;;
    substringtest | "substring test")
      SubStringTest ## this will read the substring test function
      ;;
    exit)
      break ## This will break the loop, ending the program.
      ;;
    *)
      echo "Unknown Command. Try again." 
      ;;## This will happen if the system does not understand the user's input, rather than closing it.
  esac ##Esac will close the case. Notably it is case backwards.
done ## Done would end a while statement, but due to it being a loop
## It will not stop unless the loop is broken.