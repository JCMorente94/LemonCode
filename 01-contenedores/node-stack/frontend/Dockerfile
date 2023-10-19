FROM oven/bun:1.0.6

WORKDIR /otp/app

COPY ./package.json .

RUN bun i

COPY . .

EXPOSE 3000

CMD ["bun", "server.js"]