FROM node:lts-alpine
WORKDIR /app/

ENV PORT=3001
EXPOSE 3001

RUN apk add tini
ENTRYPOINT ["/sbin/tini", "--"]

RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm/ \
    npm ci --omit=dev

COPY . .
CMD ["node", "src/index.js"]