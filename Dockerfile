
FROM python:3.12

# Set the working directory
WORKDIR /app

COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
RUN apt update && apt install -y nginx


COPY nginx.conf /etc/nginx/nginx.conf


EXPOSE 80

# Start Nginx and the FastAPI app
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
