#Trong quá trình tạo Linux VM, các bạn copy code bên dưới cho vào section user-data để VM khi khởi động sẽ cài đặt các package cần thiết.
# *Copy toàn bộ từ line 4 trở xuống:

#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
echo "Welcome to Udemy" | sudo tee /var/www/html/index.html
