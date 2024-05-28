# Configuracion docker

## Crear una Red

Al crear una red y conectar todos los contenederos a esa red, estos se pueden comunicar facilmente.

```bash
docker network create goals-net
```

- Para ver todas las redes disponibles
  > docker network ls

## Primera capa: MongoDB

- Ejecutar un contenedor de mongodb
  -v: Permite crear un volumen que garantice la persistencia de los datos incluso despues de eliminar el contenedor.

```bash
 docker run --name mongodb -v data:/data/db --rm -d --network goals-net mongo
```

## Segunda capa: Backend

- Crear la imagen

```bash
docker build -t goals-node ./backend
```

- Crear el contenedor
  --name: Da un nombre al contenedor
  --rm: (remove) Elimina el contenedor al detenerlo
  -d: Ejecutar en detached mode, permite seguir utilizando la consola
  -p: Publicar el puerto desde otras aplicaciones pueden acceder al contenedor, no necesario si todos estan dentro de docker y en la misma red. Sin embargo como el codigo de forntend d=se ejecuta en el browser, tecnicamente no esta en la red de docker, asi que el puerto debe ser expuesto.

```bash
docker run --name goals-backend --rm -d -p 80:80 --network goals-net goals-node
```

## Tercera capa: Frontend

- Crear la imagen

```bash
docker build -t goals-react ./frontend
```

- Crear el contendor
  -it: Iteractive mode, permite la iteracion con el contedor, se necesita para los proyectos de react ya que docker espera que este tipo de contenedores tenga alguna iteraccion con el.

```bash
docker run --name goals-frontend --network goals-net --rm -d -p 3000:3000 -it goals-react
```

# Docker compose

Permite lanzar todos los contenedores configurados al mismo tiempo

- Ejecutar docker-compose

  > docker-compose up -d

- Detener y remover el docker-compose
  > docker-compose down
