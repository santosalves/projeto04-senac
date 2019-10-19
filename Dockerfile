FROM ubuntu:latest

RUN export DEBIAN_FRONTEND=noninteractive \
    && ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && apt-get update \
    && apt-get install -y \
    tzdata \
    apache2 \
    php7.2-mysql \
    php7.2 \
    libapache2-mod-php7.2 \
    vim \
    curl \
    && apt-get autoclean \
    && rm -rf /var/www/html/* \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /bin/wp

ENV APACHE_LOCK_DIR="/var/lock"
ENV APACHE_PID_FILE="/var/run/apache2.pid"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_RUN_GROUP="www-data"
ENV APACHE_LOG_DIR="/var/log/apache2"

ADD https://br.wordpress.org/latest-pt_BR.tar.gz /var/www/html
WORKDIR /var/www/html
RUN tar -zxf latest-pt_BR.tar.gz && cp -r wordpress/* /var/www/html
COPY wp-config.php /var/www/html/
COPY install.php /var/www/html/wp-admin/

VOLUME /var/www/html/
EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD [ "-D", "FOREGROUND" ]
