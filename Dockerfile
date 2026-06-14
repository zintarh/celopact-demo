FROM node:22-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run ui:build
RUN npx tsc --project tsconfig.build.json --skipLibCheck
EXPOSE 8787
CMD ["node", "server.js"]
