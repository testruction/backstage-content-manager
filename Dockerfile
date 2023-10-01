FROM docker.io/library/node:18-bookworm-slim

COPY . .
RUN npm install . -g