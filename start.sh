#!/bin/sh

# 使用Render提供的环境变量UUID替换config.json中的默认UUID
sed -i "s/6a9a3b9a-1a3a-4a7a-9a0a-3a5a8a1a2a0a/${UUID}/" /app/config.json

# 启动Xray
/app/xray -config /app/config.json
