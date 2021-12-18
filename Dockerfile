FROM ubuntu:22.04

RUN apt update && apt install -y wget unzip

WORKDIR /root/.updns

RUN wget https://github.com/wyhaya/updns/releases/download/v0.1.5/updns-v0.1.5-x86_64-unknown-linux-gnu.zip \
&& unzip updns-v0.1.5-x86_64-unknown-linux-gnu.zip && rm updns-v0.1.5-x86_64-unknown-linux-gnu.zip

COPY . .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["./updns"]