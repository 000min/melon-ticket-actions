FROM node:lts-alpine
MAINTAINER MooYeol Prescott Lee "mooyoul@gmail.com"

RUN mkdir -p /var/task/

WORKDIR /var/task

COPY package.json package-lock.json /var/task/
RUN npm ci

COPY . /var/task/

RUN npm run build          # 여기서 빌드 수행 (dist/index.js 생성)

ENTRYPOINT ["/var/task/entrypoint.sh"]