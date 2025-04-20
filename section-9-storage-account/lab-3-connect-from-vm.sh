#Yêu cầu: Thực hiện truy cập tới Storage Account (blob) từ VM, thực hiện upload, download file.
#Chuẩn bị: một Azure VM chạy Windows, đã kết nối thành công. Tạo sẵn Storage Account, Container (tận dụng lại từ bài lab trước).
#Step 1: Cấp quyền cho VM có thể tương tác với Storage Account.
    #Chọn Azure VM đã tạo, bên trái chọn Identity
    #Bật System Assigned Identity và nhấn Save.
    #Ghi lại Object ID của Managed Identity (cần thiết để cấp quyền sau).
#Step 2: Truy cập vào Storage Account của bạn đã tạo trước đó.
    #Chọn Access Control (IAM), Nhấn + Add > Add role assignment.
    #Nhấn + Add > Add role assignment.
    #Chọn Role phù hợp, chẳng hạn như:
    #   - Storage Blob Data Contributor (nếu cần đọc/ghi dữ liệu).
    #   - Storage Blob Data Reader (nếu chỉ cần đọc dữ liệu).
    #Trong phần Assign access to, chọn Managed Identity.
    #Tìm và chọn VM tương ứng (theo Object ID đã ghi lại ở Step 1).
    #Nhấn Save để hoàn tất.

#Step 3: Cài đặt Azure CLI trên Windows VM
    #Sử dụng file cài đặt tại: https://aka.ms/installazurecliwindows

#Step 4: Login vào Azure từ CLI
az login --identity
#Step 5: thử tải file lên:
#Upload
az storage blob upload --account-name udemyazurelinh --container-name udemy-demo --name image1.jpg  --file 1.jpg --auth-mode login
az storage blob upload --account-name udemyazurelinh --container-name udemy-demo --name image2.jpg  --file 2.jpg --auth-mode login
az storage blob upload --account-name udemyazurelinh --container-name udemy-demo --name image3.jpg  --file 3.jpg --auth-mode login

#List files
az storage blob list --account-name udemyazurelinh --container-name udemy-demo --output table --auth-mode login

#Download
az storage blob download --account-name udemyazurelinh --container-name udemy-demo --name image3.jpg --file test-download.jpg --auth-mode login

#Delete
az storage blob delete --account-name udemyazurelinh --container-name udemy-demo --name image3.jpg --auth-mode login
