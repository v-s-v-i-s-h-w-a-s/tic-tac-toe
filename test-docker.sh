#!/bin/bash

# Tic-Tac-Toe Docker Test Script
# This script builds and tests the Docker container

set -e  # Exit on any error

echo "🏗️  Building Docker image..."
docker build -t tictactoe:latest .

echo "✅ Docker image built successfully!"

echo ""
echo "🧪 Running basic tests..."

# Test 1: Check if container starts and package imports work
echo "Test 1: Package import test"
docker run --rm tictactoe:latest python -c "
import src.tictactoe
from src.tictactoe.board import Board
from src.tictactoe.ai import AIPlayer
from src.tictactoe.cli import CLI
print('✅ All imports successful')
"

# Test 2: Test board functionality
echo "Test 2: Board functionality test"
docker run --rm tictactoe:latest python -c "
from src.tictactoe.board import Board
b = Board()
b.make_move(0, 0, 'X')
b.make_move(0, 1, 'X')
b.make_move(0, 2, 'X')
assert b.check_winner() == 'X'
print('✅ Board logic works correctly')
"

# Test 3: Test AI functionality
echo "Test 3: AI functionality test"
docker run --rm tictactoe:latest python -c "
from src.tictactoe.board import Board
from src.tictactoe.ai import AIPlayer
b = Board()
ai = AIPlayer('hard')
move = ai.get_best_move(b)
assert isinstance(move, tuple)
assert len(move) == 2
assert 0 <= move[0] <= 2
assert 0 <= move[1] <= 2
print('✅ AI logic works correctly')
"

# Test 4: Test CLI starts (quit immediately)
echo "Test 4: CLI startup test"
echo "3" | docker run -i --rm tictactoe:latest > /dev/null 2>&1
echo "✅ CLI starts and exits correctly"

# Test 5: Test container with automated game input
echo "Test 5: Automated game flow test"
echo -e "1\n0,0\n0,1\n1,0\n1,1\n2,0\nn" | docker run -i --rm tictactoe:latest > /dev/null 2>&1
echo "✅ Full game flow works correctly"

echo ""
echo "🎉 All tests passed! The Docker container is working correctly."
echo ""
echo "To run the game interactively:"
echo "  docker run -it --rm tictactoe:latest"
echo ""
echo "To run with docker-compose:"
echo "  docker-compose run tictactoe"
echo ""
echo "Container size:"
docker images tictactoe:latest --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"
