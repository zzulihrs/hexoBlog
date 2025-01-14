https://gitcode.csdn.net/66ca0b12aa1c2020b359a8e4.html?dp_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MjczNDczNywiZXhwIjoxNzMyMzY0NDc0LCJpYXQiOjE3MzE3NTk2NzQsInVzZXJuYW1lIjoid2VpeGluXzQ0MDcwMjg5In0.EzgZhT_Lp4srFT8Iyt7GuK7hG9s_ydRjEHSLCktWhHg&spm=1001.2101.3001.6650.2&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7Ebaidujs_baidulandingword%7Eactivity-2-135058896-blog-143207117.235%5Ev43%5Epc_blog_bottom_relevance_base9&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7Ebaidujs_baidulandingword%7Eactivity-2-135058896-blog-143207117.235%5Ev43%5Epc_blog_bottom_relevance_base9&utm_relevant_index=5

1. 首先获取宿主机IP

```
wsl中运行;
ip route |grep default|awk '{print $3}'
172.18.160.1
```

1. 在wsl2的虚拟机中运行以下命令，若想一直开启宿主机代理，也可写入`vim ~/.zshrc`，然后使用`source ~/.zshrc`，7890是宿主机网络代理端口

```
export https_proxy="http://172.18.160.1:7890"
export http_proxy="http://172.18.160.1:7890"
export all_proxy="sock5://172.18.160.1:7890"
export ALL_PROXY="sock5://172.18.160.1:7890"
```

1. 若不想一直开启宿主机代理，设置命令开启或者关闭使用宿主机代理，在`vim ~/.zshrc`中写入，然后使用`source ~/.zshrc`

```
alias setp='export https_proxy="http://172.25.144.1";export http_proxy="http://172.25.144.1:7890";export all_proxy="socks5://172.25.144.1:7890";export ALL_PROXY="socks5://172.25.144.1:7890";'
alias unsetp='unset https_proxy; unset http_proxy; unset all_proxy; unset ALL_PROXY;'

```

在终端输入setp即可开启代理， 输入unsetp 即可解除代理





【WSL】解决“wsl: 检测到 localhost 代理配置，但未镜像到 WSL。NAT 模式下的 WSL 不支持 localhost 代理“



在Windows中的 “C:\Users<your_username>” 目录下创建一个.wslconfig文件，然后在文件中写入如下内容

```
[experimental]
autoMemoryReclaim=gradual  
networkingMode=mirrored
dnsTunneling=true
firewall=true
autoProxy=true

```

然后在windows的cmd上用wsl --shutdown关闭WSL，之后再重启，提示就消失了。





```
sudo tee /etc/docker/daemon.json <<EOF
{
    "registry-mirrors": [
        "https://docker.1ms.run",
        "https://hub.rat.dev",
        "https://docker.1panel.live"
        "https://daocloud.io/library",
    ]
}
EOF
```

