FROM golang:alpine as first

WORKDIR /go/src/app
COPY . .
RUN mkdir ./out
RUN go build -o ./out -ldflags="-s -w" main.go

FROM scratch

COPY --from=first /go/src/app/out .

CMD ["/main"]