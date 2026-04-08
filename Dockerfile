# Dockerfile
FROM python:3.11-slim

# Install git and build tools
RUN apt-get update && apt-get install -y git build-essential && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

CMD ["gunicorn", "DjanGoat.wsgi:application", "--bind", "0.0.0.0:8000"]
