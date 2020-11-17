FROM golang:1.14-stretch AS builder

WORKDIR /go/src/github.com/hcnet/go
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN go install github.com/hcnet/go/services/aurora

FROM ubuntu:18.04

ENV HCNET_CORE_VERSION 14.1.1-1355-5b2989d3
ENV HCNET_CORE_BINARY_PATH /usr/local/bin/hcnet-core

# ca-certificates are required to make tls connections
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget


RUN apt-get install -y --no-install-recommends libpqxx-4.0v5 curl
RUN wget -O hcnet-core.deb https://s3.amazonaws.com/hcnet.org/releases/hcnet-core/hcnet-core-${HCNET_CORE_VERSION}_amd64.deb
RUN dpkg -i hcnet-core.deb
RUN rm hcnet-core.deb

RUN apt-get clean

COPY --from=builder /go/bin/aurora ./

ENTRYPOINT ["./aurora"]
