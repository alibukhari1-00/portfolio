FROM python:3.10-slim

WORKDIR /app

# Install system dependencies for building
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY main.py .
COPY cv.json .

# Set environment
ENV PORT=8000
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["python", "main.py"]
