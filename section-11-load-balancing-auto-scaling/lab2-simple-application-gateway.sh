# Yêu cầu tạo một Application Gateway có nhiệm vụ cần bằng traffic từ client tới Backend Pool là User và Admin. Thử truy cập thông qua DNS của Application Gateway với 2 path khác nhau.
# *Lưu ý: Do chưa được giới thiệu section VNET, các bạn sử dụng default VNET được Azure tạo sẵn để tạo các resource.
# Step 1: Tạo 2 máy ảo Ubuntu như trong chương Virtual Machine. Sử dụng user data khác nhau để khi khởi động lên truy cập vào VM thông qua http hiện lên 2 message đơn giản “Welcome to User page”, “Welcome to Admin page”
# Sử dụng user data sau và thay thế message cho phù hợp.

#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1 style='color:blue'>Welcome to User page/Admin page</h1>" | sudo tee /var/www/html/index.html

#Step 2: Tạo Application Gateway
# Truy cập vào dịch vụ Application Gateway
    # Chọn Create, chọn subscription và resource group tương ứng.
    # Nhập tên Application Gateway, chọn Public, chọn region, chọn IP Public
    # SKU chọn Standard V2
    # Virtual network chọn Default
#Setting Frontend
    # Frontend IP address type: Public
    # Tạo mới public IP cho Application Gateway (hoặc sd IP sẵn có)
#Setting Backend
    # Nhấn: Add backend pool
    # Tên: User-backend-pool
    # Backend targets chọn target type: Virtual Machine, add VM thứ nhất.
    # Nhấn: Add
    # Thực hiện tương tự cho Admin-backend-pool
    # Nhấn Next: Configuration

#Setting Configuration
    # Nhấn: Add a routing rule
    # Đặt tên vd: Udemy-demo-rule
    # Priority: nhập số vd 1
    # Trong tab Listener
        # Listener Name nhập: Udemy-demo-listener
        # Frontend IP : Public IPv4.
        # Protocol: HTTP
        # Port: 80
        # Listener Type: Basic
        # Custom error pages: để mặc định.
    # Trong tab Backend Target
        # Target type chọn Backend pool
        # Backend target: chọn User-backend-pool
        # Backend settings: chọn Add New
        # Name: User-backend-settings
        # Protocol: HTTP
        # Port: 80
        # Override backend path: điền dấu "/"  *Mục đích để overwrite backend path mặc định là /
        # Nhấn Add
        # Nhấn Add new một lần nữa và làm tương tự cho "Admin-backend-settings"

    # Kéo xuống "Path-based routing", nhấn "Add multiple targets to create a path-based rule"
        # Path: /admin
        # Target name: Admin-target
        # Backend setting: Admin-backend-settings
        # Backend target: Admin-Backend-pool
        # Nhấn Add.
        # Nhấn "Add multiple targets to create a path-based rule" một lần nữa.
        # Thực hiện tương tự cho path /user
        
# Tag: nhập các tag cần thiết vd Environment.
# Review + Create

# Step 6: Truy cập thử vào Aplication Gateway thông qua 2 path khác nhau. /user và /admin


