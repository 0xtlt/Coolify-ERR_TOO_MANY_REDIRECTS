FROM node:21-slim
USER root
WORKDIR /usr/src/app
RUN apt-get update -y && apt-get install -y openssl curl
COPY package.json ./
COPY . .
EXPOSE 3000
CMD ["npm", "run", "docker"]
