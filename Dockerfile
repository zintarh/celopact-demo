FROM node:22-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run ui:build
EXPOSE 8787
CMD ["npx", "tsx", "server.ts"]
