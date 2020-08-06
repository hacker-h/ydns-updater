FROM alpine
RUN apk add curl

ENV UPDATE_DELAY=30

WORKDIR /app

COPY ./command.sh /app/command.sh
CMD sh /app/command.sh
