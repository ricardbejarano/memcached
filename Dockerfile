FROM alpine:3 AS build

ARG VERSION="1.6.31"
ARG CHECKSUM="20d8d339b8fb1f6c79cee20559dc6ffb5dfee84db9e589f4eb214f6d2c873ef5"

ARG OPENSSL_VERSION="3.3.2"
ARG OPENSSL_CHECKSUM="2e8a40b01979afe8be0bbfb3de5dc1c6709fedb46d6c89c10da114ab5fc3d281"

ARG LIBEVENT_VERSION="2.1.12-stable"
ARG LIBEVENT_CHECKSUM="92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"

ADD https://www.memcached.org/files/memcached-$VERSION.tar.gz /tmp/memcached.tar.gz
ADD https://github.com/openssl/openssl/releases/download/openssl-$OPENSSL_VERSION/openssl-$OPENSSL_VERSION.tar.gz /tmp/openssl.tar.gz
ADD https://github.com/libevent/libevent/releases/download/release-$LIBEVENT_VERSION/libevent-$LIBEVENT_VERSION.tar.gz /tmp/libevent.tar.gz

RUN [ "$(sha256sum /tmp/openssl.tar.gz | awk '{print $1}')" = "$OPENSSL_CHECKSUM" ] && \
    [ "$(sha256sum /tmp/libevent.tar.gz | awk '{print $1}')" = "$LIBEVENT_CHECKSUM" ] && \
    [ "$(sha256sum /tmp/memcached.tar.gz | awk '{print $1}')" = "$CHECKSUM" ] && \
    apk add gcc linux-headers make musl-dev perl && \
    tar -C /tmp -xf /tmp/openssl.tar.gz && \
    tar -C /tmp -xf /tmp/libevent.tar.gz && \
    tar -C /tmp -xf /tmp/memcached.tar.gz && \
    cd /tmp/openssl-$OPENSSL_VERSION && \
      ./config no-shared && \
      make && \
      make install && \
    cd /tmp/libevent-$LIBEVENT_VERSION && \
      ./configure && \
      make && \
      make install && \
    cd /tmp/memcached-$VERSION && \
      ./configure && \
      make LDFLAGS="-static"

RUN mkdir -p /rootfs/bin && \
      cp /tmp/memcached-$VERSION/memcached /rootfs/bin/ && \
    mkdir -p /rootfs/etc && \
      echo "nogroup:*:10000:nobody" > /rootfs/etc/group && \
      echo "nobody:*:10000:10000:::" > /rootfs/etc/passwd


FROM scratch

COPY --from=build --chown=10000:10000 /rootfs /

USER 10000:10000
EXPOSE 11211/tcp
ENTRYPOINT ["/bin/memcached"]
