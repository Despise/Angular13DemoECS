FROM node:latest as build
WORKDIR /app

RUN npm i -g @angular/cli@13.2.1

COPY ./package.json .
RUN npm i
COPY . .
RUN ng build

FROM nginx as runtime
COPY --from=build /app/dist/angular13-demo-ecs /usr/share/nginx/html