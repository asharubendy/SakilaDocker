FROM mysql
MAINTAINER abending@softwareinstitute.com
VOLUME /var/lib/mysql

ARG MYSQL_DATABASE_NAME="sakila"
ARG RANDOMPASSWORD=1
ARG USERNAME="USER"
ARG PASSWORD="PASSWORD"

ENV MYSQL_DATABASE=$MYSQL_DATABASE_NAME
ENV MYSQL_RANDOM_ROOT_PASSWORD=$RANDOMPASSWORD
ENV MYSQL_USER=$USERNAME
ENV MYSQL_PASSWORD=$PASSWORD

WORKDIR /docker-entrypoint-initdb.d
COPY sakila01-schema.sql .
COPY sakila02-data.sql .

VOLUME sqldb:/var/lib/mysql

EXPOSE 3306

# docker run -p 3306:3306 -v sqldb:/var/lib/mysql --name sqldb abending/sakilladb:latest