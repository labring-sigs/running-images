# syntax=docker/dockerfile:1.7-labs

FROM ghcr.io/actions/actions-runner:latest
LABEL authors="labring-sigs"

USER root

# 支持多架构自动下载 sealos
ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH}

# 安装 podman、curl 等基础工具
RUN apt-get update -y && \
    apt-get install -y uidmap fuse-overlayfs curl && \
    rm -rf /var/lib/apt/lists/*

# 安装 sealos（多架构支持）
# 文件名：sealos_5.1.1_linux_amd64.tar.gz or sealos_5.1.1_linux_arm64.tar.gz
RUN curl -sfL "https://github.com/labring/sealos/releases/download/v5.1.1/sealos_5.1.1_linux_${TARGETARCH}.tar.gz" \
    | tar zx -C /usr/local/bin/ sealos && \
    chmod +x /usr/local/bin/sealos

RUN sealos version
