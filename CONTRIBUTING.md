# Contributing to Tic-Tac-Toe

🎉 **Thank you for your interest in contributing to our Tic-Tac-Toe project!** 🎉

We welcome contributions from everyone and appreciate your help in making this project better. This guide will help you get started with contributing.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Workflow](#development-workflow)
- [Style Guidelines](#style-guidelines)
- [Testing Guidelines](#testing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Issue Guidelines](#issue-guidelines)
- [Community](#community)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## 🚀 Getting Started

### Prerequisites

- Python 3.8 or higher
- Git
- A GitHub account

### Development Setup

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/tic-tac-toe.git
   cd tic-tac-toe
   ```

3. **Set up the development environment**:
   ```bash
   # Create virtual environment
   python -m venv venv
   
   # Activate virtual environment
   # On Windows:
   venv\Scripts\activate
   # On macOS/Linux:
   source venv/bin/activate
   
   # Install development dependencies
   pip install -e ".[dev]"
   
   # Install pre-commit hooks
   pre-commit install
   ```

4. **Add the upstream remote**:
   ```bash
   git remote add upstream https://github.com/v-s-v-i-s-h-w-a-s/tic-tac-toe.git
   ```

## 🤝 How to Contribute

### Types of Contributions

We welcome several types of contributions:

- 🐛 **Bug fixes**
- ✨ **New features**
- 📝 **Documentation improvements**
- 🧪 **Test additions**
- 🎨 **Code refactoring**
- 🔧 **CI/CD improvements**

### Before You Start

1. **Check existing issues** and pull requests to avoid duplication
2. **Open an issue** for new features or major changes to discuss the approach
3. **Start with small contributions** if you're new to the project

## 🔄 Development Workflow

### 1. Create a Branch

```bash
# Update your local main branch
git checkout main
git pull upstream main

# Create a new feature branch
git checkout -b feature/your-feature-name
# OR for bug fixes
git checkout -b fix/bug-description
```

### 2. Make Your Changes

- Write clean, readable code
- Follow the existing code style
- Add tests for new functionality
- Update documentation as needed

### 3. Test Your Changes

```bash
# Run all tests
pytest

# Run tests with coverage
pytest --cov=src --cov-report=html

# Run specific tests
pytest tests/test_board.py

# Check code quality
black src/ tests/
isort src/ tests/
flake8 src/ tests/
pylint src/
```

### 4. Commit Your Changes

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```bash
# Good commit messages
git commit -m "feat: add multiplayer support"
git commit -m "fix: resolve AI move calculation bug"
git commit -m "docs: update installation instructions"
git commit -m "test: add board validation tests"
```

### 5. Push and Create Pull Request

```bash
# Push your branch
git push origin feature/your-feature-name

# Create a pull request on GitHub
```

## 🎨 Style Guidelines

### Python Code Style

- **Use Black** for code formatting (automatic with pre-commit)
- **Use isort** for import sorting (automatic with pre-commit)
- **Follow PEP 8** guidelines
- **Use type hints** for all function parameters and return values
- **Write docstrings** for all public functions and classes

### Example

```python
def calculate_score(board: Board, player: str) -> int:
    """Calculate the score for a given player on the board.
    
    Args:
        board: The game board to evaluate
        player: The player symbol ('X' or 'O')
        
    Returns:
        The calculated score for the player
        
    Raises:
        ValueError: If player is not 'X' or 'O'
    """
    if player not in ['X', 'O']:
        raise ValueError(f"Invalid player: {player}")
    
    return board.get_score(player)
```

### Documentation Style

- Use **Markdown** for documentation files
- Include **code examples** where helpful
- Keep **line length** under 100 characters
- Use **emoji** sparingly and consistently

## 🧪 Testing Guidelines

### Writing Tests

- **Write tests** for all new functionality
- **Update tests** when modifying existing code
- **Use descriptive test names**
- **Follow the AAA pattern**: Arrange, Act, Assert

### Test Structure

```python
def test_board_make_move_valid_position():
    """Test that making a move on a valid position works correctly."""
    # Arrange
    board = Board()
    
    # Act
    result = board.make_move(0, 0, 'X')
    
    # Assert
    assert result is True
    assert board.get_cell(0, 0) == 'X'
```

### Coverage Requirements

- Maintain **>95% test coverage**
- All new code must be covered by tests
- Integration tests for CLI functionality

## 📤 Pull Request Process

### Before Submitting

- [ ] All tests pass locally
- [ ] Code follows style guidelines
- [ ] Documentation is updated
- [ ] Commit messages follow conventions
- [ ] Branch is up to date with main

### PR Template

When creating a pull request, use this template:

```markdown
## Description
Brief description of the changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Other (please describe)

## Testing
- [ ] All existing tests pass
- [ ] New tests added for new functionality
- [ ] Manual testing completed

## Checklist
- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No breaking changes (or breaking changes documented)
```

### Review Process

1. **Automated checks** must pass (CI/CD)
2. **Code review** by maintainers
3. **Address feedback** promptly
4. **Squash commits** if requested
5. **Merge** once approved

## 🐛 Issue Guidelines

### Bug Reports

Use the bug report template and include:

- **Clear title** and description
- **Steps to reproduce** the issue
- **Expected vs actual behavior**
- **Environment details** (Python version, OS, etc.)
- **Screenshots** if applicable

### Feature Requests

Use the feature request template and include:

- **Clear description** of the proposed feature
- **Use case** and motivation
- **Possible implementation** approach
- **Alternatives considered**

### Issue Labels

We use these labels to categorize issues:

- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Improvements to docs
- `good first issue` - Good for newcomers
- `help wanted` - Extra attention needed
- `question` - Further information requested

## 🌟 Recognition

Contributors are recognized in several ways:

- **Contributors section** in README
- **Release notes** mention significant contributions
- **GitHub contributors** page
- **Special thanks** in project announcements

## 💬 Community

### Getting Help

- **GitHub Issues** - For bugs and feature requests
- **GitHub Discussions** - For questions and general discussion
- **Code Reviews** - Learn from feedback on your PRs

### Communication Guidelines

- Be **respectful** and **constructive**
- **Ask questions** if you're unsure
- **Help others** when you can
- **Share knowledge** and experiences

## 📚 Additional Resources

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Python PEP 8](https://www.python.org/dev/peps/pep-0008/)
- [Pytest Documentation](https://docs.pytest.org/)

---

**Thank you for contributing to our project! 🚀**

Your contributions help make this project better for everyone. If you have any questions, don't hesitate to ask in the issues or discussions.
