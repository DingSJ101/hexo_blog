#!/bin/bash

echo "### Stoping nginx ..."
docker-compose down

# 启动容器
echo "### Starting nginx ..."
docker-compose -f docker-compose.yml -f ssl-override.yml up --force-recreate --build -d

# 是否启动完成
until [ "`docker inspect -f {{.State.Running}} nginx`"=="true" ]; do
    echo "### Wait nginx docker start ..."
    sleep 0.1;
done;

# 生成HTTPS证书
echo "### Gen nginx ssl ..."
docker exec nginx /bin/bash /var/www/ssl/refresh_cert.sh

# 重启nginx
echo "### Restart nginx ..."
docker exec nginx nginx -s reload