# Build application
FROM node:12-alpine as builder

WORKDIR '/app'

COPY package*.json ./
RUN npm install

COPY public ./public
COPY src ./src

RUN npm run build

# Serve application

FROM nginx:1.17-alpine

COPY --from=builder /app/build /usr/share/nginx/html