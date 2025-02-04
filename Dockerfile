FROM rust:1.84.1
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install --no-install-recommends -y \
	mingw-w64 \
	cmake \
	nodejs && \
	rm -Rf /var/lib/apt/lists/*
RUN git clone --branch openssl-3.4.0 --depth 1 https://github.com/openssl/openssl.git && \
	cd openssl && \
	./Configure --cross-compile-prefix=x86_64-w64-mingw32- mingw64 --prefix=/usr/lib/x86_64-w64-mingw32 && \
	make -j 6 && make install && \
	cd .. && \
	rm -Rf openssl
RUN rustup target add x86_64-pc-windows-gnu
COPY config.toml /.cargo/config.toml