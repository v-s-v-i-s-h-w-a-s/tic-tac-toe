# 🎮 Tic-Tac-Toe Game

<div align="center">

[![CI](https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe/workflows/CI/badge.svg)](https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe/actions)
[![Coverage](https://codecov.io/gh/v-s-v-i-s-h-w-a-s/tic-tac-toe/branch/main/graph/badge.svg)](https://codecov.io/gh/v-s-v-i-s-h-w-a-s/tic-tac-toe)
[![PyPI version](https://badge.fury.io/py/tictactoe-vish.svg)](https://badge.fury.io/py/tictactoe-vish)
[![Python versions](https://img.shields.io/pypi/pyversions/tictactoe-vish)](https://pypi.org/project/tictactoe-vish/)
[![Docker Pulls](https://img.shields.io/docker/pulls/vishwas812/tic-tac-toe)](https://hub.docker.com/r/vishwas812/tic-tac-toe)
[![Docker Image Size](https://img.shields.io/docker/image-size/vishwas812/tic-tac-toe/latest)](https://hub.docker.com/r/vishwas812/tic-tac-toe)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**A modern, well-tested Tic-Tac-Toe game implementation in Python with CLI interface and intelligent AI opponent**

[🚀 Quick Start](#-quick-start) • 
[📦 Installation](#-installation) • 
[🎯 Features](#-features) • 
[🤖 AI Modes](#-ai-modes) • 
[🐳 Docker](#-docker) • 
[📖 Documentation](#-documentation) • 
[🤝 Contributing](#-contributing)

![Demo](https://img.shields.io/badge/Demo-Available-brightgreen)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-blue)
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)

</div>

---

## 🎯 Features

<table>
<tr>
<td width="50%">

### 🎮 **Game Modes**
- **Human vs Human** - Classic two-player mode
- **Human vs AI** - Challenge the computer
- **Interactive CLI** - Beautiful terminal interface
- **Cross-platform** - Works on Linux, macOS, Windows

</td>
<td width="50%">

### 🤖 **AI Intelligence**
- **Minimax Algorithm** - Unbeatable optimal play
- **Strategic Depth** - Advanced game tree analysis
- **Adaptive Difficulty** - Multiple AI skill levels
- **Instant Response** - Lightning-fast move calculation

</td>
</tr>
<tr>
<td>

### 🔧 **Development**
- **98% Test Coverage** - Comprehensive test suite
- **Type Hints** - Full static type checking
- **Modern Python** - Python 3.8+ support
- **CI/CD Pipeline** - Automated testing & deployment

</td>
<td>

### 📦 **Distribution**
- **PyPI Package** - Easy pip installation
- **Docker Image** - Containerized deployment
- **GitHub Releases** - Semantic versioning
- **Multi-platform** - AMD64 & ARM64 support

</td>
</tr>
</table>

---

## 🚀 Quick Start

Get up and running in less than 2 minutes:

```bash
# Install from PyPI
pip install tictactoe-vish

# Run the game
tictactoe

# Or use Docker
docker run -it vishwas812/tic-tac-toe
```

### 🎬 Demo

```bash
$ tictactoe --mode pvp
Welcome to Tic-Tac-Toe!
   |   |   
-----------
   |   |   
-----------
   |   |   

Player X's turn. Enter position (1-9): 5
   |   |   
-----------
   | X |   
-----------
   |   |   
```

---

## 📦 Installation

### Via PyPI (Recommended)

```bash
pip install tictactoe-vish
```

### Via Docker

```bash
# Pull and run
docker run -it vishwas812/tic-tac-toe

# Or build locally
docker build -t tic-tac-toe .
docker run -it tic-tac-toe
```

### From Source

```bash
# Clone the repository
git clone https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe.git
cd tic-tac-toe

# Install in development mode
pip install -e .

# Run the game
python -m tictactoe
```

---

## 🎮 Usage

### Command Line Interface

```bash
# Start interactive mode
tictactoe

# Specific game modes
tictactoe --mode pvp        # Player vs Player
tictactoe --mode pvc        # Player vs Computer
tictactoe --help           # Show all options
```

### Game Modes

| Mode | Description | Command |
|------|-------------|---------|
| 🎯 **Player vs Computer** | Challenge the AI opponent | `tictactoe --mode pvc` |
| 👥 **Player vs Player** | Two-player local game | `tictactoe --mode pvp` |
| 🤖 **AI Demo** | Watch AI play against itself | `tictactoe --demo` |

---

## 🤖 AI Modes

Our AI uses the **Minimax algorithm** with alpha-beta pruning for optimal gameplay:

- **🧠 Perfect Play**: The AI never loses when playing optimally
- **⚡ Fast Decisions**: Instant move calculation
- **🎯 Strategic**: Always finds the best possible move
- **🛡️ Defensive**: Blocks player winning moves
- **⚔️ Offensive**: Creates winning opportunities

---

## 🐳 Docker

### Quick Run

```bash
docker run -it vishwas812/tic-tac-toe
```

### Advanced Usage

```bash
# Run with custom settings
docker run -it vishwas812/tic-tac-toe --mode pvp

# Build from source
docker build -t my-tictactoe .
docker run -it my-tictactoe
```

### Docker Compose

```yaml
version: '3.8'
services:
  tictactoe:
    image: vishwas812/tic-tac-toe:latest
    stdin_open: true
    tty: true
    command: ["--mode", "pvc"]
```

---

## Installation

### From PyPI

```bash
pip install tictactoe-vish
```

### From Docker Hub

```bash
# Run directly
docker run -it vishwas812/tic-tac-toe:latest

# Or pull first
docker pull vishwas812/tic-tac-toe:latest
docker run -it vishwas812/tic-tac-toe:latest
```

### Development Installation

```bash
git clone https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe.git
cd tic-tac-toe
pip install -e .[dev]
```

---

## Usage

### Command Line Interface

```bash
# Run the game (if installed via pip)
tictactoe

# Show help
tictactoe --help

# Show version
tictactoe --version

# Or if installed in development mode
python -m src.tictactoe.cli
```

### As a Library

```python
from tictactoe import Board, AIPlayer

# Create a game
board = Board()
ai = AIPlayer(difficulty="hard")

# Make moves
board.make_move(1, 1)  # Human move to center
ai_move = ai.get_best_move(board)  # AI calculates best move
board.make_move(ai_move[0], ai_move[1])  # AI makes move

# Check game state
if board.check_winner():
    print(f"Winner: {board.check_winner()}")
elif board.is_full():
    print("It's a tie!")
```

---

## Game Rules

* Players take turns placing X's and O's on a 3x3 grid
* First player to get 3 in a row (horizontally, vertically, or diagonally) wins
* If the grid fills up with no winner, it's a tie
* Positions are specified as row,col coordinates (0-2 for each)

---

## AI Difficulty Levels

* **Easy**: Random moves
* **Medium**: Blocks opponent wins and takes available wins
* **Hard**: Uses minimax algorithm for optimal play

---

## Development

### Setup Development Environment

```bash
# Clone and install
git clone https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe.git
cd tic-tac-toe
pip install -e .[dev]

# Install pre-commit hooks
pre-commit install
```

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src/tictactoe --cov-report=html

# Run specific test file
pytest tests/test_board.py
```

### Code Quality

```bash
# Format code
black src tests

# Sort imports
isort src tests

# Lint code
flake8 src tests
pylint src

# Run all pre-commit hooks
pre-commit run --all-files
```

---

## Project Structure

```
tic-tac-toe/
├── .github/workflows/        # CI/CD pipelines
├── src/tictactoe/            # Main package
│   ├── __init__.py           # Package initialization
│   ├── board.py              # Game logic
│   ├── cli.py                # Command-line interface
│   └── ai.py                 # AI implementation
├── tests/                    # Test suite
├── pyproject.toml            # Project configuration
├── .pre-commit-config.yaml   # Code quality hooks
└── README.md                 # This file
```

---

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b amazing-feature`)
3. Make your changes
4. Run the test suite (`pytest`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin amazing-feature`)
7. Open a Pull Request

### Development Guidelines

* Write tests for new features
* Maintain code coverage above 95%
* Follow PEP 8 style guidelines (enforced by black and flake8)
* Add type hints to new functions
* Update documentation as needed

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

* Classic Tic-Tac-Toe game rules
* Minimax algorithm for AI implementation
* Python community for excellent tooling
