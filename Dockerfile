FROM nginx:alpine

RUN echo '<h1>My Jenkins CI/CD Pipeline</h1><p>Built and pushed automatically!</p>' > /usr/share/nginx/html/index.html

EXPOSE 80