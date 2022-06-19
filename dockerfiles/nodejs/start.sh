#!/bin/bash

cd /var/www/blog


git config --replace-all --global user.name "DingSJ101" 
git config --replace-all  --global user.email "1018966798@qq.com"

## 更新分支
git fetch --all
git reset --hard origin/master
# 更新代码
git pull origin master 
git submodule add https://gitee.com/dsj_ws/yilia-plus.git ./blog/themes/yilia-plus
git submodule update --init --recursive
git submodule foreach git pull origin master

cd blog

# 生成静态资源

npm i hexo-generator-json-content --save
npm install hexo-deployer-git --save
npm install --force
hexo clean
hexo g -d 
# hexo d

cd ..

# webhook自动部署
webhook-cli --port 4000 --hooks hooks.json --verbose