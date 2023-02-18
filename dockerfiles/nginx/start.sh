#!/bin/bash
# 前台启动
nginx -g "daemon off;"

# docker run -d -p 80:80 -p 443:443 -v ~/workspace/hexo_blog/blog:/var/www/blog -v /etc/nginx:/etc/nginx -v ~/workspace/hexo_blog/nginx/hexo.conf:/etc/nginx/conf.d/hexo.conf nginx
