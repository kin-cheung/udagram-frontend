FROM nginx:alpine

# Create app directory
WORKDIR /wwww/data
 
COPY nginx.conf /etc/nginx/nginx.conf

COPY . .

RUN ionic build

COPY ./www/. /www/data/.