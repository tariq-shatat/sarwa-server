
## Build
FROM golang:1.16-alpine as build 

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY src ./src

RUN go build -o assignment ./src/

CMD [ "./assignment" ]

## Deploy
FROM alpine as prod

WORKDIR /

COPY --from=build ./app/assignment ./assignment

EXPOSE 8000

ENTRYPOINT ["./assignment"]