FROM node:12-alpine

WORKDIR /var/www/blog

RUN echo "Asia/Shanghai" > /etc/timezone \
    && echo "https://mirrors.ustc.edu.cn/alpine/v3.9/main/" > /etc/apk/repositories  \
    && npm config set registry https://registry.npm.taobao.org \
    && apk add --no-cache git bash openssh \
    && npm install hexo-cli -g \
    && npm install webhook-cli -g 

ADD *.sh /
RUN chmod 777 /*.sh


ENTRYPOINT ["sh", "/start.sh"]

EXPOSE 4000

