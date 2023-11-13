FROM node:18-alpine AS builder

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制项目文件到工作目录
COPY . .

RUN npm run build

FROM node:18-alpine

# 设置工作目录
WORKDIR /app

COPY --from=builder /app/dist ./dist

# 复制 package.json 和 package-lock.json
COPY --from=builder /app/package*.json ./

# 安装生产依赖
RUN npm install --only=production

# 定义环境变量
ENV NODE_ENV=production

# 启动Next.js应用
CMD ["npm", "start"]
