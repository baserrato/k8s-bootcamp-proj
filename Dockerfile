FROM rust:1.62 as builder

RUN mkdir actix_serv

WORKDIR actix_serv

COPY actix_serv/ .

RUN cargo build

FROM debian:buster-slim

COPY --from=builder /actix_serv/target/debug/ /usr/local/bin/

CMD ["actix_serv"]
