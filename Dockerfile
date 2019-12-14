FROM debian:stretch-slim

ARG GEEKBENCH_VERSION='4.4.2'

RUN set -ex; \
    apt-get update; \
    apt-get install -y wget; \
    wget -qO 'Geekbench.tar.gz' "https://cdn.geekbench.com/Geekbench-$GEEKBENCH_VERSION-Linux.tar.gz"; \
    apt-get purge -y --auto-remove wget; \
    tar -x -f 'Geekbench.tar.gz'; \
    rm 'Geekbench.tar.gz'; \
    mv "Geekbench-$GEEKBENCH_VERSION-Linux" '/root/Geekbench'

CMD ["/root/Geekbench/geekbench4"]
