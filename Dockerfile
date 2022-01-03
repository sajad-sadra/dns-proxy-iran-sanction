FROM ubuntu:22.04 as builder

WORKDIR /app

RUN apt update && apt install -y make gcc wget unzip && \
wget https://github.com/vietor/dnsproxy/archive/refs/tags/1.1.1.zip && unzip 1.1.1.zip && cd dnsproxy-1.1.1 && make


FROM ubuntu:22.04

RUN apt update && apt install -y wget

COPY --from=builder /app/src/dnsproxy /usr/local/bin/dnsproxy

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["dnsproxy", "--hosts-file=/hosts"]
