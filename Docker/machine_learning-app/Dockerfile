# Dockerfile

# Use a Python base image
FROM python:3.9

# Set working directory inside the container
WORKDIR /app

# Copy requirements.txt to the working directory
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire current directory into the container's working directory
COPY . .

# Command to run the Python application
CMD ["python", "app.py"]
