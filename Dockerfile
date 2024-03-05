FROM rust:1.76.0-slim-bookworm
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y mingw-w64
# RUN rustup toolchain install stable-x86_64-pc-windows-gnu
RUN rustup target add x86_64-pc-windows-gnu
COPY config $CARGO_HOME/config

ADD openssl_native.tar.gz /opt/openssl-3