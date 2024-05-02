FROM oven/bun:alpine as builder

WORKDIR /home/bun/app

COPY . .

RUN bun install && \
    bun run build

FROM oven/bun:alpine

WORKDIR /home/bun/app

COPY --chown=bun:bun --from=builder /home/bun/app/build ./build
COPY --chown=bun:bun static ./static
COPY --chown=bun:bun /home/bun/app/package.json /home/bun/app/bun.lockb ./

ENV ORIGIN=https://tf.yam-yam.dev
ENV PORT=3000
ENV PROTOCOL_HEADER=x-forwarded-proto
ENV HOST_HEADER=x-forwarded-host

COPY --from=node:20-alpine /usr/lib /usr/lib
COPY --from=node:20-alpine /usr/local/share /usr/local/share
COPY --from=node:20-alpine /usr/local/lib /usr/local/lib
COPY --from=node:20-alpine /usr/local/include /usr/local/include
COPY --from=node:20-alpine /usr/local/bin /usr/local/bin

RUN bun install --production --frozen-lockfile

USER bun

CMD ["node", "build"]
