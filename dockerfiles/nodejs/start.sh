#!/bin/bash

cd /var/www/blog

sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config
git config --replace-all --global user.name "DingSJ101" 
git config --replace-all  --global user.email "1018966798@qq.com"
 
# 更新分支
git fetch --all
git reset --hard origin/master
# 更新代码
git pull origin master 

# 导入组件
git submodule init 
git submodule add -f  https://github.com/next-theme/hexo-theme-next.git  ./themes/next  # 主题
git submodule add -f git@gitee.com:starry101/docs.git ./source/_posts   # 文章
git submodule update --init --recursive
git submodule foreach git pull origin master

sed -i 's/StrictHostKeyChecking no/#   StrictHostKeyChecking ask/g' /etc/ssh/ssh_config

cd blog

# 插件
npm install -D md5 moment request xml-parser
npm install -S hexo-generator-sitemap
npm install hexo-generator-json-content --save
npm install hexo-abbrlink --save  
npm install hexo-generator-searchdb --save
npm install hexo-deployer-git --save
npm install --force

# 生成静态资源
hexo clean
## hexo-abbrlink 中的 auto category 插件的 title 填充问题（先生成abbrlink，再填充title）
## meta中不包含title的文章生成的abbrlink为0
hexo g 
hexo g
hexo g 
npm run talk  # 初始化gitalk评论
# hexo d
# hexo server -p 4000


# webhook自动部署
cd ..
webhook-cli --port 4000 --hooks hooks.json --verbose