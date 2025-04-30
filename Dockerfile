# Use an official nginx image to serve static files
FROM nginx:alpine

# Copy your HTML files into the nginx directory
COPY . /usr/share/nginx/html

# Expose the port the app runs on
EXPOSE 80
