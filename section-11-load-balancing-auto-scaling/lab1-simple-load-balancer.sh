# Yêu cầu tạo một Load Balancer loại Public có nhiệm vụ cần bằng traffic từ client tới 2 instance A và B. Thử truy cập thông qua IP của Load Balancer.
# *Lưu ý: Do chưa được giới thiệu section VNET, các bạn sử dụng default VNET được Azure tạo sẵn để tạo các resource.
# Step 1: Tạo 2 máy ảo Ubuntu như trong chương Virtual Machine. Sử dụng user data khác nhau để khi khởi động lên truy cập vào VM thông qua http hiện lên 2 message đơn giản “Welcome to VM-A”, “Welcome to VM-B”
# *Copy toàn bộ user data từ line 6~11 trở xuống. thay đổi tên VM-A và VM-B cho phù hợp.

#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1 style='color:red'>Welcome to Udemy-VM-B</h1>" | sudo tee /var/www/html/index.html

# Step 2: Tạo Load Balancer, Backend Pool và Health Probe
    # Truy cập vào dịch vụ Load Balancer
    # Chọn Create, chọn subscription và resource group tương ứng.
    # Nhập tên Load Balancer, chọn Public, chọn region, chọn IP Public và chọn Next: Backend pool.
    # Chọn Add backend pool, chọn VM-A và VM-B, chọn Add.
    # Chọn Next: Health probe.
    # Chọn Add health probe, chọn HTTP, chọn 80, chọn Path /, chọn Interval 5 seconds, chọn Unhealthy threshold 2, chọn Add.
    # Chọn Next: Rules.
    # Chọn Add rule, chọn HTTP, chọn 80, chọn VM-A và VM-B, chọn Add.
    # Chọn Review + create, chọn Create.

# Step 3: Truy cập vào Load Balancer thông qua IP và kiểm tra.

