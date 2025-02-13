# Use the official Python image as the base image
FROM python:3.12

# Install NGINX
RUN apt-get update && apt-get install -y nginx

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY . .

# Copy NGINX configuration
COPY nginx.conf /etc/nginx/sites-available/default

# Expose necessary ports
EXPOSE 80

# Start NGINX and FastAPI when the container runs
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
