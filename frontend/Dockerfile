# Etapa de construcción
FROM node:alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install @mui/material @mui/icons-material uuid
COPY . .
RUN npm run build

# Etapa de producción
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx/conf.d /etc/nginx/conf.d
RUN ls -la /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]