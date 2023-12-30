#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
y="\e[33m"
N=\e[0m"

LOGFILE="/temp/$0-$R TIMESTAMP.log"


VALIDATE()
{
if [ $? -ne 0 ]
then
echo "ERROR:: $2 ...$R FAILED $N"
exit 1 
else
echo "$2 ...  $G SUCCESS$N"
fi 
}
if [ $ID -ne 0 ]
then
echo "ERROR:: Please run this script with root access"
exit 1 # you can give other than 0
else
echo "you are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y &>>LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>>LOGFILE

VALIDATE $? "Installing GIT"
