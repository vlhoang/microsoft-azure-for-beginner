## Yêu cầu: Đã push thành công image lên ACR
Chuẩn bị: truy cập vào Container Registry -> Access key -> Enable `Admin user`

### Step 1: Login vào Azure Portal, truy cập dịch vụ Azure Container Instance.

### Step 2: tạo mới một Container Instance
Chọn subscription, Resource Group tương ứng.
Container Instance Name: vd `udemy-demo-instance`
Region: chọn Japan East (hoặc gần với bạn)

Cấu hình container từ ACR
- Trong phần Image source, chọn: `Azure Container Registry`
- Chọn ACR của bạn vd: `udemyhttpd ` → chọn repository (ví dụ: `httpd-custom`) → chọn tag (ví dụ: `v0.3`)
- OS type: chọn `Linux`
- Size: chọn cấu hình CPU và RAM phù hợp (ví dụ: 0.5 vCPU, 0.5 GB RAM)

Cấu hình mạng và DNS
- Trong tab Networking:
- Chọn Public IP nếu bạn muốn truy cập từ bên ngoài
- Đặt DNS name label (ví dụ: `udemy-linh-aci`) → sẽ tạo URL như:
http://udemy-linh-aci.japaneast.azurecontainer.io
- Đặt port cho container: `TCP:80`

Cấu hinh Monitoring: chọn default.

Cấu hinh Advanced: chọn default.

Tag: có thể thêm hoặc không.

Kiểm tra và tạo
- Nhấn Review + Create
- Kiểm tra lại thông tin → nhấn Create
Chờ vài phút để ACI được triển khai.

### Step 3: Kiểm tra kết quả
- Sau khi triển khai xong, vào Container Instance → chọn container vừa tạo
- Vào tab Containers → kiểm tra trạng thái Running
- Vào tab Logs để xem output.
- Truy cập thông qua FQDN.



