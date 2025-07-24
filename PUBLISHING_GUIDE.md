# 🚀 Publishing Setup Guide

This guide will help you publish your tic-tac-toe project to both **Docker Hub** and **PyPI** so you can see it publicly available.

## 📦 **1. PyPI (Python Package Index) Setup**

### Step 1: Create PyPI Account
1. Go to [pypi.org](https://pypi.org/account/register/)
2. Create a new account
3. Verify your email

### Step 2: Create API Token
1. Go to [Account Settings](https://pypi.org/manage/account/)
2. Scroll to "API tokens" section
3. Click "Add API token"
4. Name: `tic-tac-toe-github-actions`
5. Scope: "Entire account" (or create project-specific later)
6. **Copy the token** (starts with `pypi-`)

### Step 3: Add Token to GitHub Secrets
1. Go to your GitHub repository: `https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe`
2. Click **Settings** tab
3. Click **Secrets and variables** → **Actions**
4. Click **New repository secret**
5. Name: `PYPI_API_TOKEN`
6. Value: Paste your PyPI token
7. Click **Add secret**

### Step 4: Test with TestPyPI (Optional)
1. Create account at [test.pypi.org](https://test.pypi.org/account/register/)
2. Create API token
3. Add as `TEST_PYPI_API_TOKEN` in GitHub secrets

## 🐳 **2. Docker Hub Setup**

### Step 1: Create Docker Hub Account
1. Go to [hub.docker.com](https://hub.docker.com/signup)
2. Create account with username (e.g., `vishwas812`)
3. Verify email

### Step 2: Create Access Token
1. Go to [Account Settings](https://hub.docker.com/settings/security)
2. Click **New Access Token**
3. Description: `tic-tac-toe-github-actions`
4. Permissions: **Read, Write, Delete**
5. **Copy the token**

### Step 3: Add Docker Credentials to GitHub Secrets
1. In your GitHub repository settings
2. Add these secrets:
   - Name: `DOCKER_USERNAME`, Value: Your Docker Hub username (e.g., `vishwas812`)
   - Name: `DOCKER_PASSWORD`, Value: Your Docker Hub access token

## 🏷️ **3. Create Your First Release**

### Option A: Via GitHub Web Interface
1. Go to your repository
2. Click **Releases** → **Create a new release**
3. Tag: `v0.1.0`
4. Title: `v0.1.0 - Initial Release`
5. Description:
   ```markdown
   🎉 **First Release of Tic-Tac-Toe!**
   
   ## Features
   - Interactive CLI tic-tac-toe game
   - AI opponent with minimax algorithm
   - Docker container support
   - Comprehensive test suite (98% coverage)
   
   ## Installation
   ```bash
   pip install tictactoe-vish
   ```
   
   ## Docker
   ```bash
   # IMPORTANT: Use -it flags for interactive terminal
   docker run -it vishwas812/tic-tac-toe:latest
   ```
   ```
6. Click **Publish release**

### Option B: Via Command Line
```bash
git tag v0.1.0
git push origin v0.1.0
```

## 🔄 **4. What Happens Next**

### After Creating Release:
1. **PyPI Workflow** triggers automatically
2. Package builds and uploads to PyPI
3. Available at: `https://pypi.org/project/tictactoe-vish/`

### After Pushing to Main/Develop:
1. **Docker Workflow** triggers automatically
2. Image builds and pushes to Docker Hub
3. Available at: `https://hub.docker.com/r/vishwas812/tic-tac-toe`

## 🎯 **5. Test Your Published Packages**

### Test PyPI Package:
```bash
pip install tictactoe-vish
tictactoe --help
```

### Test Docker Image:
```bash
docker pull vishwas812/tic-tac-toe:latest
# IMPORTANT: Use -it for interactive terminal
docker run --rm -it vishwas812/tic-tac-toe:latest
```

## 🔍 **6. Monitor Your Packages**

### PyPI Package Stats:
- Visit: `https://pypi.org/project/tictactoe-vish/`
- View download statistics
- Manage releases

### Docker Hub Stats:
- Visit: `https://hub.docker.com/r/vishwas/tic-tac-toe`
- View pull statistics
- Manage tags

## 🚨 **Troubleshooting**

### If PyPI Upload Fails:
1. Check if package name is available
2. Verify API token is correct
3. Check GitHub Actions logs

### If Docker Push Fails:
1. Verify Docker Hub credentials
2. Check repository name format
3. Ensure repository exists on Docker Hub

### If Docker Container Shows EOFError:
1. **Always use `-it` flags**: `docker run -it <image_name>`
2. **In Docker Desktop**: Enable "Allocate a TTY" in settings
3. **From command line**: Use `docker run -it` not just `docker run`
4. **Alternative**: Use `docker run <image_name> --help` to see options

## 📝 **Next Steps**

1. Set up the accounts and tokens above
2. Create your first release
3. Watch the magic happen in GitHub Actions!
4. Share your packages with the world 🌍

---

**Need help?** Check the GitHub Actions logs in the **Actions** tab of your repository.
