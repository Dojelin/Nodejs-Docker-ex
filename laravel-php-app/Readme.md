# Docker compose

Ejecutar composer para crear un nuevo proyecto Laravel, no se neceita tener instalado las aplicaciones

> docker compose run --rm composer create-project --prefer-dist laravel/laravel

Levantar el resto de los servicios:
--build: si queremos crear nuevamente las imagenes

> docker compose up -d --build server

Artisan:

> docker compose run --rm artisan migrate
