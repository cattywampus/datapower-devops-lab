FROM ubuntu:latest
RUN  apt-get update && \
     apt-get -y install curl
COPY bin/ /usr/local/bin/
CMD  ["/usr/local/bin/client.sh", "http://datapower", "https://datapower"]
