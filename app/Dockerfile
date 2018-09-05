FROM ubuntu:18.04
RUN apt update

RUN apt install -y apache2 && apt-get clean

COPY ./index.html /var/www/html

EXPOSE 80

CMD apachectl -D FOREGROUND


