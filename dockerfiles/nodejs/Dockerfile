FROM node:12-alpine

RUN echo "Asia/Shanghai" > /etc/timezone \
    && echo "https://mirrors.ustc.edu.cn/alpine/v3.9/main/" > /etc/apk/repositories  \
    && npm config set registry https://registry.npm.taobao.org \
    && apk add --no-cache git bash \
    && npm install hexo-cli -g \
    && npm install webhook-cli -g 

ADD *.sh /
RUN chmod 777 /*.sh

EXPOSE 4000

ENTRYPOINT ["sh", "/start.sh"]


    # && npm install hexo-deployer-git --save \
    # && npm install hexo-generator-json-content@2.2.0 --save \
    # && npm install hexo-renderer-jade@0.3.0 --save \
    # && npm install hexo-renderer-stylus --save \
    # && rm -rf source themes 
    
#以上都是在安装配置git和Hexo，使用hexo-deployer-git插件推送到远端，
#另外三个插件是我选的主题所需要的，可以不安装

# ADD themes ./themes
# ADD _config.yml ./
#将主题文件夹拷贝到镜像中，主配置文件拷贝到镜像中，这些都是在宿主机中配置好



