# Instalacion de APP

Instrucciones para desplegar la app

## Instalacion

### PASO 1
correr el archivo docker-compose.yml

```bash
docker-compose up -d
```

### PASO 2
correr las migraciones en un contenedor

```bash
docker exec -it tienda1 /bin/bash

cd var/www/html/AYD2_TiendaEnLinea/
php artisan migrate
php artisan db:seed
exit
```
### PASO 3
ahora la aplicacion esta siendo servida por el puerto 80 utilizando el load balancer de haproxy con docker

## Autor
Ricardo Cutz Hernandez
