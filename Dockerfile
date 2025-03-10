# 多平台构建预备: docker buildx create --name mybuilder --driver docker-container --bootstrap --use
# 构建和推送: docker buildx build --platform linux/amd64,linux/arm64 -t chen2438/sleepy:latest --push .

FROM python:3.10-slim

WORKDIR /app

# 复制依赖文件
COPY requirements.txt .

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目文件
COPY . .

# 暴露端口
EXPOSE 9010

# 设置环境变量
ENV PYTHONUNBUFFERED=1

# 启动服务
CMD ["python3", "server.py"]
