FROM ubuntu:latest
RUN apt-get update && apt install python3 && apt install git && apt install apache2 && apt-get clean -y
RUN apt install openssh-server -y

RUN useradd jenkins && \
    echo "jenkins:jenkins" | chpasswd

EXPOSE 80
EXPOSE 22

RUN systemctl enable --now sshd
CMD ["apachectl", "-D", "FOREGROUND"]
