# Configuracion docker

## Primera capa: MongoDB

- Ejecutar un contenedor de mongodb

```bash
 docker run --name mongodb --rm -d mongo
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
  -p: Publicar el puerto desde otras aplicaciones pueden acceder al contenedor, no necesario si todos estan dentro de docker y en la misma red.

```bash
docker run --name goals-backend --rm -d -p 80:80 goals-node
```

## Tercera capa: Frontend

- Crear la imagen

```bash
docker build -t goals-react ./frontend
```

- Crear el contendor
  -it: Iteractive mode, permite la iteracion con el contedor, se necesita para los proyectos de react ya que docker espera que este tipo de contenedores tenga alguna iteraccion con el.

```bash
docker run --name goals-frontend --rm -d -p 3000:3000 -it goals-react
```
