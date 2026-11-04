FROM ubuntu:resolute

COPY --from=certs ./desktop.local.crt /usr/local/share/ca-certificates/
ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/desktop.local.crt
ENV OLLAMA_HOST=https://desktop.local:8088

RUN apt-get update && \
  apt-get install -y --no-install-recommends bash build-essential ca-certificates curl git sudo && \
  rm -rf /var/lib/apt/lists/*

# To get around `fatal: detected dubious ownership in repository`
RUN git config --global --add safe.directory '*'

RUN update-ca-certificates

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/root/.config/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"
ENV PATH="/mise/shims:$PATH"
RUN curl https://mise.run | sh

COPY mise.toml /root/.config/mise/config.toml
RUN mise install

COPY --from=omp ./agent/config.yml /root/.omp/agent/config.yml

WORKDIR /workspace

ENTRYPOINT ["omp"]
