Ejecutar el contenedor:

docker run -p 3000:80 -d --name feedback-app --rm -v feedback:/app/feedback -v "/Users/dojelinquijada/app/nodejs-app-starting-setup/docker-complete:/app" -v /app/node_modules feedback-node
