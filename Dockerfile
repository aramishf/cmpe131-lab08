FROM node:20.18-alpine

RUN apk update && apk upgrade --no-cache

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

EXPOSE 3000

CMD [ "node", "app.js" ]
