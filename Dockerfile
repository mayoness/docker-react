# first section build
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second section run
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

