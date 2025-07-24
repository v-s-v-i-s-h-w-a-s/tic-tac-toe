# 🐳 Docker Usage Instructions

## Running Tic-Tac-Toe with Docker

### ✅ **Correct Usage (Interactive Terminal)**

```bash
# Command line (recommended)
docker run -it vishwas812/tic-tac-toe:latest

# Or with removal after exit
docker run --rm -it vishwas812/tic-tac-toe:latest
```

### 🖥️ **Docker Desktop Users**

If you're using Docker Desktop GUI:

1. **Pull the image first**:
   ```bash
   docker pull vishwas812/tic-tac-toe:latest
   ```

2. **Run with interactive settings**:
   - In Docker Desktop, find the image
   - Click "Run"
   - **IMPORTANT**: Check "Interactive" and "TTY" options
   - Or use the command line instead

### ❌ **What Causes EOFError**

```bash
# This will cause EOFError - no interactive terminal
docker run vishwas812/tic-tac-toe:latest
```

### 🔧 **Troubleshooting**

**If you see "EOFError: EOF when reading a line":**

1. **Use `-it` flags**: Ensures interactive terminal allocation
2. **Check Docker Desktop settings**: Enable TTY allocation
3. **Use help instead**: `docker run vishwas812/tic-tac-toe:latest --help`

### 📋 **Available Commands**

```bash
# Show help
docker run --rm vishwas812/tic-tac-toe:latest --help

# Show version
docker run --rm vishwas812/tic-tac-toe:latest --version

# Interactive game (needs -it)
docker run --rm -it vishwas812/tic-tac-toe:latest
```

### 🎮 **Game Features**

- Human vs Human gameplay
- Human vs AI with smart minimax algorithm
- Interactive command-line interface
- Proper error handling for all environments

---

**Note**: The `-it` flags are essential for any interactive command-line application in Docker. The `-i` keeps STDIN open and `-t` allocates a pseudo-TTY.
