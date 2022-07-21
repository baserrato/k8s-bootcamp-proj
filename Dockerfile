FROM rust:1.62 as builder

RUN mkdir actix_serv

WORKDIR actix_serv

COPY actix_serv .

RUN cargo build --release

FROM debian:buster-slim

RUN mkdir comp

COPY --from=builder /actix_serv/target/release /usr/local/bin/actix_serv

ENTRYPOINT ["actix_serv"]
