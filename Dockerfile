FROM ghcr.io/actions/actions-runner:latest
LABEL authors="labring-sigs"

RUN sudo apt update -y \
      && sudo apt install -y uidmap fuse-overlayfs podman && \
      URL="https://github.com/labring/sealos/releases/download/v5.1.1/sealos_5.1.1_linux_amd64.tar.gz" && \
      curl -sfL $URL | sudo tar zx -C /usr/local/bin/ sealos && \
      sudo chmod a+x /usr/local/bin/sealos && \
      sudo sealos version && \
      sudo podman version && sudo podman pull quay.io/skopeo/stable:latest