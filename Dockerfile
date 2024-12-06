# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Copy the index.html into the default Nginx public directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for web access
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
