FROM ubuntu:22.04 as builder

RUN apt update && apt install -y make gcc

WORKDIR /app

COPY dnsproxy/ .

RUN make


FROM ubuntu:22.04

RUN apt update && apt install -y wget

COPY --from=builder /app/src/dnsproxy /usr/local/bin/dnsproxy

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["dnsproxy", "--hosts-file=/hosts"]
