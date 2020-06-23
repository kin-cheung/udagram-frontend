# Use NodeJS base image
FROM node:13
# Create app directory
WORKDIR /www/data
 
COPY nginx.conf /etc/nginx/nginx.conf

COPY . .

RUN npm install

RUN npm run build

RUN apt-get update \
    && apt-get install -y nginx --option=Dpkg::Options::=--force-confdef\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 8080

CMD ["nginx"]
