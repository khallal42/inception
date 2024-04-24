FROM debian:bullseye

RUN apt-get update && \ 
    apt-get install systemctl -y &&\
    apt-get install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306

COPY ./script.sh /
RUN chmod +x ./script.sh
CMD [ "./script.sh" ]