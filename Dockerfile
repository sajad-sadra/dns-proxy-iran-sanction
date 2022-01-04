FROM ubuntu:22.04 as builder

WORKDIR /app

RUN apt update && apt install -y make gcc git && \
git clone https://github.com/vietor/dnsproxy.git && \
cd dnsproxy && make

FROM ubuntu:22.04

RUN apt update && apt install -y wget

COPY --from=builder /app/dnsproxy/src/dnsproxy /usr/local/bin/dnsproxy

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["dnsproxy", "--hosts-file=/hosts"]
