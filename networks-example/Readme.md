- Crear una network en Docker:

> docker network create favorites-net

Se ejecutan dos contenedores, uno para MongoDb y otro para la aplicacion

- MongoDB Container:

> docker run -d --name mongodb mongo

Si quiere iniciar el contenedor dentro de una network que permita a los contenedores comunicarse:

> docker run -d --name mongodb --network favorites-net mongo

El contenedor puede ser inspeccionado para obtener el Networks->IPAdress donde se esta ejecutando:

> docker inspect mongodb

- Crear la imagen de la aplicacion:

> docker build -t favorites-node .

- Ejecutar el contenedor de la aplicacion:
  -d detached mode
  --rm remove the conteiner after stop
  -p expose port

> docker run --name favorites -d --rm -p 3000:3000 favorites-node

o agregando a una network:

> docker run --name favorites --network favorites-net -d --rm -p 3000:3000 favorites-node
