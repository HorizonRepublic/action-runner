FROM ghcr.io/actions-runner-controller/actions-runner-controller/actions-runner-dind:latest

COPY --from=docker/buildx-bin /buildx /usr/libexec/docker/cli-plugins/docker-buildx
COPY --from=docker/buildx-bin /buildx /usr/local/lib/docker/cli-plugins/docker-buildx
RUN docker buildx version
