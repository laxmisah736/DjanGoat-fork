# Use lightweight Python image
FROM python:3.10-slim

# Environment settings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    netcat-openbsd \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (for caching)
COPY requirements.txt .

# Upgrade pip
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install -r requirements.txt

# Install production server
RUN pip install gunicorn

# Copy full project
COPY . .

# Expose Django port
EXPOSE 8000

# Run app using Gunicorn (production)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "DjanGoat.wsgi:application"]
