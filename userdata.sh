#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd

echo "<html><h1>Welcome to the Cloud!</h1></html>" > /var/www/html/index.html
