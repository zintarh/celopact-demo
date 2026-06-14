FROM node:22-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run ui:build
RUN ./node_modules/.bin/esbuild server.ts --bundle --platform=node --format=esm --outfile=server.mjs
EXPOSE 8787
CMD ["node", "server.mjs"]
