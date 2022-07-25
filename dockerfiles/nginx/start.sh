#!/bin/bash

# 前台启动
nginx -g "daemon off;"

# docker run -d -p 80:80 -p 443:443 -v ~/workspace/hexo_blog/blog:/var/www/blog -v /etc/nginx:/etc/nginx -v ~/workspace/hexo_blog/nginx/hexo.conf:/etc/nginx/conf.d/hexo.conf nginx

version: '3'
services:

  nginx:
    restart: always
    build: ./dockerfiles/nginx
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - "~/workspace/hexo_blog/blog:/var/www/blog"
      - "/etc/nginx:/etc/nginx"
      - "./nginx/hexo.conf:/etc/nginx/conf.d/hexo.conf"
    container_name: "hexo_nginx"

  nodejs:
    restart: always
    build: ./dockerfiles/nodejs
    ports:
      - "4000:4000"
    volumes:
      - "~/workspace/hexo_blog:/var/www/blog"
      - "/etc/localtime:/etc/localtime"
      - "~/.ssh/id_rsa:/root/.ssh/id_rsa"
    container_name: "hexo_nodejs"
    