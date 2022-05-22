# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/engine/reference/builder/#from
# https://hub.docker.com/_/node
FROM node:16-bullseye-slim AS build
# https://docs.docker.com/engine/reference/builder/#workdir
WORKDIR /app
# https://docs.docker.com/engine/reference/builder/#copy
# COPY multiple(local) dst(image)
COPY package.json package-lock.json ./
RUN npm ci
# https://docs.docker.com/engine/reference/builder/#copy
# COPY src(local) dst(image)
COPY . .
RUN npm run build

# https://hub.docker.com/_/nginx
FROM nginx:1.21-alpine
COPY --from=build /app/build /usr/share/nginx/html

# TODO: docker image build . -t frontend:v1
# TODO: docker container run -p 7777:80 frontend:v1