#!/bin/bash
echo "Iniciando configuracion de contenedor"
cd var/www/html/AYD2_TiendaEnLinea/ && git pull
a2enmod rewrite
service apache2 restart
cd var/www/html/AYD2_TiendaEnLinea/ && php artisan migrate
cd var/www/html/AYD2_TiendaEnLinea/ && php artisan db:seed
/usr/sbin/apache2ctl -DFOREGROUND
echo "finalizo las configuraciones"