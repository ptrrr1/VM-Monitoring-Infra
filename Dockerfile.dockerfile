FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends openssh-server locales sudo 
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN useradd --system --create-home --home-dir /home/ubuntu --shell /bin/bash --gid root --groups sudo --uid 1000 node

ENV LANG=eng_US.utf8

RUN echo 'node:node1234' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
