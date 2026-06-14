FROM node:22-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run ui:build
RUN node_modules/.bin/esbuild server.ts --bundle --platform=node --outfile=server.cjs
EXPOSE 8787
CMD ["node", "server.cjs"]
