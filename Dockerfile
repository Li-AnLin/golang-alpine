FROM golang:1.15.2-alpine3.12

LABEL version="golang-1.15 alpine-3.12" maintainer="lin"

ARG key_file
ARG host_file
ARG pubkey_file

# add ssh
RUN mkdir ~/.ssh/
RUN chmod 400 ~/.ssh
RUN echo "$key_file" > ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa
RUN echo "$host_file" > ~/.ssh/known_hosts && chmod 600 ~/.ssh/known_hosts
RUN echo "$pubkey_file" > ~/.ssh/id_rsa.pub && chmod 600 ~/.ssh/id_rsa.pub

# ENV GOROOT /usr/local/go
# ENV GOPATH /go
# ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# install gcc g++ git
RUN apk add --no-cache git make libtool autoconf bzip2 gcc g++ upx openssh

RUN go version && \
    gcc -v && \
    git version

WORKDIR $GOPATH
