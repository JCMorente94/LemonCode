FROM node:18

WORKDIR /otp/app

COPY . .

RUN npm ci

EXPOSE 3000

CMD ["node", "server.js"]