FROM golang:1.23.2-alpine3.19

LABEL version="golang-1.23 alpine-3.19" maintainer="lin"

ARG ACCESS_TOKEN
ARG USERNAME
ARG GIT_REGISTRY

# install gcc g++ git
RUN apk add --no-cache git make libtool autoconf bzip2 gcc g++ upx openssh

RUN go version && \
    gcc -v && \
    git version

# add ssh
RUN go env -w GONOPROXY="${GIT_REGISTRY}" && \
    go env -w GOPRIVATE="${GIT_REGISTRY}" && \
    git config --global http.extraheader "PRIVATE-TOKEN: ${ACCESS_TOKEN}" && \
    git config --global url."https://${USERNAME}:${ACCESS_TOKEN}@${GIT_REGISTRY}".insteadOf "https://${GIT_REGISTRY}"

WORKDIR $GOPATH