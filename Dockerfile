FROM node:8.9.4-alpine

ENV APP /nuxtjs
WORKDIR $APP

RUN apk --update add --virtual build-deps \
    build-base \
		&& apk add \
		make \
		tzdata \
		git \
  && rm -rf /var/cache/apk/* \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY . $APP

RUN npm install
RUN npm build

ENV HOST 0.0.0.0
ENV PORT 3333

CMD ["npm", "run", "start"]
