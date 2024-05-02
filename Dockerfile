FROM oven/bun:alpine as builder

WORKDIR /home/bun/app

COPY . .

RUN bun install && \
    bun run build

FROM oven/bun:alpine

WORKDIR /home/bun/app

COPY --chown=bun:bun --from=builder /home/bun/app/package.json /home/bun/app/bun.lockb ./
COPY --chown=bun:bun --from=builder /home/bun/app/build ./build

ENV ORIGIN=https://tf.yam-yam.dev
ENV PORT=3000

RUN bun install

USER bun

CMD ["bun", "build/index.js"]
