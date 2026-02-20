FROM alpine:3.21

ARG MDBOOK_VERSION=v0.5.2

RUN apk add --no-cache curl \
    && curl -sSL "https://github.com/rust-lang/mdBook/releases/download/${MDBOOK_VERSION}/mdbook-${MDBOOK_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
       | tar -xz -C /usr/local/bin \
    && apk del curl

WORKDIR /book
EXPOSE 3000

CMD ["mdbook", "serve", "--hostname", "0.0.0.0", "--port", "3000"]
