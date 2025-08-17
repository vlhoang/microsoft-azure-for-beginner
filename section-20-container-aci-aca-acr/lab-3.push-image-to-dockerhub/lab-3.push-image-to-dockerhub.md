docker build -t httpd-custom:v0.1 .
docker build -t hoanglinhdigital/httpd-custom:v0.2 .

docker images

docker login

# Optional 
docker tag httpd-custom:v0.1 hoanglinhdigital/httpd-custom:v0.1

docker push hoanglinhdigital/httpd-custom:v0.1


# Test run by Image from Docker hub
docker run -dit --name my-httpd-app-v0.2-dockerhub -p 8081:80 hoanglinhdigital/httpd-custom:v0.2