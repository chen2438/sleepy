# 构建: docker build -t username/sleepy:latest . --no-cache
# 推送: docker push username/sleepy:latest

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
