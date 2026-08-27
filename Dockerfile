FROM node:24-slim
WORKDIR /src

COPY ./package.json ./package.json
COPY ./pnpm-lock.yaml ./pnpm-lock.yaml
COPY ./pnpm-workspace.yaml ./pnpm-workspace.yaml
RUN npm install -g pnpm@11 && \
    pnpm install

ENV NODE_ENV=production
ENTRYPOINT ["pnpm", "drizzle:migrate"]
VOLUME ["/src/drizzle", "/src/drizzle.config.ts"]
