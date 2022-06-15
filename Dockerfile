# syntax=docker/dockerfile:1

#using Alpine as it has small footprint
FROM golang:1.16-alpine

WORKDIR /app

# To download necessary Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# Copying source codes
COPY *.go ./

#
RUN go build -o /custom

EXPOSE 2112

CMD [ "/custom" ]
