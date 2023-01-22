FROM ghcr.io/izzthedude/base:latest

COPY etc /etc

RUN rpm-ostree install -y asusctl supergfxctl asusctl-rog-gui && \
    systemctl enable supergfxd.service && \
    ostree container commit
