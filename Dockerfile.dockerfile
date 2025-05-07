FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server locales sudo wget 
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Node exporter install
RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz \
    && tar xvfz node_exporter-* --strip-components=1 \
    && mv node_exporter /usr/local/bin/ \
    && rm -rf node_exporter-*

RUN useradd --system --create-home --home-dir /home/ubuntu --shell /bin/bash --gid root --groups sudo --uid 1000 node

ENV LANG=eng_US.utf8

RUN echo 'node:node1234' | chpasswd

RUN service ssh start

# 22 for ssh and 8080 for http (prometheus metrics
EXPOSE 22 8080

CMD ["sh", "-c", "/usr/sbin/sshd -D & /usr/local/bin/node_exporter --web.listen-address=':8080'"]
