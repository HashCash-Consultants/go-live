FROM golang:1.14
WORKDIR /go/src/github.com/hcnet/go

COPY . .
ENV GO111MODULE=on
RUN go install github.com/hcnet/go/tools/...
RUN go install github.com/hcnet/go/services/...
