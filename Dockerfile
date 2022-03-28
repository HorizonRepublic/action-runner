FROM summerwind/actions-runner:latest

RUN sudo apt-get update -y \
    && sudo apt-get install -y wget ca-certificates gnupg2 \
    && sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list" \
    && sudo wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_20.04/Release.key -O /tmp/Release.key \
    && sudo apt-key add - < /tmp/Release.key \
    && sudo apt-get -y update -qq \
    && sudo apt-get -qq -y install buildah \
    && sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update -y \
    && sudo apt-get install -y fuse-overlayfs \
    && mkdir -vp ~/.config/containers \
    && printf "[storage.options]\nmount_program=\"/usr/bin/fuse-overlayfs\"" > ~/.config/containers/storage.conf \
    && sudo rm -rf /var/lib/apt/lists/*
