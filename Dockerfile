FROM ubuntu:focal

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ /etc/localtime
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt update -y
RUN apt install php8.0 libapache2-mod-php8.0 -y
COPY web.conf /etc/apache2/sites-available/web.conf
RUN a2disite 000-default.conf
RUN a2ensite web.conf
RUN service apache2 restart
