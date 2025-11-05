FROM alpine:latest

# 安装必要的工具
RUN apk update && apk add --no-cache bash curl

# 下载并安装Xray
RUN mkdir /app && \
    curl -L -o /app/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /app/xray.zip -d /app && \
    rm /app/xray.zip && \
    chmod +x /app/xray

# 复制配置文件和启动脚本
COPY config.json /app/config.json
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# 暴露端口并设置启动命令
EXPOSE 8080
CMD ["/app/start.sh"]
