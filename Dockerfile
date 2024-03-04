FROM rust:1.76.0-slim-bookworm
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y gcc-arm-linux-gnueabihf mingw-w64
# RUN rustup toolchain install stable-x86_64-pc-windows-gnu
RUN rustup target add arm-unknown-linux-gnueabihf
RUN rustup target add x86_64-pc-windows-gnu
COPY config $CARGO_HOME/config

ADD openssl_native.tar.gz /opt/openssl-3
ADD openssl_arm.tar.gz /opt/boneos/2.0.3/sysroots/cortexa9hf-vfp-neon-poky-linux-gnueabi/opt/openssl-3