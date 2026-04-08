# Dockerfile
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy requirements
COPY requirements.txt .

# Install Python dependencies (with git timeout)
RUN pip install --default-timeout=100 -r requirements.txt

# Copy project code
COPY . .

# Expose Django default port
EXPOSE 8000

# Run the app
CMD ["gunicorn", "DjanGoat.wsgi:application", "--bind", "0.0.0.0:8000"]
