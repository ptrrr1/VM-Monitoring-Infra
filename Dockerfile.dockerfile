FROM ubuntu:20.04

RUN apt update && apt install openssh-server sudo -y

RUN useradd --system --create-home --home-dir /home/ubuntu --shell /bin/bash --gid root --groups sudo --uid 1000 node

RUN echo 'node:node1234' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
