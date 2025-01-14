使用默认推荐插件

安装新的插件：chinese中文

Blue Ocean Dashboard

Bitbucket Branch Sourc 源码管理

[Generic Webhook Trigger] 钩子函数，提交代码自动更新

subversion





```
node -v
npm -v

# 解决存放在Github上的sass无法下载的问题
SASS_BINARY_SITE=https://npm.taobao.org/mirrors/node-sass/ npm install node-sass
# 将镜像源替换为淘宝的加速访问
npm config set registry https://registry.npm.taobao.org

npm install
npm run build

# 删除旧的部署文件
rm -rf /www/wwwroot/bs/trunk/*

# 将构建的结果复制到Nginx的web目录
cp -r /root/.jenkins/workspace/bs/dist/* /www/wwwroot/bs/trunk/


# 使用sed命令替换文件中的文本
# sed -i 's|/static/|/UnitOverviewMap/|g' /www/wwwroot/bs/trunk/index.html

# 获取当前日期和时间，格式为"2023-07-27 14:04:48"
current_date=$(date "+%Y-%m-%d %H:%M:%S")

# 在index.html的第一行添加当前日期和时间，包裹在HTML注释中
sed -i "1i<!-- $current_date -->" /www/wwwroot/bs/trunk/index.html
```

