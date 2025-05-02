#Yêu cầu: Thực hiện cài đặt nginx trên máy chủ linux, tạo rule mở port 80 trên NSG của VM, kiểm tra kết nối, sau đó tạo NSG gắn vào subnet chứa VM và làm tương tự
#Chuẩn bị: Một VNet có subnet, một Azure VM chạy Linux trong subnet đó, đã kết nối thành công. (tận dụng lại từ bài lab trước).
#Bước 1: Kết nối SSH vào VM đã tạo và chạy các lệnh sau để cài đặt nginx: 

#!/bin/bash

# Update apt cache.
sudo apt-get update

#We need to add repo before installing nginx-core. Otherwise we get an error
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse  

# Install Nginx.
sudo apt-get install -y nginx

# Set the home page.
echo "<html><body><h2>Welcome to Azure! My name is $(hostname).</h2></body></html>" | sudo tee -a /var/www/html/index.html

#Bước 2: Tạo rule mở port 80 trên NSG của VM, kiểm tra kết nối bằng cách truy cập public IP của VM theo port 80 => kết nối được
#Bước 2: Tạo 1 NSG gán cho subnet của VM, kiểm tra lại kết nối => không kết nối được
#Bước 3: Tạo rule mở port 80 gán cho NSG của subnet, kiểm tra lại kết nối => kết nối được