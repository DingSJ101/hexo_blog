#!/bin/bash

cd /var/www/blog

## 使用自己的文档仓库，通过ssh登录git，并使用git pull合并远程更新
# sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config # 关闭know_hosts检查
# git config --replace-all --global user.name "DingSJ101" 
# git config --replace-all  --global user.email "1018966798@qq.com"
 
# # 更新分支
# git fetch --all
# git reset --hard origin/master
# # 更新代码
# git pull origin master 

# # 导入组件
# git submodule init 
# git submodule add -f  https://github.com/next-theme/hexo-theme-next.git  ./blog/themes/next  # 主题
# git submodule add -f git@gitee.com:starry101/docs.git ./blog/source/_posts   # 文章
## 下载组件
# git submodule update --init --recursive
# git submodule foreach git pull origin master

# sed -i 's/StrictHostKeyChecking no/#   StrictHostKeyChecking ask/g' /etc/ssh/ssh_config

## 使用git clone 拉取文档仓库，不需要登录信息，但是每次都会重新下载所有文件并渲染
git clone  https://github.com/next-theme/hexo-theme-next.git  ./blog/themes/next
git clone https://gitee.com/starry101/docs.git ./blog/source/_posts   # 文章


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
hexo g 

## hexo-abbrlink 中的 auto category 插件的 title 填充问题（先生成abbrlink，再填充title）
## meta中不包含title的文章生成的abbrlink为0
# hexo g
# hexo g 

npm run talk  # 初始化gitalk评论
## 部署
# hexo d
# hexo server -p 4000


# webhook自动部署
cd ..
webhook-cli --port 4000 --hooks hooks.json --verbose