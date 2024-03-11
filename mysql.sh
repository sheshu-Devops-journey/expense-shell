source common.sh

mysql_root_password=$1
if [ -z "${mysql_root_password}" ]; then
  echo INput Password is missing
  exit 1
fi

Print_Task_Heading "Install MySQL Server"
dnf install mysql-server -y &>>$LOG
Check_Status $?

Print_Task_Heading "Start MySQL Service"
systemctl enable mysqld &>>$LOG
systemctl start mysqld &>>$LOG
Check_Status $?

Print_Task_Heading "Setup MySQL Password"
echo 'show databases' |mysql -h mysql-dev.sheshudevops.online -uroot -p${mysql_root_password} &>>$LOG
if [ $? -ne 0 ]; then
  mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOG
fi
Check_Status $?