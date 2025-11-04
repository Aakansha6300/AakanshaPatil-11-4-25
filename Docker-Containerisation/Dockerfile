# Use official NGINX image from the Docker Hub as base image
FROM nginx:latest

# Copy the sample web application files to the NGINX html directory
COPY ./html /usr/share/nginx/html

# Expose port 80 for accessing the webserver
EXPOSE 80

# Command to run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
