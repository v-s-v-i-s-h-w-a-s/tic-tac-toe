# 🔧 Docker Networking Fix Guide

## Problem: HTTP 500 - Network Not Found Error

This error occurs when Docker's internal networking gets corrupted or when there are leftover network references.

## 🚀 **Quick Fixes (Try in Order)**

### **Fix 1: Restart Docker**
```bash
# On Windows with Docker Desktop
# - Right-click Docker Desktop icon in system tray
# - Click "Restart Docker Desktop"

# On Linux/macOS
sudo systemctl restart docker
# or
sudo service docker restart
```

### **Fix 2: Clean Up Docker Networks**
```bash
# Remove all unused networks
docker network prune -f

# List all networks to see current state
docker network ls

# If you see dangling networks, remove them
docker network rm <network_id>
```

### **Fix 3: Remove and Restart Problematic Container**
```bash
# Stop and remove the specific container
docker stop 8f1a9fdf8912
docker rm 8f1a9fdf8912

# Clean up any orphaned containers
docker container prune -f
```

### **Fix 4: Full Docker Reset (Nuclear Option)**
```bash
# Remove ALL containers, networks, and volumes
docker system prune -a --volumes -f

# This will remove:
# - All stopped containers
# - All networks not used by containers
# - All volumes not used by containers
# - All images without containers
```

## 🎯 **After Fixing - Test Your Tic-Tac-Toe**

Once Docker is working again, test your project:

```bash
# Build locally
docker build -t tic-tac-toe:local .

# Test it works
docker run --rm -it tic-tac-toe:local --help
docker run --rm -it tic-tac-toe:local --version

# Play the game
docker run --rm -it tic-tac-toe:local
```

## 🔍 **Prevention Tips**

1. **Always use `--rm` flag** for temporary containers:
   ```bash
   docker run --rm -it <image> 
   ```

2. **Regular cleanup**:
   ```bash
   docker system prune -f  # Weekly
   ```

3. **Proper container shutdown**:
   ```bash
   docker stop <container>  # Then docker rm <container>
   ```

## 🆘 **If Nothing Works**

1. **Complete Docker reinstall** (Windows/Mac):
   - Uninstall Docker Desktop
   - Restart computer
   - Reinstall Docker Desktop

2. **Reset Docker to factory defaults** (Docker Desktop):
   - Settings → Troubleshoot → Reset to factory defaults

---

**Note**: This error is a Docker infrastructure issue, not a problem with your tic-tac-toe code. Your project is perfectly fine!
