# Use a Python base image
FROM python:latest

# Set working directory in the container
WORKDIR /app

# Copy requirements.txt to the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the rest of the backend files to the container
COPY . .

# Set environment variables if needed
# ENV ENV_VARIABLE value

# Expose the port the app runs on
EXPOSE 8080

# Command to start the application
CMD ["python", "app.py"]
