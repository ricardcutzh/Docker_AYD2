#!/bin/bash
docker exec -it tienda1 /bin/bash
cd var/www/html/AYD2_TiendaEnLinea/
php artisan migrate
php artisan db:seed