.PHONY: help clean setup test lint format coverage benchmark docker-build docker-run docs release

# Default target showing help when running just 'make'
help:
	@echo "Tic-Tac-Toe Make Commands"
	@echo "-----------------------"
	@echo "setup        Install development dependencies"
	@echo "clean        Remove build artifacts and temporary files"
	@echo "test         Run tests"
	@echo "lint         Run all linters"
	@echo "format       Format code with black and isort"
	@echo "coverage     Generate test coverage report"
	@echo "benchmark    Run performance benchmarks"
	@echo "docker-build Build Docker image"
	@echo "docker-run   Run game in Docker container"
	@echo "docs         Build documentation"
	@echo "release      Package and release to PyPI"

# Setup development environment
setup:
	pip install -e ".[dev]"
	pre-commit install

# Clean up artifacts and temporary files
clean:
	rm -rf build/ dist/ *.egg-info/ .coverage htmlcov/ .pytest_cache/ .mypy_cache/ .tox/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type d -name "*.pyc" -delete

# Run tests
test:
	pytest

# Run all linters
lint:
	pre-commit run --all-files
	flake8 src tests
	pylint src
	mypy src

# Format code
format:
	black src tests
	isort src tests

# Generate test coverage report
coverage:
	pytest --cov=src --cov-report=html --cov-report=term

# Run performance benchmarks
benchmark:
	pytest --benchmark-only

# Build Docker image
docker-build:
	docker build -t tic-tac-toe .

# Run in Docker
docker-run:
	docker run -it --rm tic-tac-toe

# Build documentation
docs:
	mkdir -p docs/build
	# placeholder for future documentation generation

# Package and release
release:
	python -m build
	twine check dist/*
	@echo "Run 'twine upload dist/*' to publish to PyPI"

# Run with specific arguments
run:
	python -m src.tictactoe.cli $(filter-out $@,$(MAKECMDGOALS))

# Testing with specific parameters
test-specific:
	pytest $(filter-out $@,$(MAKECMDGOALS))

# Allow passing arguments to Python CLI
%:
	@:
