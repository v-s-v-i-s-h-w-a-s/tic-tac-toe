@echo off
REM Quick local Docker build script for Windows

echo 🐳 Building tic-tac-toe Docker image locally...

REM Build the image
docker build -t tic-tac-toe:local .

echo ✅ Build complete! You can now run:
echo    docker run -it tic-tac-toe:local
echo    docker run tic-tac-toe:local --help
echo    docker run tic-tac-toe:local --version

pause
