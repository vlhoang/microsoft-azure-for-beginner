Lab **Azure DNS Private Zone** sử dụng **Azure Portal**

### 🌀 Bước 1: Tạo Resource Group & Virtual Network

1. Truy cập [Azure Portal](https://portal.azure.com)
2. Tìm và chọn **"Resource groups"** → chọn **"Create"**
   - Tên: `dns-lab-rg`
   - Region: `Japan East`
3. Tìm **"Virtual networks"** → chọn **"Create"**
   - Resource group: `dns-lab-rg`
   - Tên: `lab-vnet`
   - Address space: `10.0.0.0/16`
   - Subnet: `default`, địa chỉ `10.0.0.0/24`

---

### 🌐 Bước 2: Tạo Private DNS Zone

1. Tìm **"Private DNS Zones"** → chọn **"Create"**
   - Resource group: `dns-lab-rg`
   - Name: `udemy.local`
2. Tạo xong, mở zone vừa tạo, kiểm tra tab **"Overview"**

---

### 🔗 Bước 3: Liên kết VNet với Private DNS Zone

1. Trong DNS zone `udemy.local`, chọn tab **"Virtual network links"**
2. Click **"Add"**
   - Link name: `dns-link`
   - Virtual network: chọn `lab-vnet`
   - Enable auto-registration: **OFF**

---

### 💻 Bước 4: Tạo 2 máy ảo Ubuntu

1. Tìm **"Virtual machines"** → click **"Create"**
2. Cấu hình VM:
   - Resource group: `dns-lab-rg`
   - Name: `server-a` và `server-b`
   - Region: `Japan East`
   - Image: Ubuntu 22.04 LTS
   - Size: tuỳ chọn (B1s cho lab)
   - Authentication: SSH
   - Public IP: Bật để dễ kết nối
   - Virtual network: chọn `lab-vnet` + subnet `default`
3. Lặp lại bước này để tạo đủ **2 máy ảo**

---

### 🔎 Bước 5: Ghi lại IP nội bộ của từng VM

1. Trong từng VM → Tab **"Networking"**
2. Ghi lại IP nội bộ của từng máy (thường là `10.0.0.x`)

---

### 🧭 Bước 6: Tạo DNS A-records

1. Quay lại DNS Zone `udemy.local`
2. Chọn **"+ Record set"**
   - Name: `server-a`
   - Type: `A`
   - TTL: 300
   - IP: Nội bộ của VM server-a (ví dụ `10.0.0.4`)
3. Tạo tiếp record cho `server-b` tương tự

---

### ✅ Bước 7: Kiểm tra tên miền nội bộ

1. SSH vào `server-a`:
   ```bash
   ping server-b.udemy.local
   ```
2. SSH vào `server-b`:
   ```bash
   ping server-a.udemy.local
   ```

### Troubleshoot:
cat /etc/resolv.conf
#Đổi thành địa chỉ sau nếu nameserver chưa đúng.
sudo vi /etc/resolv.conf
#Comment dòng mặc định và thêm dòng sau:
nameserver 168.63.129.16


> Nếu trả về đúng IP nội bộ, tên miền đã được resolve thành công qua Private DNS Zone 🎉

