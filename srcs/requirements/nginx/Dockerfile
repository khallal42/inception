FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx

RUN mkdir -p /etc/ssl/

RUN apt-get update && \
    apt-get install -y openssl

COPY ./script.sh /bin

RUN chmod +x /bin/script.sh

EXPOSE 443

CMD ["script.sh"]