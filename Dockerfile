# Specify the base image
FROM nginx:latest

# Copy the web application files to the Nginx default directory
COPY /var/jenkins_home/workspace/Jenkines-Pipeline /usr/share/nginx/html

