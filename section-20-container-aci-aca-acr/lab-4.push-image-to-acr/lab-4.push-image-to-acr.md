## Yêu cầu: đã cài đặt sẵn docker, Azure CLI.
Step 1: Login vào Azure Portal, truy cập dịch vụ Azure Container Registry.

Step 2: Tạo Azure Container Registry
name: udemyhttpd

Step 3: Build Docker image (xem lại bài lab 2).
docker build -t httpd-custom:v0.3 .
docker images | grep httpd-custom

Step 4: Login vào ACR
az login
az acr login --name udemyhttpd

Expected result:
`Login Succeeded`

Step 5: Tag and Push docker image to ACR 
docker tag httpd-custom:v0.3 udemyhttpd.azurecr.io/httpd-custom:v0.3
docker push udemyhttpd.azurecr.io/httpd-custom:v0.3

Step 6: Kiểm tra Image đã được push lên ACR.
Truy cập vào Azure Container Registry, menu bên trái chọn: Repositories, kiểm tra image được push lên.



