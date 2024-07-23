# 🚀 Docker Build For Compiling Go App For Windows

This script automates the process of building a Docker image, running a container to build a Go application for Windows, and copying the resulting executable file to your local directory.

## 📋 Prerequisites

- Docker installed on your system
- A `Dockerfile` and Go source code (`main.go`),(`go.mod`) and (`go.sum`) in the current directory

## 🛠️ How to Use

1. **Clone or Download the Repository**:
   Ensure you have the script, `Dockerfile`, and `main.go` in the same directory.

2. **Make the Script Executable**:
   ```bash
   chmod +x build.sh
   ```

3. **Run the Script**:
   ```bash
   ./build.sh
   ```

## ✅ Expected Output

The script will:

1. **Build the Docker Image**:
   - Builds the Docker image using your `Dockerfile`.
   
2. **Run the Docker Container**:
   - Runs the container to build the application.
   
3. **Copy the Built File**:
   - Copies the `main.exe` file from the container to your local directory.
   
4. **Clean Up**:
   - Removes the temporary Docker container used for the build.

You will see logs for each step, indicating success or failure. If an error occurs at any step, the script will exit and provide an error message.

## 🔍 Troubleshooting

If you encounter any issues, check the following:

- Docker is properly installed and running.
- You have the necessary permissions to execute Docker commands and write to the local directory.
- The `Dockerfile` is correctly configured to build your Go application.

## 📂 Directory Structure

Ensure your project directory has the following structure:

```
your-project/
├── Dockerfile
├── main.go
└── build.sh
```

## 🎨 Visual Improvements

The script includes color-coded logs to improve visibility:

- **Blue**: Informational messages
- **Green**: Success messages
- **Red**: Error messages

---

### 🎬 Example Output

When running the script, you will see output similar to this:

```plaintext
Starting the Docker build and run process...
[1/4] Building the Docker image...
Docker image built successfully!
[2/4] Running the Docker container...
Docker container ran successfully!
[3/4] Copying the built file to the local directory...
File copied successfully!
[4/4] Removing the temporary Docker container...
Temporary container removed successfully!
Process completed successfully!
```
