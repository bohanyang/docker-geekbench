FROM debian:stretch-slim

ARG GEEKBENCH_VERSION='4.3.3'

RUN deps='ca-certificates wget'; \
    set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends $deps; \
    wget -O '/root/Geekbench.tar.gz' "https://cdn.geekbench.com/Geekbench-$GEEKBENCH_VERSION-Linux.tar.gz"; \
    apt-get purge -y --auto-remove $deps; \
    tar -C '/root' -x -f '/root/Geekbench.tar.gz'; \
    rm '/root/Geekbench.tar.gz'; \
    mv "/root/Geekbench-$GEEKBENCH_VERSION-Linux" '/root/Geekbench'

CMD ["/root/Geekbench/geekbench4"]
