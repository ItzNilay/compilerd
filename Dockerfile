FROM docker.io/library/node:20.13.0-alpine

ENV PYTHONUNBUFFERED=1

RUN set -ex && \
    apk add --no-cache \
    gcc g++ musl-dev python3 openjdk17 ruby iptables ip6tables \
    go php7 php7-cli swift rust cargo kotlin perl haskell ghc scala lua lua-dev

RUN set -ex && \
    apk add --no-cache chromium lsof

RUN set -ex && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/cc1obj && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/lto1 && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/lto-wrapper && \
    rm -f /usr/bin/x86_64-alpine-linux-musl-gcj

RUN ln -sf python3 /usr/bin/python

ADD . /usr/bin/
ADD start.sh /usr/bin/

RUN npm --prefix /usr/bin/ install
RUN npm install -g typescript ts-node

ENV GOROOT=/usr/lib/go
ENV PATH=$GOROOT/bin:$PATH

EXPOSE 8080

RUN addgroup -S -g 2000 runner && adduser -S -D -u 2000 -s /sbin/nologin -h /tmp -G runner runner

USER runner
CMD sh /usr/bin/start.sh

