FROM glanceapp/glance:latest

COPY glance.yml /app/config/glance.yml

EXPOSE 8080