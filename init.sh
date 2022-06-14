#!/bin/bash

## start project with one file 
# cd ~/workspace
# sudo rm -r hexo_blog
# mkdir hexo_blog 
# cd hexo_blog 
# git init 
# git config --replace-all --local user.name "DingSJ101" 
# git config --replace-all  --local user.email "1018966798@qq.com" 
# git remote add origin https://github.com/DingSJ101/hexo_blog.git
# git pull origin master

echo "### Stoping containers ..."
docker-compose down

echo "### Starting v ..."
docker-compose -f docker-compose.yml  up --force-recreate --build -d