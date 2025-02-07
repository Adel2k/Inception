FROM debian:bullseye

RUN apt update && \
    apt install -y nodejs npm --fix-missing && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools /

CMD ["node", "/tools/run-website.js"]
