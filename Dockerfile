FROM nginx:1-alpine-slim

RUN echo '<h1>My Jenkins CI/CD Pipeline - Version 6</h1><p>Supply Chain Security - SBOM and SLSA Provenance!</p>' > /usr/share/nginx/html/index.html

EXPOSE 80