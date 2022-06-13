#!/bin/bash

cd /var/www/blog/blog

# 更新代码
# git pull && git submodule foreach git pull origin master
git pull origin master


# 生成静态资源
npm install --force
hexo clean
hexo g
# hexo d

# webhook自动部署
webhook-cli --port 4000 --hooks hooks.json --verbose