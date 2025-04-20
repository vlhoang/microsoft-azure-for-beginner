# Mở rộng ổ root trong Linux

# Step 1: Thao tác trên Azure Portal
# Tìm và chọn Virtual Machine (VM) mà bạn muốn mở rộng ổ cứng.
# Trong menu bên trái, chọn Disks.
# Chọn ổ đĩa mà bạn muốn mở rộng (trong trường hợp này là OS disk).
# Nhấp vào Size + performance.
# Nhập kích thước mới (lớn hơn kích thước hiện tại) và nhấn Save.

#Step 2: Thao tác trong Linux OS
# Kết nối vào VM qua SSH.
# Kiểm tra danh sách đĩa bằng lệnh: lsblk, xác định đĩa vừa được mở rộng vd /dev/sda, /dev/sdc
lsblk
# Kiểm tra kích thước phân vùng bằng lệnh: 
df -h
# Nếu phân vùng tự động được mở rộng bạn không cần thực hiện các câu lệnh dưới đây:
sudo growpart /dev/sda 1
df -T /mnt-point
#Nếu format disk là EXT4:
sudo resize2fs /dev/sdc1
#Nếu format disk là xfs:
sudo xfs_growfs /mount-point
#Kiểm tra lại một lần nữa bằng lệnh: 
df-h

# Add thêm ổ cứng làm ổ data trong Linux
# Step 1: Thao tác trên Azure Portal
# - Tìm và chọn Virtual Machine (VM) mà bạn muốn mở rộng ổ cứng.
# - Trong menu bên trái, chọn Disks.
# - Chọn ổ đĩa mà bạn muốn mở rộng (trong trường hợp này là Data disk).
# - Nhấp vào Size + performance.
# - Nhập kích thước mới (lớn hơn kích thước hiện tại) và nhấn Save.

#Step2 : Thao tác trong Linux OS
# - Kết nối vào VM qua SSH.
# Kiểm tra danh sách đĩa bằng lệnh: lsblk, xác định đĩa vừa được gán vào vd sdc\
lsblk
# Sử dụng lệnh sau để khởi tạo disk mới:
sudo fdisk /dev/sdc
#nhập “n” để tạo mới partition, follow guideline, kết thúc nhập “w” để save lại.
#Chạy lệnh sau:
sudo mkfs.ext4 /dev/sdc1
#Tạo thư mục mount point:
sudo mkdir /mnt/data
#Mount disk vào thư mục mount point:
sudo mount /dev/sdc1 /mnt/data
#Kiểm tra lại một lần nữa bằng lệnh:
df –h
# Nếu muốn mount disk tự động khi khởi động lại VM, bạn cần thêm vào file /etc/fstab
sudo vi /etc/fstab
# Thêm dòng sau vào cuối file:
/dev/sdc1 /mnt/data ext4 defaults 0 0
# Lưu và thoát khỏi file.
# Chạy lệnh sau nếu không có lỗi là OK.
sudo mount -a
