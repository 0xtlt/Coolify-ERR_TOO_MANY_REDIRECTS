FROM node:21-slim

USER root

WORKDIR /usr/src/app

RUN apt-get update -y && apt-get install -y openssl curl

RUN npm install -g pnpm

COPY package.json ./
COPY pnpm-lock.yaml ./

RUN pnpm install --prod

COPY . .

EXPOSE 3000

ARG DATABASE_URL
ENV DATABASE_URL=${DATABASE_URL}

RUN pnpm run build

CMD ["npm", "run", "docker"]
