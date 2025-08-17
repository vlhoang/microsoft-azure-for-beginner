#Yêu cầu: Tạo kết nối VPN P2S từ Azure đến máy client on-prem 
#Chuẩn bị: Một VNet có subnet, một Azure VM chạy Linux trong subnet đó, đã kết nối thành công. (tận dụng lại từ bài lab trước), và 1 máy client có internet
#Bước 1: Tạo VPN Gateway (hướng dẫn trong video)
#Bước 2: Generate Root Cert: Trên máy client, chạy lệnh sau để tạo Root Cert trên powershell (Lưu ý tạo xong không đóng cửa sổ powershell)

$params = @{
    Type = 'Custom'
    Subject = 'CN=P2SRootCert'
    KeySpec = 'Signature'
    KeyExportPolicy = 'Exportable'
    KeyUsage = 'CertSign'
    KeyUsageProperty = 'Sign'
    KeyLength = 2048
    HashAlgorithm = 'sha256'
    NotAfter = (Get-Date).AddMonths(24)
    CertStoreLocation = 'Cert:\CurrentUser\My'
}
$cert = New-SelfSignedCertificate @params

#Bước 3: Generate Client Cert Cũng trong cửa sổ powershell trước, chạy lệnh sau để tạo Client Cert

$params = @{
       Type = 'Custom'
       Subject = 'CN=P2SChildCert'
       DnsName = 'P2SChildCert'
       KeySpec = 'Signature'
       KeyExportPolicy = 'Exportable'
       KeyLength = 2048
       HashAlgorithm = 'sha256'
       NotAfter = (Get-Date).AddMonths(18)
       CertStoreLocation = 'Cert:\CurrentUser\My'
       Signer = $cert
       TextExtension = @(
        '2.5.29.37={text}1.3.6.1.5.5.7.3.2')
   }
   New-SelfSignedCertificate @params

   #Bước 4: Export Root Cert ra file cer, copy content root cert
   #Bước 5: Cấu hình P2S Connection trên Azure Gateway, paste root cert
   #Bước 6: Download cấu hình VPN Client
   #Bước 7: Tải và cài đặt Azure VPN tại: https://aka.ms/azvpnclientdownload
   #Bước 8: Import file cấu hình VPN Client và Connect
   #Bước 9: Kiểm tra kết quả bằng ping hoặc truy cập các port 22, 80 từ 2 đầu (máy trên Azure và máy client)