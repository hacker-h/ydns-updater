FROM alpine
RUN apk add --no-cache bash curl

ENV UPDATE_DELAY=30

WORKDIR /app

COPY ./command.sh /app/command.sh
CMD bash /app/command.sh
