FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y php7.4 php7.4-mysql php7.4-curl php7.4-fpm  && \
    rm -rf /var/lib/apt/lists/* && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar &&\
    mv wp-cli.phar /bin/wp
COPY ./script.sh /bin
RUN chmod +x /bin/script.sh
RUN mkdir -p /run/php/


EXPOSE 9000
CMD [ "script.sh" ]
#php7.4-bcmath php7.4-gd php7.4-soap php7.4-zip php-mbstring php-gd php-xml php-intl