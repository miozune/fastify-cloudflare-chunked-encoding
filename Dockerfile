FROM node:latest
ENV NODE_ENV=production
WORKDIR /app
RUN npm install -g pnpm@10.14.0

COPY fastify-app/package.json fastify-app/pnpm-lock.yaml ./
RUN pnpm install --prod --frozen-lockfile
COPY fastify-app/src ./src

USER node
EXPOSE 3000
CMD ["node", "src/server.ts"]
