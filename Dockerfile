FROM ubuntu:latest
RUN apt-get update -y && apt install python3 -y && apt install git -y && apt install apache2 -y && apt-get clean -y
RUN apt install openssh-server -y

#user creation for ssh connection
RUN useradd jenkins && \
    echo "jenkins:jenkins" | chpasswd       

EXPOSE 80
EXPOSE 22

RUN systemctl enable --now ssh

CMD ["apachectl", "-D", "FOREGROUND"]
