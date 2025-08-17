#Yêu cầu: Tạo hệ thống có thể auto-scale sử dụng VM Scale Set và Application Gateway.

#Step 1: Chuẩn bị một VM Image đã cài đặt sẵn và enable httpd.
#Step 2: Tạo VM Scale Set
    #Truy cập vào VM image definitions, chọn Image đã tạo ra từ Step 1, -> Chọn Create VMSS.
    #Chọn resource group và đặt tên, vd
    Udemy-VM-Scale-Set
    #Chọn Region. Chọn Availability Zone 
    Chọn cả 3 zones 1,2,3.
    #Orchestration mode chọn:
    Uniform: optimized for large scale stateless workloads
    #Scaling mode chọn: 
    Manually update the capacity: Maintain a fixed amount of instances.
    #Instance count nhập: 2
    #Image: *Đã được chọn sẵn nên không cần chọn lại.
    #Size: 
    Chọn size phù hợp vd 1vCPU, 1GB Memory.
    #Administrator account: Chọn SSH Key, chọn key đã tạo ở các bài lab trước hoặc tạo mới.
    #Next, bỏ qua phần Spot
    #Next, Disk để mặc định.
    #Next, Networking
    #Virtual network
    Chọn Vnet sẵn có hoặc tạo mới.
    #Subnet
    Chọn subnet sẵn có hoặc tạo mới.
    #Network interface: Không chọn
    #Kéo xuống section: Load balancing options, chọn:
    Application Gateway
    #Nhấn nút: Create an application gateway
    #đặt tên vd: 
    Udemy-agw
    #Routing rule:
    name: Udemy-Routing-rule, HTTP, 80
    #Nhấn Create.
    #Nhấn Review+Create
    #Nhấn Create.

    #Đợi cho VM Scale set ổn định, kiểm tra số lượng VM được tạo ra.
#Step 3: Test việc truy cập thông qua Application Gateway.

#Step 4: Thử Delete một VM, test việc phục hồi của VM Scale set.
#Step 6: Thử điều chỉnh size của VM Scale Set.

#Step 7: Cấu hình một Autoscale Rule theo metrics CPU. Thử điều chỉnh thông số Threshole scale xuống thấp, theo dõi quá trình scale của VM Scale Set.
Udemy-VM-Scale-Set-CPU-Scale
CPU: 70%
Số lượng instance add thêm: 1, cool down: 5 minutes.
#Trouble shoot Lỗi không save được setting auto-scaling.
#Truy cập vào Subsctiption, chọn subscription bạn đang sd.
#Kéo xuống phần Setting -> Resource providers
#Register 2 provider sau (đợi khoảng 2-5 phút)
microsoft.insights
Microsoft.StreamAnalytics
