## Yêu cầu: Đã push thành công image lên ACR
Chuẩn bị: truy cập vào Container Registry -> Access key -> Enable `Admin user`

### Step 1: Tạo vNET
Truy cập vào dịch vụ Virtual Network và tạo vnet với các thông số sau:
- IP CIDR: 10.0.0.0/16
- Số subnet: 2
- public-subnet: 10.0.0.0/24, tạo NSG tương ứng: `public-nsg`
- app-subnet: 10.0.1.0/24, tạo NSG tương ứng: `app-nsg`

### Step 2: Login vào Azure Portal, truy cập dịch vụ Azure Container App.
*Để cho tiện mình sẽ triển khai Azure Container App vào trong Public Subnet thay vì app-subnet.
Create một Container App mới.
Chọn Subscriptin & Resource group.
Đặt tên vd: `udemy-container-app`
Deployment source chọn: `Container image`
Container Apps environment
- Region: chọn region phù hợp.
- Container Apps environment: chọn `Create new environment` và cấu hình như sau:
    + environment name: `udemy-aca-env`
    + Zone redundancy: `Disabled` (do bài lab nên không cần)
    + Workload profiles: Không cần cấu hình.
    + Monitoring: Để mặc định & Tự sinh log group.
    + Networking: enable `Public Network Access` để debug nếu cần. Virtual network: chọn vnet và subnet tương ứng. Virtual IP: `External`. Private Endpoints: `No`
    + Review và nhấn `Create` để tạo mới Apps environment.
- Nhấn `Next Container`, Container details:
    + Name: đặt tên vd `udemy-httpd`
    + Image source chọn: Azure Container Registry
    + Chọn Registry, Image, Tag tương ứng.
    + Authentication type chọn: `Managed identity`
    + CPU and Memory: chọn 0.25 CPU cores, 0.5 Gi memory.
    + Nhấn `Next: ingress`

Application ingress settings
- Ingress: Enable
- Ingress traffic: `Accepting traffic from anywhere`
- Ingress type: `HTTP`
- Transport: `Auto`
- Insecure connections: `Allowed`

Review & Create

### Step 3: Cấu hình NSG cho phép traffic HTTP:80 từ anywhere.
- public-nsg
- app-nsg
### Step 4: Truy cập thử trực tiếp.
Truy cập thử Azure Container App thông qua public endpoint.

### Step 5: Tạo Azure FrontDoor
- Truy cập vào dịch vụ Azure FrontDoor, chọn Create
- Chọn subscription và Resource Group tương ứng
- Đặt tên vd: `udemy-aca-frontdoor`
- Secret: để mặc định và nhẫn Next
- Endpoint: Add một endpoint với tên `aca-endpoint`
- Add một route mới với tên `default-route`
- New Origin Group, đặt tên vd `aca-origin-group`
    + Add thêm 1 origin `aca-origin` 
    + Origin type: `Container App`
    + Host name: chọn hostname tương ứng với ACA đã tạo.
- Origin path: để trống
- Nhấn Add.
- Review & Create

### Clear resources:
- Xoá Container App & Container App Environment
- Xoá FrontDoor
- Xoá vNet.
- Xoá IP nếu còn sót lại.

