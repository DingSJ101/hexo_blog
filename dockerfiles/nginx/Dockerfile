FROM nginx:latest

# 启动脚本和配置
ADD *.sh /
ADD nginx.conf /etc/nginx/nginx.conf

# HTTPS证书生成脚本
ADD ssl/* /var/www/ssl/
RUN chmod +x /var/www/ssl/*.sh

RUN chmod 777 -R /var/log/nginx

ENTRYPOINT ["sh", "/start.sh"]
