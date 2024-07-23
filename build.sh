docker build -t go-windows-builder .


docker run --name temp-container go-windows-builder

docker cp temp-container:/app/main.exe ./main.exe

docker rm temp-container

