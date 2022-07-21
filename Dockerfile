FROM rust:1.62 as builder

RUN mkdir workLog

WORKDIR workLog

COPY workLog .

RUN cargo build --release

FROM debian:buster-slim

RUN mkdir comp

COPY --from=builder /workLog/target/release /usr/local/bin/workLog

ENTRYPOINT ["workLog"]
