FROM ubuntu/bind9
WORKDIR /
RUN apt-get update && \
      apt-get -y install sudo
RUN  sudo apt-get install python3 -y && apt install python3-pip -y
COPY ./adsblocker.py /etc/bind/adsblocker.py
COPY ./named.conf /etc/bind/named.conf
COPY ./entrypoint.sh /etc/bind/entrypoint.sh
ENV TZ=UTC
RUN chmod 755 /etc/bind/entrypoint.sh
ENTRYPOINT ["sh","/etc/bind/entrypoint.sh"]



