FROM debian:bullseye

EXPOSE 3306

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY conf/maria_db_conf.cnf	/etc/mysql/mariadb.conf.d/maria_db_conf.cnf

COPY tools/init_db.sh /etc/mysql/init_db.sh

RUN chmod +x /etc/mysql/init_db.sh

ENTRYPOINT ["/etc/mysql/init_db.sh"]

CMD ["mariadbd"]