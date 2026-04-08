FROM python:3.11-slim

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install git and build tools
apt-get update && \
apt-get install -y --no-install-recommends git build-essential && \
rm -rf /var/lib/apt/lists/*
