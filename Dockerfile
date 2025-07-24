FROM python:3.11-slim

WORKDIR /app

# Copy source code first
COPY src/ src/
COPY pyproject.toml .
COPY README.md .

# Install the package
RUN pip install --no-cache-dir .

# Create non-root user
RUN useradd --create-home --shell /bin/bash app
USER app

# Set the entrypoint
ENTRYPOINT ["python", "-m", "src.tictactoe.cli"]
