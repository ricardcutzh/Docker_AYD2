FROM ubuntu:16.04
#ENCARGADO DE LA IMAGEN
MAINTAINER "Ricardo Cutz"
#PAQUETES PARA INSTALAR
RUN apt-get update && apt-get install apache2 -y
RUN apt-get install -y software-properties-common
#INSTALANDO PHP 7
RUN apt-get install python-software-properties -y
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt install -y php7.1 \ 
    php7.1-xml \
    php7.1-mbstring \
    php7.1-mysql \
    php7.1-json \
    php7.1-curl \
    php7.1-cli \
    php7.1-common \
    php7.1-mcrypt \
    php7.1-gd \
    libapache2-mod-php7.1 \
    php7.1-zip
#COMPOSER
RUN apt-get -y install curl
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
#INSTALANDO GIT
RUN apt-get install -y git
#CONFIGURACIONES FINALES
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
#CONFIGURACIONES PARA QUE CORRRER
# COPIANDO EL ARCHIVO DE CONFIGURACION
RUN rm /etc/apache2/sites-available/000-default.conf
COPY 000-default.conf /etc/apache2/sites-available/
# CLONANDO EL REPO (AQUI PUEDE SER EL REPO DE LA APLICACION DE LARAVEL)
RUN cd var/www/html/ && git clone https://github.com/ricardcutzh/AYD2_TiendaEnLinea.git
# INSTALANDO CON COMPOSER (CAMBIAR POR EL NOMBRE DE LA APP)
RUN cd var/www/html/AYD2_TiendaEnLinea/ && composer install
# COPIANDO EL ARCHIVO ENV
COPY env var/www/html/AYD2_TiendaEnLinea/
RUN cd var/www/html/AYD2_TiendaEnLinea/ && mv -f env .env
RUN cd var/www/html/AYD2_TiendaEnLinea/ && php artisan key:generate
# COPIANDO EL ARCHIVO APACHE2.CONF
RUN rm /etc/apache2/apache2.conf
COPY apache2.conf /etc/apache2/
#CONFIGURACIONES FINALES
RUN chown -R www-data:www-data /var/www/html/AYD2_TiendaEnLinea
RUN chmod -R 777 /var/www/html/AYD2_TiendaEnLinea/storage
RUN a2enmod rewrite
# EXPONER EL PUERTO 80
EXPOSE 80
# RUNNING SH SCRIPT
COPY init.sh .
RUN chmod 777 init.sh
CMD ["sh", "init.sh"]
# Launch Apache
#CMD ["cd","var/www/html/AYD2_TiendaEnLinea/", "&&", "git", "pull"]
#CMD ["a2enmod", "rewrite"]
#CMD ["service", "apache2", "restart"]
#CMD ["cd","var/www/html/AYD2_TiendaEnLinea/", "&&", "php", "artisan", "migrate"]
#CMD ["cd","var/www/html/AYD2_TiendaEnLinea/", "&&", "php", "artisan", "db:seed"]
#CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
# RUN composer install (en el directorio donde esta la app) | HABILITAR EL .ENV | generar la llave