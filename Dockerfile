FROM debian:bullseye

#USER root

RUN apt update && \
    apt -y install iptables iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER root

ENTRYPOINT ["sh", "-c", "iptables -P INPUT ACCEPT && \
    iptables -P FORWARD ACCEPT && \
    iptables -P OUTPUT ACCEPT && \
    iptables -F && \
    exec $0"] 

CMD ["bash", "tail", "-f", "/dev/null"]
