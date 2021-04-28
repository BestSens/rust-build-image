FROM rust
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y gcc-arm-linux-gnueabihf
COPY config ~/.cargo/config