#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' 

echo -e "${BLUE}Starting the Docker build and run process...${NC}"

# Step 1: Build the Docker image
echo -e "${GREEN}[1/4] Building the Docker image...${NC}"
docker build -t go-windows-builder .
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Docker image built successfully!${NC}"
else
    echo -e "${RED}Failed to build the Docker image.${NC}"
    exit 1
fi

# Step 2: Run the Docker container
echo -e "${GREEN}[2/4] Running the Docker container...${NC}"
docker run --name temp-container go-windows-builder
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Docker container ran successfully!${NC}"
else
    echo -e "${RED}Failed to run the Docker container.${NC}"
    docker rm temp-container > /dev/null 2>&1
    exit 1
fi

# Step 3: Copy the built file to the local directory
echo -e "${GREEN}[3/4] Copying the built file to the local directory...${NC}"
docker cp temp-container:/app/main.exe ./main.exe
if [ $? -eq 0 ]; then
    echo -e "${GREEN}File copied successfully!${NC}"
else
    echo -e "${RED}Failed to copy the file.${NC}"
    docker rm temp-container > /dev/null 2>&1
    exit 1
fi

# Step 4: Remove the temporary Docker container
echo -e "${GREEN}[4/4] Removing the temporary Docker container...${NC}"
docker rm temp-container
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Temporary container removed successfully!${NC}"
else
    echo -e "${RED}Failed to remove the temporary container.${NC}"
    exit 1
fi

# End of the script
echo -e "${BLUE}Process completed successfully!${NC}"

