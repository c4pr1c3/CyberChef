FROM node:18-alpine AS build

COPY . .
RUN npm config set registry https://registry.npmmirror.com && npm ci
RUN npm run build

FROM nginx:1.25-alpine3.18 AS cyberchef

COPY --from=build ./build/prod /usr/share/nginx/html/
