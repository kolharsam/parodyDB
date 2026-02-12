FROM rust:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    libreadline-dev \
    zlib1g-dev \
    flex \
    bison \
    libxml2-dev \
    libxslt-dev \
    libssl-dev \
    libxml2-utils \
    xsltproc \
    ccache \
    pkg-config \
    libicu-dev \
    libclang-dev \
    clang \
    gosu \
    && rm -rf /var/lib/apt/lists/*

RUN cargo install --locked cargo-pgrx --version 0.16.1

# Create non-root user — Postgres refuses to run initdb as root
RUN useradd -m -s /bin/bash developer \
    && chown -R developer:developer /usr/local/cargo /usr/local/rustup

USER developer
RUN cargo pgrx init --pg17 download

# Switch back to root so entrypoint can fix volume permissions
USER root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /parodydb
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
