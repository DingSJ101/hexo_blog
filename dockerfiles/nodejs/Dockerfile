FROM node:12-alpine

WORKDIR /var/www/blog

RUN echo "Asia/Shanghai" > /etc/timezone \
    && echo "https://mirrors.ustc.edu.cn/alpine/v3.9/main/" > /etc/apk/repositories  \
    && npm config set registry https://registry.npm.taobao.org \
    && apk add --no-cache git bash ssh \
    && npm install hexo-cli -g \
    && npm install webhook-cli -g \
    && npm install hexo-deployer-git --save 

ADD *.sh /
RUN chmod 777 /*.sh


ENTRYPOINT ["sh", "/start.sh"]

EXPOSE 4000
# RUN git init \
#     && rm -r .git \
#     && git init \
#     && git config --replace-all --local user.name "DingSJ101" \
#     && git config --replace-all  --local user.email "1018966798@qq.com" \
#     && git remote add origin https://github.com/DingSJ101/hexo_blog.git

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

# # 安装 icarus 主题需要的依赖  
# RUN npm install --save bulma-stylus@0.8.0 inferno inferno-create-element hexo-renderer-inferno hexo-component-inferno  
# # 方便图片附件引用  
# RUN npm install hexo-asset-image --save  
# # 资源压缩  
# RUN npm install hexo-all-minifier --save  
# # 生成唯一链接  
# RUN npm install hexo-abbrlink --save  
# # 生成sitemap，优化SEO  
# RUN npm install --save hexo-generator-sitemap hexo-generator-baidu-sitemap  
# # 手动编译optipng-bin，否则会报错，找不到文件  
# RUN node node_modules/optipng-bin/lib/install.js  
# # 下载 icarus 主题  
# RUN curl -o "theme.zip" -L https://github.com/ppoffice/hexo-theme-icarus/archive/refs/tags/4.4.0.zip  
# RUN unzip theme.zip -d themes/  
# RUN mv themes/hexo-theme-icarus-4.4.0 themes/icarus  
# RUN rm -f theme.zip  
# # 配置 hexo 使用 icarus 主题  
# RUN sed -i "s/landscape/icarus/g" _config.yml  
# # 删除默认 landscape 主题  
# RUN npm uninstall hexo-theme-landscape --save  
# RUN rm -f _config.landscape.yml
# RUN rm -r -f themes/landscape

