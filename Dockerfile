FROM alpine:latest
#MAINTAINER Dr
#更新Alpine的软件源为国内（清华大学）的站点，因为从默认官源拉取实在太慢了。。。
#RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories
# RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && \
    apk upgrade 

# shell
RUN apk add --no-cache fish nano bash wget
# 修改时区
RUN apk add tzdata && \
    cp /usr/share//zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 获取临时的工具
# RUN apk add apt wget
#获取需要保留的工具
# RUN apk add --no-cache apt wget 

# 要执行的第一步操作



# WORKDIR /root
# RUN mkdir -p /root/.lantern
# 复制配置文件
# COPY settings.yaml /root/.lantern/settings.yaml

# ENV NODE_ENV=production


# VOLUME [ "/etc/dhcp" ]
# 安装自启动项目
# RUN apk add --no-cache openrc && \
# 	rc-update add dhcpd && \
# 	rc-service dhcpd start

# 清理临时应用
RUN rm -rf /var/cache/apk/*


#用户：
ENV NAME_USER dr
RUN addgroup -S $NAME_USER && adduser -S $NAME_USER -G $NAME_USER
USER $NAME_USER
WORKDIR /home/$NAME_USER

# 设置权限
# RUN chmod 777 /home/node/bin/*

# EXPOSE 59900/tcp 8087/tcp

# CMD ["npm","start"] 
# ENTRYPOINT ["/usr/bin/lantern", "--configdir=/root", "--headless=true", "--proxyall=true", "--startup=false", "--clear-proxy-settings=false"]


# docker run -it --name glass --net=host --restart=always -v /home/pi/dhcp:/etc/dhcp -p 8085:8080 -p 8086:3000 alpine/glass