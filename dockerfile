ARG ALPINE_VERSION=3.18
ARG MOUNTPOINT_S3_VERSION=1.10.0

FROM alpine:${ALPINE_VERSION}
ARG MOUNTPOINT_S3_VERSION

RUN apk add gcc curl git zlib g++ cmake make pkgconfig fuse fuse-dev clang
RUN curl -sSf https://sh.rustup.rs -o rustup.sh && sh rustup.sh -y
RUN git clone --depth 1 -b v${MOUNTPOINT_S3_VERSION} --recurse-submodules https://github.com/awslabs/mountpoint-s3.git

WORKDIR /mountpoint-s3

RUN \
    RUSTFLAGS="-C target-feature=-crt-static" \
    /root/.cargo/bin/cargo build --release

CMD ["tail", "-f", "/dev/null"]