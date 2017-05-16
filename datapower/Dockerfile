FROM ibmcom/datapower:latest
ENV DATAPOWER_ACCEPT_LICENSE=true \
    DATAPOWER_WORKER_THREADS=2 \
    DATAPOWER_INTERACTIVE=true
COPY config/ /drouter/config/
COPY local/ /drouter/local/
EXPOSE 80 443 9090
