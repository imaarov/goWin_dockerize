FROM golang:latest

RUN apt-get update && apt-get install -y \
    xorg-dev \
    libgl1-mesa-dev \
    libxcursor-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxi-dev \
    libasound2-dev \
    gcc-mingw-w64-x86-64 \
    g++-mingw-w64-x86-64

WORKDIR /app

COPY . .

ENV GOOS=windows
ENV GOARCH=amd64
ENV CC=x86_64-w64-mingw32-gcc
ENV CXX=x86_64-w64-mingw32-g++
ENV CGO_ENABLED=1

RUN go env -w GOPROXY=https://proxy.golang.org,direct
RUN go build -o main.exe main.go

