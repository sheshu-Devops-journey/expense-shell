dnf module disable nodejs -y
dnf module enable nodejs:20 -y



dnf install nodejs -y

useradd expense



mkdir /app

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
cd /app
unzip /tmp/backend.zip

cd /app
npm install