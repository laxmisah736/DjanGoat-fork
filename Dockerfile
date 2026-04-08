# Start from Python image
python:3.11-slim

# Install git and build tools
apt-get update && \
    apt-get install -y --no-install-recommends git build-essential && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
/app

# Copy project files
. /app

# Install Python dependencies if you have requirements.txt
pip install --no-cache-dir -r requirements.txt

# Expose port (example)
8000

# Command to run
["python", "manage.py", "runserver", "0.0.0.0:8000"]
