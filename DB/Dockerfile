FROM mariadb:latest

ENV MYSQL_ROOT_PASSWORD ZurichDb
COPY setup.sh /mysql/setup.sh
COPY CreateTablesDB.sql /mysql/setup.sql
RUN /mysql/setup.sh

EXPOSE 3306