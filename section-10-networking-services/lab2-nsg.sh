#Yêu cầu: Thực hiện cài đặt nginx trên máy chủ linux, sau đó tạo 1 NSG mở cổng 80, sau đó đóng cổng 80 lại và kiểm tra
#Chuẩn bị: Một VNet có subnet, một Azure VM chạy Linux trong subnet đó, đã kết nối thành công. (tận dụng lại từ bài lab trước).
#Bước 1: Mở Azure cloudshell hoặc Azure CLI (đã hướng dẫn ở chương trước), đăng nhập và chạy lệnh sau:

az vm extension set \
  --resource-group "[sandbox resource group name]" \
  --vm-name my-vm \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --version 2.1 \
  --settings '{"fileUris":["https://raw.githubusercontent.com/vlhoang/microsoft-azure-for-beginner/refs/heads/dev/linhvu/section-10-networking-services/configure-nginx.sh"]}' \
  --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'    

#Bước 2: Tạo 1 NSG gán cho subnet của VM (theo hướng dẫn của video lab), mở cổng 80 và truy cập vào VM theo public IP, xem kết quả
#Bước 3: Đóng cổng 80 và thử truy cập lại