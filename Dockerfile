FROM glanceapp/glance:latest

COPY glance.yml /app/glance.yml

EXPOSE 8080

CMD ["/app/glance"]