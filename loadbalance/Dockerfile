FROM nginx:latest

RUN apt-get update \
    && apt install vim -y\
    && rm /etc/nginx/nginx.conf
    

COPY nginx.conf /etc/nginx/nginx.conf
WORKDIR /etc/nginx/
EXPOSE 80
