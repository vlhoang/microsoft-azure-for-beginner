# Làm quen với Azure Storage Account - Queue

#Login
az login

#Put message to the queue
az storage message put --queue-name <queue-name> --content <message-content> --account-name <storage-account-name>
#VD:
az storage message put --queue-name udemy-demo-queue --account-name udemyazurelinh --content "Hello from Azure CLI" 
#Put message with visibility timeout
az storage message put --queue-name udemy-demo-queue --account-name udemyazurelinh --content "Hello from Azure CLI with vibility timeout 120s" --visibility-timeout 120 

# Get message sử dụng CLI:
az storage message get --queue-name <queue-name> --account-name <storage-account-name>
#VD:
az storage message get --queue-name udemy-demo-queue --account-name udemyazurelinh 
az storage message get --queue-name udemy-demo-queue --account-name udemyazurelinh --num-messages 5

# Peek message sử dụng CLI:
az storage message peek --queue-name <queue-name> --account-name <your-storage-account-name>
#example:
az storage message peek --queue-name udemy-demo-queue --account-name udemyazurelinh
az storage message peek --queue-name udemy-demo-queue --account-name udemyazurelinh --num-messages 5

# Delete message sử dụng CLI:
az storage message delete --queue-name <queue-name> --message-id <message-id> --pop-receipt <pop-receipt> --account-name <storage-account-name>
#example: 
az storage message get --queue-name udemy-demo-queue --account-name udemyazurelinh --num-messages 5
az storage message delete --queue-name udemy-demo-queue --account-name udemyazurelinh --id e89f3de6-320d-4f78-a5b7-cb333a504375 --pop-receipt AgAAAAMAAAAAAAAAabmive2x2wE=

#Delete all message
az storage message clear --queue-name <queue-name> --account-name <storage-account-name>
#VD:
az storage message clear --queue-name udemy-demo-queue --account-name udemyazurelinh