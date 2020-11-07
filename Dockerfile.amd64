FROM alpine
RUN apk add --no-cache curl

ENV UPDATE_DELAY=30

WORKDIR /app

COPY ./update_ydns.sh /app/update_ydns.sh
CMD sh /app/update_ydns.sh
