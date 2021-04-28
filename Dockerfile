FROM rust
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y gcc-arm-linux-gnueabihf
RUN rustup toolchain install stable-x86_64-pc-windows-gnu
RUN rustup target add arm-unknown-linux-gnueabihf
RUN rustup target add x86_64-pc-windows-gnu
COPY config $CARGO_HOME/config