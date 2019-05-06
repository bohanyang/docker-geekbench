FROM debian:stretch-slim

ARG GEEKBENCH_VERSION='4.3.3'

RUN deps='ca-certificates curl'; \
    set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends $deps; \
    curl -fsSLo 'Geekbench.tar.gz' "https://cdn.geekbench.com/Geekbench-$GEEKBENCH_VERSION-Linux.tar.gz"; \
    apt-get purge -y --auto-remove $deps; \
    tar -x -f 'Geekbench.tar.gz'; \
    rm 'Geekbench.tar.gz'; \
    mv "Geekbench-$GEEKBENCH_VERSION-Linux" '/root/Geekbench'

WORKDIR /root/Geekbench

CMD ["geekbench4"]
