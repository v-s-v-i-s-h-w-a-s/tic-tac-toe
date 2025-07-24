# Docker Guide for Tic-Tac-Toe

## Building the Docker Image

```bash
# Build the Docker image
docker build -t tictactoe:latest .

# Build with a specific tag
docker build -t tictactoe:v1.0.0 .

# Build and show build progress
docker build --progress=plain -t tictactoe:latest .
```

## Running the Container

### Interactive Mode (Recommended for playing the game)
```bash
# Run the container interactively
docker run -it tictactoe:latest

# Run with a custom name
docker run -it --name tictactoe-game tictactoe:latest

# Run and automatically remove container when it exits
docker run -it --rm tictactoe:latest
```

### Background Mode (for testing/automation)
```bash
# Run in background (detached mode)
docker run -d --name tictactoe-bg tictactoe:latest

# Check if container is running
docker ps

# Check container logs
docker logs tictactoe-bg

# Stop the background container
docker stop tictactoe-bg
docker rm tictactoe-bg
```

## Testing the Container

### 1. Basic Functionality Test
```bash
# Test that the container starts and shows the menu
docker run -it --rm tictactoe:latest
```

### 2. Automated Input Test
```bash
# Test with pre-defined input (quit immediately)
echo "3" | docker run -i --rm tictactoe:latest

# Test starting a human vs human game then quitting
echo -e "1\n0,0\n3" | docker run -i --rm tictactoe:latest

# Test human vs AI game with one move then quit
echo -e "2\n1,1\nn" | docker run -i --rm tictactoe:latest
```

### 3. Container Health Check
```bash
# Check if the Python module can be imported
docker run --rm tictactoe:latest python -c "import src.tictactoe; print('Package imported successfully')"

# Check Python version
docker run --rm tictactoe:latest python --version

# List installed packages
docker run --rm tictactoe:latest pip list
```

### 4. Performance Test
```bash
# Check container size
docker images tictactoe:latest

# Check container startup time
time docker run --rm tictactoe:latest python -c "print('Container started successfully')"
```

## Debugging the Container

### 1. Interactive Shell Access
```bash
# Get a shell inside the container
docker run -it --rm --entrypoint /bin/bash tictactoe:latest

# Run commands inside the container
docker run -it --rm --entrypoint /bin/bash tictactoe:latest -c "ls -la /app"
```

### 2. Check File Structure
```bash
# List files in the container
docker run --rm tictactoe:latest find /app -type f -name "*.py"

# Check if all source files are present
docker run --rm tictactoe:latest ls -la /app/src/tictactoe/
```

### 3. Run Tests in Container
```bash
# Install dev dependencies and run tests
docker run --rm tictactoe:latest sh -c "pip install pytest pytest-cov && python -m pytest /app/tests/ -v"
```

## Multi-Stage Build (Optional Optimization)

For a smaller production image, you can use this optimized Dockerfile:

```dockerfile
# Build stage
FROM python:3.11-slim as builder
WORKDIR /app
COPY pyproject.toml .
RUN pip install --user .

# Runtime stage
FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY src/ src/
RUN useradd --create-home --shell /bin/bash app
USER app
ENV PATH=/root/.local/bin:$PATH
ENTRYPOINT ["python", "-m", "src.tictactoe.cli"]
```

## Docker Compose (Optional)

Create a `docker-compose.yml` for easier management:

```yaml
version: '3.8'
services:
  tictactoe:
    build: .
    image: tictactoe:latest
    container_name: tictactoe-game
    stdin_open: true
    tty: true
    restart: "no"
```

Then use:
```bash
# Build and run with docker-compose
docker-compose up --build

# Run interactively
docker-compose run tictactoe

# Clean up
docker-compose down
```

## Troubleshooting

### Common Issues:

1. **Container exits immediately**
   - Make sure you're using `-it` flags for interactive mode
   - Check logs: `docker logs <container_name>`

2. **Module not found errors**
   - Verify the PYTHONPATH: `docker run --rm tictactoe:latest python -c "import sys; print(sys.path)"`
   - Check if files were copied correctly: `docker run --rm tictactoe:latest ls -la /app/src/tictactoe/`

3. **Permission issues**
   - The container runs as non-root user 'app'
   - Check user: `docker run --rm tictactoe:latest whoami`

4. **Input/Output issues**
   - Always use `-it` for interactive applications
   - For automated testing, use `-i` (stdin) without `-t` (tty)

## Example Test Session

```bash
# 1. Build the image
docker build -t tictactoe:latest .

# 2. Quick test - should show menu and exit
echo "3" | docker run -i --rm tictactoe:latest

# 3. Play a quick game
docker run -it --rm tictactoe:latest

# 4. Clean up any stopped containers
docker container prune -f
```
