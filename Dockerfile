FROM node:16-alpine as builder

WORKDIR /app

COPY /package.json ./

RUN npm install 

COPY . .

CMD ["npm","run","build"]



# Stage 2: Serve the build directory using Nginx
FROM nginx:1.30-alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]




