#!/bin/bash
echo "Iniciando configuracion de contenedor"
echo "... apache ..."
a2enmod rewrite
service apache2 restart
echo "... TIENDA ..."
cd var/www/html/AYD2_TiendaEnLinea/ && git pull
php artisan migrate
php artisan db:seed
echo "... FOREGROUD ..."
/usr/sbin/apache2ctl -DFOREGROUND
echo "finalizo las configuraciones"