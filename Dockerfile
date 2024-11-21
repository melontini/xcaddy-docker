FROM caddy:2.9.0-beta.3-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.0-beta.3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
