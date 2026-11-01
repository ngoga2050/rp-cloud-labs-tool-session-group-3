# Use Python 3.11 as the base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application source code
COPY . .

# Expose the Flask application port
EXPOSE 5000

# Start the Flask API
CMD ["python", "app.py"]
