#!/bin/bash

# start project with one file 
cd ~/workspace
sudo rm -r hexo_blog
su dsj
# mkdir hexo_blog 
# cd hexo_blog 
# git init 
# # git config --replace-all --local user.name "DingSJ101" 
# # git config --replace-all  --local user.email "1018966798@qq.com" 
# git remote add origin https://gitee.com/dsj_ws/hexo_blog.git
# git pull origin master
# git submodule update --init --recursive
# git clone https://gitee.com/dsj_ws/hexo_blog.git hexo_blog  #部署使用
# git clone git@gitee.com:starry101/hexo_blog.git  
git clone git@github.com:DingSJ101/hexo_blog.git  # 容器开发使用
cd hexo_blog


echo "### Stoping containers ..."
docker-compose down

echo "### Starting v ..."
docker-compose -f docker-compose.yml  up --force-recreate --build   


 