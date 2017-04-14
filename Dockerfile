# Using a compact OS
FROM daocloud.io/nginx:1.11-alpine

MAINTAINER Golfen Guo <golfen.guo@daocloud.io>

# Add 2048 stuff into Nginx server
COPY . /usr/share/nginx/html
RUN mkdir /myvol
RUN echo "hello world" > /myvol/greeting2
VOLUME /home/ubuntu/dockervolume:/myvol

EXPOSE 80

# Start Nginx and keep it running background and start php
CMD sed -i "s/ContainerID: /ContainerID: "$(hostname)"/g" /usr/share/nginx/html/index.html && nginx -g "daemon off;"
